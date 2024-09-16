import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_link_space/core/models/error_model.dart';

Future<Either<ErrorModel, XFile>> pickImageFromCamera() async {
  try {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 15);
    if (image == null) return left(ErrorModel(body: "No image selected."));
    return right(image);
  } catch (err) {
    return left(ErrorModel(body: err.toString()));
  }
}

Future<Either<ErrorModel, XFile>> pickImageFromGallery() async {
  try {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (image == null) return left(ErrorModel(body: "No image selected."));
    return right(image);
  } catch (err) {
    return left(ErrorModel(body: err.toString()));
  }
}
