import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/screens/qrcodegenerate/qrcodegenerate.dart';
import 'package:qrcode/screens/qrcodescan/qrcodescan.dart';

class LayoutController extends GetxController {
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.qr_code_sharp), label: "Generate Qr Code"),
    BottomNavigationBarItem(
        icon: Icon(Icons.qr_code_scanner), label: "Scan Qr Code"),
  ];

  //NOTE: ---------------------------Screens and Titles----------------------------
  final screens = [QrCodeGenerate(), QrCodeScan()];

  final appbar_title = ['Scan Qr Code', 'Generate Qr Code'];

  // NOTE: --------------------- On Change Index Of Screens ------------------

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void onchangeIndex(int index) {
    _currentIndex = index;
    update();
  }
}
