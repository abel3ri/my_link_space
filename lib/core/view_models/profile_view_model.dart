import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:my_link_space/core/models/error_model.dart';
import 'package:my_link_space/core/models/profile_model.dart';
import 'package:my_link_space/core/models/success_model.dart';

class PreviewViewModel with ChangeNotifier {
  bool _isLoading = false;
  late ProfileModel _profile;
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:8000/api/profile",
      headers: {"Accept": "application/json"},
    ),
  );

  PreviewViewModel() {
    getProfile().then((res) {
      _isLoading = false;
    });
  }

  Future<Either<ErrorModel, SuccessModel>> getProfile() async {
    try {
      _isLoading = true;
      dio.options.headers = {
        "Authorization":
            "Bearer 2|g7VMSVw1p9EgbYuQGkdJSNcN7DzPQ55TzGAC327i7b2139ae",
      };
      final res = await dio.get("/1");
      _profile = ProfileModel.fromJson(res.data);
      return right(SuccessModel(body: "Successfully fetched user profile"));
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          return left(ErrorModel(body: "Page not found!"));
        }
        return left(ErrorModel(body: e.response!.data));
      }

      return left(ErrorModel(body: "Connection problem"));
    } catch (e) {
      return left(ErrorModel(body: e.toString()));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool get isLoading => _isLoading;
  ProfileModel get profile => _profile;
}
