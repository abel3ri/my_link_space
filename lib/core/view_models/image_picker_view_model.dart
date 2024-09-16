import 'package:flutter/material.dart';
import 'package:my_link_space/utils/image_picker.dart';

class ImagePickerViewModel with ChangeNotifier {
  String? _imagePath;
  String? _imageName;

  Future<void> selectImageFromGallery(BuildContext context) async {
    final res = await pickImageFromGallery();
    res.fold((l) {
      l.showError(context);
    }, (r) {
      _imagePath = r.path;
      _imageName = r.name;
    });
    notifyListeners();
  }

  Future<void> selectImageFromCamera(BuildContext context) async {
    final res = await pickImageFromCamera();
    res.fold((l) {
      l.showError(context);
    }, (r) {
      _imagePath = r.path;
      _imageName = r.name;
    });
    notifyListeners();
  }

  String? get imagePath => _imagePath;
  String? get imageName => _imageName;

  void clearImage() {
    _imagePath = null;
    _imageName = null;
    notifyListeners();
  }
}
