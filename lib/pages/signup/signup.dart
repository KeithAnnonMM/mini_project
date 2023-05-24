import 'package:authenticheck/pages/signup/signupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../widgets/emailfield.dart';
import '../../widgets/reusable_submit_button.dart';
import '../../widgets/textwidget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final SignUpController mainController = Get.put(SignUpController());
    String selected = 'Albania';

    List<String> countries = mainController.countries;
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
            Image.asset('assets/images/forWhite.png', height: 60),
            const SizedBox(width: 10),
            Text(
              'CREATE ACCOUNT',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/real.png'), opacity: 0.04),
            ),
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          validate: mainController.validateEmail,
                          controller: mainController.emailController,
                          text: 'Email Address',
                          isPassword: false,
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => TextFormField(
                            validator: mainController.validatePassword,
                            controller: mainController.passwordController,
                            obscureText: mainController.isVisible.value,
                            decoration: InputDecoration(
                                label: Text('Password',
                                    style: GoogleFonts.poppins(fontSize: 14)),
                                hintStyle: const TextStyle(color: Colors.grey),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 0),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () =>
                                        mainController.changeOption(),
                                    icon: mainController.isVisible.value == true
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off))),
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.none,
                            autocorrect: false,
                          ),
                        ),
                        const TextWidget(
                            text:
                                'Password must be atleast 8 characters long and include 1 capital letter and 1 symbol',
                            size: 12),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: mainController.firstNameController,
                          validate: mainController.validateText,
                          text: 'First Name',
                          isPassword: false,
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: mainController.lastNameController,
                          validate: mainController.validateText,
                          text: 'Last Name',
                          isPassword: false,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: mainController.dateController,
                          decoration: InputDecoration(
                            label: Text('Select Birth Date',
                                style: GoogleFonts.poppins(fontSize: 14)),
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
                          onTap: () => _selectDate(context, mainController),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.none,
                          autocorrect: true,
                        ),
                        DropdownButtonFormField(
                          value: selected,
                          items: countries.map((country) {
                            return DropdownMenuItem(
                              value: country,
                              child: Text(country),
                            );
                          }).toList(),
                          onChanged: (selectedCountry) {
                            selected = selectedCountry.toString();
                          },
                          decoration: const InputDecoration(
                            labelText: 'Country',
                            hintText: 'Select your country',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                  fillColor:
                                      MaterialStateProperty.all(Colors.black),
                                  value:
                                      mainController.isCheckedAgreement.value,
                                  onChanged: (value) =>
                                      mainController.changeAgreement()),
                            ),
                            Text(
                              'I agree to the Terms and Privacy Policy',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                  fillColor:
                                      MaterialStateProperty.all(Colors.black),
                                  value: mainController.isCheckedPersonal.value,
                                  onChanged: (value) =>
                                      mainController.changePersonal()),
                            ),
                            Text(
                              'Please use my personal information for the FUBA\nto send me messages and advertisements about\nproducts and initiatives of FUBA and its partners',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SubmitButton(
                            text: 'CREATE ACCOUNT',
                            ontap: () {
                              if (formkey.currentState!.validate()) {
                                if (mainController.isCheckedAgreement.value) {
                                  mainController.registerNewUser(
                                      mainController.emailController.text,
                                      mainController.passwordController.text);
                                  mainController.verifyEmail();
                                } else {
                                  Get.snackbar('AGREEMENT',
                                      'Agree to the Terms and Privacy Policy to continue');
                                }
                              }
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null) {
      // print('Date selected: ${picked.toString()}');
      // birth_date = picked;
      // Do something with the selected date here
      controller.dateController.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }
}
