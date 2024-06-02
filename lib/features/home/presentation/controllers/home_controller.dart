import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/home_service.dart';
import '../../domain/model/product_model.dart';

class HomeController extends GetxController {
  HomeController(this._homeService);
  final HomeService _homeService;

  final RxBool isLoding = true.obs;
  final RxBool functionLoading = false.obs;
  final RxList<ProductModel> productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    final result = await _homeService.getProducts();
    if (result != null) {
      productList.clear();

      debugPrint('Total Product: ${productList.length}');
    }
    isLoding(false);
  }
}
