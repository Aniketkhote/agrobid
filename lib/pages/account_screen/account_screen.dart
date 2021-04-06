import 'package:agrobid/controllers/user_controller.dart';
import 'package:agrobid/widgets/widgets.dart';
import 'package:customize/customize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  final UserController _controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(automaticallyImplyLeading: true, title: "Account"),
      body: SafeArea(
        child: Column(
          children: [
            // buildManu(
            //   menu: "Change Password",
            //   onTab: () => Get.defaultDialog(
            //     title: "Change Password",
            //     content: buildUpdateBox(
            //       label: "Enter Password",
            //       controller: _controller.changePasswordController,
            //     ),
            //     confirm: CustomButton(
            //       text: "Update",
            //       onPressed: () async {
            //         await _controller.changePassword(
            //             newPassword: _controller.changePasswordController.text);
            //         Get.back();
            //         Get.snackbar("successful", "password updated");
            //       },
            //     ),
            //   ),
            // ),
            // buildManu(
            //   menu: "Change Email",
            //   onTab: () => Get.defaultDialog(
            //     title: "Change Email",
            //     content: buildUpdateBox(
            //       label: "Enter Email",
            //       controller: _controller.changeEmailController,
            //     ),
            //     confirm: CustomButton(
            //       text: "Update",
            //       onPressed: () async {
            //         await _controller.changeEmail(
            //             newEmail: _controller.changeEmailController.text);
            //         Get.back();
            //         Get.snackbar("successful", "email updated");
            //       },
            //     ),
            //   ),
            // ),
            buildManu(
              menu: "Change Phone",
              onTab: () => Get.defaultDialog(
                title: "Change Phone",
                content: buildUpdateBox(
                  label: "Enter Phone Number",
                  controller: _controller.changePhoneController,
                ),
                confirm: CustomButton(
                  text: "Update",
                  onPressed: () async {
                    await await _controller.changePhone(
                        newPhone: _controller.changePhoneController.text);
                    Get.back();
                    Get.snackbar("successful", "phone updated");
                  },
                ),
              ),
            ),
          ],
        ).py20,
      ),
    );
  }

  Widget buildUpdateBox({
    String label,
    TextEditingController controller,
  }) =>
      Column(
        children: [
          CustomTextFormField(
            label: label,
            controller: controller,
          ),
        ],
      );

  Widget buildManu({String menu, Function onTab}) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: FxWidth.w100,
        padding: FxPadding.pxy(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(color: Colors.white),
        child: Text(menu),
      ).pb8,
    );
  }
}
