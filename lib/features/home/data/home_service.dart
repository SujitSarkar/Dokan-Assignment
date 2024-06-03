import 'package:flutter/material.dart';
import '../../../shared/data/data_sources/remote/api/remote_imports.dart';
import '../domain/model/product_model.dart';
import '../domain/repository/home_repository.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeService extends ApiClient implements HomeRepository {
  @override
  Future<List<ProductModel>?> getProducts() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/json/product_response.json');
      return productModelFromJson(jsonString);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }
}
