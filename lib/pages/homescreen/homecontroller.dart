import 'package:authenticheck/models/auth_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void signOutUser() {
    String message = AuthController.instance.signOut() as String;
    if (message != 'Success') {
      Get.snackbar('Failed', message);
    }
  }
}
