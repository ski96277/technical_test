import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamleance_technecal_test/model/booked_model.dart';
import 'package:teamleance_technecal_test/pref/pref_const.dart';
import 'package:teamleance_technecal_test/routes/app_routes.dart';
import 'package:teamleance_technecal_test/utils/color_const.dart';
import 'package:teamleance_technecal_test/utils/text_style.dart';
import 'package:teamleance_technecal_test/viewModel/home_screen_vm.dart';
import 'package:teamleance_technecal_test/widget/loading_overlay.dart';
import 'package:teamleance_technecal_test/widget/places_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

 var home =  Get.put(HomeScreenVM());


  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeScreenVM>(builder: (homeScreenVM) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "homeTitle".tr,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                Pref.removeAllValue();
                FirebaseAuth.instance.signOut().then((value) {
                  Get.offAllNamed(AppRoutes.loginScreen);
                });
              },
            )
          ],
        ),

        body: LoadingOverlay(
          isLoading: homeScreenVM.isLoading,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "bookedPlace".tr,
                          style: getTextStyleNormalW5(fontSize: 0.025),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.placeListScreen,arguments: homeScreenVM.placeBookingList);
                          },
                          child: Row(
                            children: [
                              Text(
                                "seeAll".tr,
                                style: getTextStyleNormal(color: ColorConst.lightGreen!),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: ColorConst.lightGreen,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: homeScreenVM.placeBookingList.isEmpty
                          ? Center(
                              child: Text("emptyDialog".tr),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: homeScreenVM.placeBookingList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.placeDetailsScreen, arguments: homeScreenVM.placeBookingList[index]);
                                    },
                                    child: PlacesItem(homeScreenVM.placeBookingList[index]));
                              }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "availableBook".tr,
                          style: getTextStyleNormalW5(fontSize: 0.025),
                        ),
                        Row(
                          children: [
                            Text(
                              "seeAll".tr,
                              style: getTextStyleNormal(color: ColorConst.lightGreen!),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: ColorConst.lightGreen,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                          itemCount: homeScreenVM.placeModelList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.placeDetailsScreen, arguments: homeScreenVM.placeModelList[index]);
                                },
                                child: PlacesItem(homeScreenVM.placeModelList[index]));
                          }),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
