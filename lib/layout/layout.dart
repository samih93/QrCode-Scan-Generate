import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/layout/layoutcontroller.dart';
import 'package:qrcode/shared/constant.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      init: LayoutController(),
      builder: (layoutController) => Scaffold(
        appBar: AppBar(
          title: Text(
              layoutController.appbar_title[layoutController.currentIndex]),
        ),
        body: layoutController.screens[layoutController.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 30,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: defaultColor,
          onTap: (index) {
            print(index);
            //NOTE : if index equal 2 open NewPostScreen without change index

            layoutController.onchangeIndex(index);
          },
          currentIndex: layoutController.currentIndex,
          items: layoutController.bottomItems,
        ),
      ),
    );
  }
}
