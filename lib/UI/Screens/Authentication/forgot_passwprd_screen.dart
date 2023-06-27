import 'package:flutter/material.dart';
import 'package:haztech_task/UI/Screens/Authentication/login_screen.dart';
import 'package:haztech_task/UI/custom_widgets/custom_buttons.dart';
import 'package:get/get.dart';
import 'package:haztech_task/UI/custom_widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../../../Core/Constants/colors.dart';
import '../../../Core/providers/login_provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, loginProvider, child) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    'Forgot Password!',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: kBlack),
                  ),
                ),
                const SizedBox(height: 5.0),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      'Just put your email\n and check inbox',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: kBlack),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                CustomTextField(
                  prefixIcon: const Icon(
                    Icons.alternate_email,
                    color: kPrimaryColor,
                  ),
                  controller: emailController,
                  hintText: 'Email',
                ),
                const SizedBox(height: 20.0),
                MyButtonLong(
                    name: 'Reset',
                    onTap: () {
                      loginProvider.sendPasswordResetEmail(
                          emailController.text, context);
                    }),
                const SizedBox(height: 30.0),
                Center(
                  child: MyTextButton(
                      name: 'Back To Login',
                      onTap: () {
                        Get.to(() => const LoginScreen());
                      }),
                ),
                const SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      );
    });
  }
}
