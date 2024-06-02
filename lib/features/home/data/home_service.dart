import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../shared/data/data_sources/remote/api/api_endpoint_url.dart';
import '../../../shared/data/data_sources/remote/api/remote_imports.dart';
import '../domain/model/product_model.dart';
import '../domain/repository/home_repository.dart';

class HomeService extends ApiClient implements HomeRepository {
  @override
  Future<List<ProductModel>?> getProducts() async {
    try {
      final response = await getRequest(path: ApiEndpointUrl.topHeadline);
      if (response.statusCode == 200) {
        return productModelFromJson(jsonEncode(response.data['articles']));
      }
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }
}
