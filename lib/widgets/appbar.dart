import 'package:agrobid/utils/constant.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({
  String title,
  Widget widget,
  bool automaticallyImplyLeading,
  List<Widget> actions,
}) {
  return AppBar(
    leading: widget,
    title: Text(
      title ?? "Agrobid".toUpperCase(),
      style: TextStyle(color: colorText, fontSize: 18, fontWeight: fwBold),
    ),
    centerTitle: true,
    automaticallyImplyLeading: automaticallyImplyLeading ?? false,
    actions: actions ?? List.empty(),
    backgroundColor: Colors.white,
    elevation: 0,
  );
}
