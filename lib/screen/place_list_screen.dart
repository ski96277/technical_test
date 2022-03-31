import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teamleance_technecal_test/routes/app_routes.dart';
import 'package:teamleance_technecal_test/utils/color_const.dart';
import 'package:teamleance_technecal_test/utils/text_style.dart';
import 'package:teamleance_technecal_test/viewModel/home_screen_vm.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenVM>(builder: (placeListVM) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Booked Places"),
          ),
          body: placeListVM.placeBookingList.isEmpty
              ? Center(
                  child: Text(
                    "empty".tr,
                    style: getTextStyleNormal(),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: placeListVM.placeBookingList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.toNamed(AppRoutes.placeDetailsScreen, arguments: placeListVM.placeBookingList[index]),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ColorConst.whiteColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 7, top: 7, left: 2),
                                height: 100,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: FadeInImage.assetNetwork(
                                    fadeOutCurve: Curves.bounceIn,
                                    placeholder: "assets/images/default_image.png",
                                    imageErrorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        "assets/images/default_image.png",
                                      );
                                    },
                                    fit: BoxFit.cover,
                                    image: "${placeListVM.placeBookingList[index].placeImage}",
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 5,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 3),
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${placeListVM.placeBookingList[index].placeTitle}",
                                        style: getTextStyleNormalW5(fontSize: 0.016),
                                      ),
                                      Text(
                                        placeListVM.placeBookingList[index].placeType!,
                                        style: getTextStyleNormal(color: ColorConst.greyColor, fontSize: 0.014),
                                      ),
                                      const Spacer(),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.date_range_outlined,
                                            color: Colors.black54,
                                            size: 20,
                                          ),
                                          Text(
                                            DateFormat('yyyy-MM-dd')
                                                .format(DateTime.fromMicrosecondsSinceEpoch(placeListVM.placeBookingList[index].dataFrom!.microsecondsSinceEpoch)),
                                            style: getTextStyleNormal(fontSize: 0.015),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                      const Spacer(),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Price: ",
                                            style: getTextStyleNormalW5(fontSize: 0.015),
                                          ),
                                          Text(
                                            "${placeListVM.placeBookingList[index].currency} ${placeListVM.placeBookingList[index].amount} ",
                                            style: getTextStyleNormal(fontSize: 0.015, color: ColorConst.lightGreen!),
                                          ),
                                          Text(
                                            " / ${placeListVM.placeBookingList[index].days} days",
                                            style: getTextStyleNormal(
                                              fontSize: 0.015,
                                              color: ColorConst.greyColor,
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 1.0, right: 7, top: 44),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.orange.withOpacity(0.1),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 2), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: ColorConst.whiteColor,
                                        ),
                                      )),
                                )),
                          ],
                        ),
                      ),
                    );
                  }));
    });
  }
}
