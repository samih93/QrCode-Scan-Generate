import 'package:get/get.dart';

class QrCodeGenerateController extends GetxController {
  String _textToGenerate = "";
  String get textToGenerate => _textToGenerate;
  onGenerateQrCode(String value) {
    _textToGenerate = value;
    update();
  }
}
