import 'package:get/get.dart';
import 'package:teamleance_technecal_test/viewModel/home_screen_vm.dart';
import 'package:teamleance_technecal_test/viewModel/login_vm.dart';
import 'package:teamleance_technecal_test/viewModel/place_details_vm.dart';
import 'package:teamleance_technecal_test/viewModel/place_list_screen_vm.dart';
import 'package:teamleance_technecal_test/viewModel/register_vm.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterVM>(() => RegisterVM(), fenix: true);
    Get.lazyPut<LoginVM>(() => LoginVM(), fenix: true);
    // Get.lazyPut<HomeScreenVM>(() => HomeScreenVM(), fenix: true);
    // Get.put(PlaceListVM());
    Get.lazyPut<PLaceDetailsVM>(() => PLaceDetailsVM(), fenix: true);
    Get.lazyPut<PlaceListVM>(() => PlaceListVM(), fenix: true);

  }
}