
import 'package:flutter/cupertino.dart';

class SavingsProvider extends ChangeNotifier {
  String _uploadedImage = 'assets/images/icons/budgetCategory/piggy.png';
  String get uploadedImage => _uploadedImage;
  void setUploadedImage(String uploadedImage) {
    _uploadedImage = uploadedImage;
    notifyListeners();
  }
}