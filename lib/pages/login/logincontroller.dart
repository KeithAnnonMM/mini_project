import 'package:authenticheck/models/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isVisible = true.obs;

  void changeVisibility() {
    isVisible.value = !isVisible.value;
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email can not be empty';
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp reg = RegExp(pattern);
    if (!reg.hasMatch(email)) {
      return 'Invalid Email format';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }
    if (password.length < 8) {
      return "Password is too short";
    }
    return null;
  }

  void signInUser({required String email, required String password}) {
    String message = AuthController.instance
        .signInUser(email: email, password: password) as String;
    if (message != "Success") {
      Get.snackbar('Failed', message);
    }
  }
}
