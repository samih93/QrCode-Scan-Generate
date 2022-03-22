import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode/screens/qrcodegenerate/qrcodegenerateController.dart';

class QrCodeScan extends StatefulWidget {
  @override
  State<QrCodeScan> createState() => _QrCodeScanState();
}

class _QrCodeScanState extends State<QrCodeScan> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewcontroller;
  Barcode? barCode;

  @override
  void dispose() {
    // TODO: implement dispose
    this.qrViewcontroller?.dispose();
    super.dispose();
  }

  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await qrViewcontroller?.pauseCamera();
    }
    qrViewcontroller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          _buildQr(context),
          Positioned(
            bottom: 10,
            child: _buildResult(),
          ),
        ],
      ),
    );
  }

  _buildResult() => Container(
        decoration: BoxDecoration(color: Colors.white24),
        padding: EdgeInsets.all(15),
        child: SelectableText(
          barCode != null ? barCode!.code.toString() : "Scanning",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );

  _buildQr(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreatedCallback,
        overlay: QrScannerOverlayShape(
            borderWidth: 7,
            borderLength: 20,
            borderRadius: 10,
            cutOutSize: MediaQuery.of(context).size.width * 0.8),
      );

  void onQRViewCreatedCallback(QRViewController controller) {
    setState(() {
      this.qrViewcontroller = controller;
    });

    qrViewcontroller?.scannedDataStream
        .listen((barcode) => setState(() {
              this.barCode = barcode;
            }))
        .onDone(() {
      print("scan completed");
    });
  }
}
