import 'package:authenticheck/pages/homescreen/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/forWhite.png', height: 200),
              const SizedBox(width: 10),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () => controller.signOutUser(),
                icon: const Icon(Icons.exit_to_app, color: Colors.black),
              )
            ],
          ),
        ),
        body: const Center(
          child: Text('Home Page'),
        ));
  }
}
