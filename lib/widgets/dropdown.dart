import 'package:customize/customize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDown extends StatelessWidget {
  final List list;
  final String label;
  final RxString selectedValue;
  const CustomDropDown({Key key, this.list, this.label, this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: FxMargin.my12,
      padding: FxPadding.px16,
      color: FxColors.blueGray200,
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(label).sm,
            isExpanded: true,
            items: list
                .map(
                  (value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
            onChanged: (value) => selectedValue.value = value,
            value: selectedValue.value,
          ),
        ),
      ),
    );
  }
}
