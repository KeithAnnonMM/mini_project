import 'package:authenticheck/pages/homescreen/homepage.dart';
import 'package:authenticheck/pages/login/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../constants/firebase_constants.dart';
import '../pages/mailVerification/mail_verification.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAll(() => const HomePage());
    } else if (user!.emailVerified) {
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => const MailVerification());
    }
  }

  Future<String> createNewAccount(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return 'Success';
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
      return e.message.toString();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return e.toString();
    }
  }

  Future<String> sendEmailVerification() async {
    try {
      await auth.currentUser?.sendEmailVerification();
      return "Success";
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
      return e.message.toString();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return e.toString();
    }
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return "Success";
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
      return e.message.toString();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return e.toString();
    }
  }

  Future<String> signOut() async {
    try {
      await auth.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
      return e.message.toString();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return e.toString();
    }
  }
}
