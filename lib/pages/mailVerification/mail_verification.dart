import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            )),
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/forWhite.png', height: 300),
          ],
        ),
      ),
    );
  }
}
