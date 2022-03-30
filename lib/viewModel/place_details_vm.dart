import 'package:get/get.dart';
import 'package:teamleance_technecal_test/model/places_model.dart';
import 'package:teamleance_technecal_test/viewModel/home_screen_vm.dart';

class PLaceDetailsVM extends GetxController{

  late PlacesModel placesModel;
  bool loadingBookingNow=false;

  HomeScreenVM homeScreenVM = Get.find();

  @override
  void onInit() {
    super.onInit();
    placesModel = Get.arguments;


  }
}