import 'package:agrobid/widgets/appbar.dart';
import 'package:customize/customize.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Notifications"),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Row(
            children: [
              FxAlert(
                icon: Icons.notifications,
                title: "Notification",
                message: "Got some messages",
                color: FxColors.blueGray500,
                backgroundColor: Colors.white,
                borderRadius: FxRadius.radius10,
              ).expanded(1),
            ],
          ),
        ),
      ),
    );
  }
}
