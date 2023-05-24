import 'package:authenticheck/constants/firebase_constants.dart';
import 'package:authenticheck/models/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) => Get.put(AuthController()));
  runApp(const Authenticheck());
}

class Authenticheck extends StatelessWidget {
  const Authenticheck({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: const Center(child: CircularProgressIndicator()),
    );
  }
}
