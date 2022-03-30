import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teamleance_technecal_test/model/booked_model.dart';
import 'package:teamleance_technecal_test/utils/app_utils.dart';
import 'package:teamleance_technecal_test/utils/color_const.dart';
import 'package:teamleance_technecal_test/utils/text_style.dart';
import 'package:teamleance_technecal_test/viewModel/place_details_vm.dart';
import 'package:teamleance_technecal_test/widget/custom_button.dart';
import 'package:teamleance_technecal_test/widget/loading_overlay.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PLaceDetailsVM>(builder: (placeDetailsVM) {
      return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: placeDetailsVM.placesModel.isBooked! ? Colors.red : Colors.blue,
                expandedHeight: 200.0,
                pinned: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 34,
                    color: ColorConst.whiteColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const <StretchMode>[
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                  centerTitle: true,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Text("",
                        style: TextStyle(
                          color: ColorConst.whiteColor,
                          fontSize: 16.0,
                        )),
                  ),
                  background: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      FadeInImage.assetNetwork(
                        placeholder: "assets/images/default_image.png",
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            "assets/images/default_image.png",
                          );
                        },
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                        image: "${placeDetailsVM.placesModel.placeImage}",
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: Container(
                          decoration: BoxDecoration(color: ColorConst.darkGreen.withOpacity(0.4)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0, bottom: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.blur_circular,
                                  color: ColorConst.whiteColor,
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Icon(
                                  Icons.volume_mute,
                                  color: ColorConst.whiteColor,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: ColorConst.whiteColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(color: ColorConst.whiteColor,),
                margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                height: AppUtils.getH(context),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.date_range_outlined,
                          color: Colors.black54,
                          size: 22,
                        ),
                        Text(
                          DateFormat('yyyy-MM-dd').format(DateTime.fromMicrosecondsSinceEpoch(placeDetailsVM.placesModel.dataFrom!.microsecondsSinceEpoch)),
                          style: getTextStyleNormal(fontSize: 0.016),
                        ),
                        const Spacer(),
                        Text(
                          "${placeDetailsVM.placesModel.currency} ${placeDetailsVM.placesModel.amount} ",
                          style: getTextStyleNormal(fontSize: 0.016),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      placeDetailsVM.placesModel.placeTitle!,
                      style: getTextStyleNormalW5(),
                    ),
                    Text(
                      placeDetailsVM.placesModel.placeType!,
                      style: getTextStyleNormal(color: ColorConst.greyColor, fontSize: 0.015),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      placeDetailsVM.placesModel.placeDetails!,
                      style: getTextStyleNormal(color: ColorConst.greyColor, fontSize: 0.015),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Text(
                      "program".tr,
                      style: getTextStyleNormalW5(color: ColorConst.blackColor, fontSize: 0.015),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 400,
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/default_image.png",
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            "assets/images/default_image.png",
                          );
                        },
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                        image: "${placeDetailsVM.placesModel.placeImage}",
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: LoadingOverlay(
                      isLoading: placeDetailsVM.loadingBookingNow,
                      child: CustomButton(
                        callBack: (callBack) {
                          placeDetailsVM.loadingBookingNow = true;
                          placeDetailsVM.update();

                          if (placeDetailsVM.placesModel.isBooked!) {
                            BookedModel bookedModel = BookedModel(
                                docAutoID: placeDetailsVM.homeScreenVM.firestoreAutoID.collection("bookedData").doc().id,
                                authID: FirebaseAuth.instance.currentUser!.uid,
                                placesID: placeDetailsVM.placesModel.docId,
                                bookingTime: Timestamp.now(),
                                createdTime: Timestamp.now(),
                                updatedTime: Timestamp.now());

                            placeDetailsVM.homeScreenVM.homeRepo.removeMyBookedData(bookedModel).then((value) {
                              AppUtils.showSnakeBar(context: context, msg: "Booking Remove Done!");
                              placeDetailsVM.placesModel.isBooked = false;

                              //remove place from favorite home screen
                              for (int i = 0; i < placeDetailsVM.homeScreenVM.placeBookingList.length; i++) {
                                if (placeDetailsVM.homeScreenVM.placeBookingList[i].docId == placeDetailsVM.placesModel.docId) {
                                  placeDetailsVM.homeScreenVM.placeBookingList.removeAt(i);
                                }
                              }

                              //update places list
                              for (int i = 0; i < placeDetailsVM.homeScreenVM.placeModelList.length; i++) {
                                if (placeDetailsVM.homeScreenVM.placeModelList[i].docId == placeDetailsVM.placesModel.docId) {
                                  placeDetailsVM.homeScreenVM.placeModelList[i].isBooked = false;
                                }
                              }

                              placeDetailsVM.loadingBookingNow = false;
                              placeDetailsVM.update();
                              placeDetailsVM.homeScreenVM.update();

                            }).onError((error, stackTrace) {
                              debugPrint("booking delete error =  $error");
                            });
                          } else {
                            BookedModel bookedModel = BookedModel(
                                docAutoID: placeDetailsVM.homeScreenVM.firestoreAutoID.collection("bookedData").doc().id,
                                authID: FirebaseAuth.instance.currentUser!.uid,
                                placesID: placeDetailsVM.placesModel.docId,
                                bookingTime: Timestamp.now(),
                                createdTime: Timestamp.now(),
                                updatedTime: Timestamp.now());

                            placeDetailsVM.homeScreenVM.homeRepo.submitMyBookedData(bookedModel).then((value) {
                              AppUtils.showSnakeBar(context: context, msg: "Booking Done!");
                              placeDetailsVM.placesModel.isBooked = true;

                              //update booking place list home screen
                              placeDetailsVM.homeScreenVM.placeBookingList.add(placeDetailsVM.placesModel);

                              //update places list
                              for (int i = 0; i < placeDetailsVM.homeScreenVM.placeModelList.length; i++) {
                                if (placeDetailsVM.homeScreenVM.placeModelList[i].docId == placeDetailsVM.placesModel.docId) {
                                  placeDetailsVM.homeScreenVM.placeModelList[i].isBooked = true;
                                }
                              }

                              placeDetailsVM.loadingBookingNow = false;
                              placeDetailsVM.update();
                              placeDetailsVM.homeScreenVM.update();

                            }).onError((error, stackTrace) {
                              debugPrint("booking add error =  $error");
                            });
                          }
                        },
                        text: placeDetailsVM.placesModel.isBooked! ? "removeBooking".tr : "bookNow".tr,
                        color: placeDetailsVM.placesModel.isBooked! ? Colors.red : Colors.blue,
                      )))
            ],
          ),
        ),
      );
    });
  }
}
