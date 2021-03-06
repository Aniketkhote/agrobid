import 'package:agrobid/controllers/auth_controller.dart';
import 'package:agrobid/pages/pages.dart';
import 'package:agrobid/utils/validation.dart';
import 'package:agrobid/widgets/button.dart';
import 'package:agrobid/widgets/text_form_field.dart';
import 'package:agrobid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:customize/customize.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final AuthController _controller = Get.put(AuthController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Login").h3.pb64,
                CustomTextFormField(
                  label: "Email",
                  hintText: "Enter email address",
                  keyboardType: TextInputType.emailAddress,
                  controller: _controller.emailController,
                  validator: emailValidator,
                ),
                CustomTextFormField(
                  label: "Password",
                  hintText: "Enter password",
                  keyboardType: TextInputType.text,
                  controller: _controller.passwordController,
                  validator: passwordValidator,
                  isObscureText: true,
                ),
                CustomButton(
                  text: "Login".toUpperCase(),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      _controller.signInWithEmail(
                        email: _controller.emailController.text,
                        password: _controller.passwordController.text,
                      );
                    }
                  },
                ),
                CustomClickableRichText(
                  text: "Not yet account? ",
                  clickableText: "Register",
                  onTap: () => Get.to(
                    () => RegisterScreen(),
                  ),
                ),
              ],
            ).px32,
          ),
        ).center,
      ),
    );
  }
}
