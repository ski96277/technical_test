import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamleance_technecal_test/model/booked_model.dart';
import 'package:teamleance_technecal_test/model/places_model.dart';
import 'package:teamleance_technecal_test/repo/home_repo.dart';
import 'package:teamleance_technecal_test/utils/app_utils.dart';

class HomeScreenVM extends GetxController {
  bool isLoading = true;

  HomeRepo homeRepo = HomeRepo();

  FirebaseFirestore firestoreAutoID = FirebaseFirestore.instance;

  List<PlacesModel> placeModelList = [];
  List<PlacesModel> placeBookingList = [];
  List<BookedModel> bookedModelList = [];

  @override
  void onInit() {
    super.onInit();

    if(AppUtils.isLogin()){
      homeRepo.callMyBookedData().then((value) {
        bookedModelList.clear();
        if (value.docs.isNotEmpty) {
          for (var element in value.docs) {
            BookedModel bookedModel = BookedModel(
                docAutoID: element['docAutoID'],
                authID: element['authID'],
                placesID: element['placesID'],
                bookingTime: element['bookingTime'],
                createdTime: element['createdTime'],
                updatedTime: element['updatedTime']);

            bookedModelList.add(bookedModel);

            callPlaceData(bookedModelList);

            debugPrint(("data ==== ${element} "));
          }
        } else {
          debugPrint(("booked empty data ====  "));
          callPlaceData(bookedModelList);
        }
      });
    }

 print("print on call data");


  }

  void callPlaceData(List<BookedModel> bookedModelList) {
    homeRepo.callPlacesData().then((querySnapshot) {
      placeModelList.clear();
      placeBookingList.clear();
      for (var element in querySnapshot.docs) {
        bool isBooked = false;

        for (var elm in bookedModelList) {
          if (elm.placesID == element['docId']) {
            isBooked = true;
          }
        }

        PlacesModel placesModel = PlacesModel(
            amount: element['amount'],
            currency: element['currency'],
            dataFrom: element['dataFrom'],
            dateTo: element['dateTo'],
            days: element['days'],
            docId: element['docId'],
            placeDetails: element['placeDetails'],
            placeImage: element['placeImage'],
            placeTitle: element['placeTitle'],
            placeType: element['placeType'],
            isBooked: isBooked);

        if(isBooked) placeBookingList.add(placesModel);

        placeModelList.add(placesModel);

        debugPrint(("data ==== ${placesModel.toJson()} "));
      }

      isLoading = false;
      update();
    }).catchError((onError) => debugPrint("submit the data error $onError"));
  }
}
