import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:my_link_space/core/models/error_model.dart';
import 'package:my_link_space/core/models/success_model.dart';
import 'package:my_link_space/core/models/theme_model.dart';

class ProfileThemeViewModel with ChangeNotifier {
  ProfileThemeViewModel() {
    getAllThemes();
  }
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000/api/themes/"));
  List<ThemeModel> _themes = [];
  bool _isLoading = false;
  Future<Either<ErrorModel, SuccessModel>> getAllThemes() async {
    try {
      _isLoading = true;
      final res = await dio.get("/show-all");

      _themes = List<ThemeModel>.from(res.data.map((theme) {
        return ThemeModel.fromJson(theme);
      }));

      return right(SuccessModel(body: "Successfully fetched all themes"));
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
  List<ThemeModel> get themes => _themes;
}
