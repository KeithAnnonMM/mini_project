import 'package:authenticheck/pages/login/logincontroller.dart';
import 'package:authenticheck/pages/signup/signup.dart';
import 'package:authenticheck/widgets/emailfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/reusable_submit_button.dart';
import '../../widgets/textwidget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: ListView(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/real.png',
              ),
              opacity: 0.04,
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: controller.key,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: controller.emailController,
                          validate: controller.validateEmail,
                          text: "Email Address",
                          isPassword: false,
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => TextFormField(
                            obscureText: controller.isVisible.value,
                            validator: controller.validatePassword,
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                              label: Text("Password",
                                  style: GoogleFonts.poppins(fontSize: 14)),
                              suffixIcon: IconButton(
                                  onPressed: () =>
                                      controller.changeVisibility(),
                                  icon: controller.isVisible.value
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off)),
                              hintStyle: const TextStyle(color: Colors.grey),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 0),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.none,
                            autocorrect: false,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(child: Container(width: 0)),
                            GestureDetector(
                              onTap: () {},
                              child: const TextWidget(
                                  text: 'Forgot Password?', size: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SubmitButton(
                          ontap: () {
                            if (controller.key.currentState!.validate()) {
                              controller.signInUser(
                                  email: controller.emailController.text,
                                  password: controller.passwordController.text);
                            }
                          },
                          text: 'LOGIN',
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const TextWidget(size: 12, text: 'Not registered?'),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () => Get.to(() => const SignUpPage()),
                              child: Text(
                                'SignUp now',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}
