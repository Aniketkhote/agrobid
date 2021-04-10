import 'dart:io';

import 'package:agrobid/controllers/product_controller.dart';
import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/widgets/widgets.dart';
import 'package:customize/customize.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProductScreen extends StatefulWidget {
  @override
  _NewProductScreenState createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  final ProductController _controller = Get.put(ProductController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Bid Product"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: getImage,
                child: Container(
                  width: FxWidth.w100,
                  margin: FxMargin.mb16,
                  color: FxColors.blueGray200,
                  height: 150,
                  child: _image == null
                      ? Center(
                          child: Icon(
                            Icons.cloud_upload_outlined,
                            size: 80,
                            color: colorText,
                          ),
                        )
                      : Image.file(
                          _image,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              CustomTextFormField(
                label: "Title",
                hintText: "Get fresh apple",
                validator: RequiredValidator(errorText: "title required"),
                controller: _controller.titleController,
              ),
              CustomTextFormField(
                label: "Details",
                hintText: "Write detail information about product",
                maxLines: 5,
                validator: RequiredValidator(errorText: "details required"),
                controller: _controller.detailController,
              ),
              CustomTextFormField(
                label: "Minimum Bidding Price",
                hintText: "120",
                validator: RequiredValidator(
                    errorText: "minimum bidding price required"),
                controller: _controller.biddingPriceController,
              ),
              CustomTextFormField(
                label: "Minimum Selling Quantity",
                hintText: "120",
                validator: RequiredValidator(
                    errorText: "minimum selling quantity required"),
                controller: _controller.qtyController,
              ),
              CustomDropDown(
                label: "Select Product Unit",
                list: _controller.unitList,
                selectedValue: _controller.unitSelectedValue,
              ),
              CustomDropDown(
                label: "Select Product Category",
                list: _controller.categoryList,
                selectedValue: _controller.categorySelectedValue,
              ),
              CustomDropDown(
                label: "Select Product Sub Category",
                list: _controller.subcategoryList,
                selectedValue: _controller.subcategorySelectedValue,
              ),
              CustomDropDown(
                label: "Select Product Variety",
                list: _controller.varietyList,
                selectedValue: _controller.varietySelectedValue,
              ),
              CustomButton(
                text: "Submit",
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    _controller.storeProduct();
                    formKey.currentState.reset();
                    _image = null;
                  }
                },
              ),
            ],
          ).px32.pt24,
        ),
      ),
    );
  }
}
