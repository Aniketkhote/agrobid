import 'package:flutter/material.dart';

//Main Colors
Color colorPrimary = Color(0xFF8739F9);
Color colorSeondary = Color(0xFF37B9F1);
Color colorTertiary = Color(0xFFF2F5F5);

//Font Colors
Color colorText = Color(0xFF565360);
Color colorLabel = Color(0xFF908E9B);
Color colorDisabled = Color(0xFFE1DFE9);

//Status Colors
Color colorWarning = Color(0xFFF9AE3F);
Color colorDanger = Color(0xFFDE5050);
Color colorSuccess = Color(0xFF37BC64);

//Light Status Colors
Color colorWarningLight = Color(0xFFFF8DE);
Color colorDangerLight = Color(0xFFFFF3F3);
Color colorSuccessLigth = Color(0xFFE2F8E9);

//Small Length
double sm1 = 4;
double sm2 = 8;
double sm3 = 12;

//Medium Length
double md1 = 16;
double md2 = 20;
double md3 = 24;

//Medium Length
double lg1 = 32;
double lg2 = 48;
double lg3 = 64;

//Extra large Length
double xl1 = 122;
double xl2 = 144;
double xl3 = 176;

//Font size
FontWeight fwNormal = FontWeight.w400;
FontWeight fwSemiBold = FontWeight.w600;
FontWeight fwBold = FontWeight.w800;

//TextStyle
TextStyle textStyleTitle =
    TextStyle(color: Colors.black, fontSize: md2, fontWeight: fwBold);
TextStyle textStyleLabel =
    TextStyle(color: Colors.black, fontSize: md1, fontWeight: fwSemiBold);
TextStyle textStyleCaption =
    TextStyle(color: Colors.black, fontSize: sm3, fontWeight: fwNormal);

//BorderRadius
BorderRadius borderRounded = BorderRadius.circular(10);
BorderRadius borderCircular = BorderRadius.circular(30);

//Decoration
Decoration decorationRounded = BoxDecoration(borderRadius: borderRounded);
Decoration decorationCircular = BoxDecoration(borderRadius: borderCircular);
