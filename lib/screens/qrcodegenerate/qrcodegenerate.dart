import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode/screens/qrcodegenerate/qrcodegenerateController.dart';
import 'package:qrcode/shared/components.dart';

class QrCodeGenerate extends StatelessWidget {
  var qr_resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrCodeGenerateController>(
      init: QrCodeGenerateController(),
      builder: (qrCodeGenerateController) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: qrCodeGenerateController.textToGenerate,
                size: 200,
              ),
              defaultTextFormField(
                  hinttext: "Data",
                  controller: qr_resultController,
                  inputtype: TextInputType.name,
                  suffixIcon: IconButton(
                      onPressed: () {
                        qrCodeGenerateController
                            .onGenerateQrCode(qr_resultController.text);
                      },
                      icon: Icon(
                        Icons.check,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
