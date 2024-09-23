import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:my_link_space/core/models/error_model.dart';
import 'package:my_link_space/core/models/link_model.dart';
import 'package:my_link_space/core/models/success_model.dart';

class LinkViewModel with ChangeNotifier {
  List<LinkModel> _links = [];
  bool _isLoading = false;
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000/api/users"));

  LinkViewModel() {
    getAllLinks(userId: 1);
  }

  Future<Either<ErrorModel, SuccessModel>> getAllLinks({
    required int userId,
  }) async {
    try {
      _isLoading = true;
      final res = await dio.get("/${userId}/links");
      _links = List<LinkModel>.from(res.data.map((link) {
        return LinkModel.fromJson(link);
      }));
      return (right(SuccessModel(body: "Fetched all links")));
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

  Future<Either<ErrorModel, SuccessModel>> createLink({
    required LinkModel linkModel,
  }) async {
    try {
      _isLoading = true;
      await dio.post(
        "/${linkModel.userId}/links",
        data: linkModel.toJson(),
      );
      _links.add(linkModel);
      return right(SuccessModel(body: "Successfully created a link"));
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

  Future<Either<ErrorModel, SuccessModel>> updateLinkActiveState({
    required LinkModel link,
    required bool switchState,
  }) async {
    try {
      link.isActive = switchState;
      await dio.put("/${link.userId}/links/${link.id}", data: {
        "is_active": switchState ? 1 : 0,
      });
      notifyListeners();
      return right(SuccessModel(body: "Successfully updated link state"));
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          return left(ErrorModel(body: "Page not found!"));
        }
        return left(ErrorModel(body: e.response!.data));
      }

      link.isActive = !switchState;

      return left(ErrorModel(body: "Connection problem"));
    } catch (e) {
      link.isActive = !switchState;
      return left(ErrorModel(body: e.toString()));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Future<Either<ErrorModel, LinkModel>> getLink({
  //   required int userId,
  //   required int linkId,
  // }) async {
  //   try {
  //     _isLoading = true;
  //     final res = await dio.get("/${userId}/${linkId}");
  //     return right(LinkModel.fromJson(res.data));
  //   } on DioException catch (e) {
  //     if (e.response!.statusCode == 404) {
  //       return left(ErrorModel(body: "Page not found!"));
  //     }
  //     return left(ErrorModel(body: e.response!.data));
  //   } catch (e) {
  //     return left(ErrorModel(body: e.toString()));
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = _links.removeAt(oldIndex);
    _links.insert(newIndex, item);
    notifyListeners();
  }

  List<LinkModel> get links => _links;
  bool get isLoading => _isLoading;
}
