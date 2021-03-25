import 'package:agrobid/controllers/auth_controller.dart';
import 'package:agrobid/widgets/button.dart';
import 'package:agrobid/widgets/text_form_field.dart';
import 'package:agrobid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:customize/customize.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController _controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Signup").h3.pb64,
              CustomTextFormField(
                label: "Name",
                hintText: "Enter full name",
                keyboardType: TextInputType.text,
                controller: _controller.nameController,
              ),
              CustomTextFormField(
                label: "Email",
                hintText: "Enter email address",
                keyboardType: TextInputType.emailAddress,
                controller: _controller.emailController,
              ),
              CustomTextFormField(
                label: "Phone",
                hintText: "Enter phone number",
                keyboardType: TextInputType.phone,
                controller: _controller.phoneController,
              ),
              CustomTextFormField(
                label: "Password",
                hintText: "Enter password",
                keyboardType: TextInputType.text,
                controller: _controller.passwordController,
                isObscureText: true,
              ),
              CustomButton(
                text: "Signup".toUpperCase(),
                onPressed: () => _controller.signUpWithEmail(
                  name: _controller.nameController.text,
                  email: _controller.emailController.text,
                  phone: _controller.phoneController.text,
                  password: _controller.passwordController.text,
                ),
              ),
              CustomClickableRichText(
                text: "Already have a account? ",
                clickableText: "Login",
                onTap: () => Get.back(),
              ),
            ],
          ).px32,
        ).center,
      ),
    );
  }
}
