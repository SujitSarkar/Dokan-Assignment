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

  final RxBool newest = true.obs;
  final RxBool oldest = false.obs;
  final RxBool priceLowToHigh = false.obs;
  final RxBool priceHighToLow = false.obs;
  final RxBool bestSelling = false.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    final result = await _homeService.getProducts();
    if (result != null) {
      productList.clear();
      productList(result);
      applyFilter();
      debugPrint('Total Product: ${productList.length}');
    }
    isLoding(false);
  }

  void applyFilter() {
    //Newest
    if (newest.value) {
      productList.sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));
      for (var e in productList) {
        debugPrint('${e.dateCreated!}');
      }
    }
    //Oldest
    if (oldest.value) {
      productList.sort((a, b) => a.dateCreated!.compareTo(b.dateCreated!));
      for (var e in productList) {
        debugPrint('${e.dateCreated!}');
      }
    }
    //Low to High
    if (priceLowToHigh.value) {
      productList.sort((a, b) => double.parse(a.price ?? '0.0')
          .compareTo(double.parse(b.price ?? '0.0')));
      for (var e in productList) {
        debugPrint(e.price);
      }
    }
    //High to Low
    if (priceHighToLow.value) {
      productList.sort((a, b) => double.parse(b.price ?? '0.0')
          .compareTo(double.parse(a.price ?? '0.0')));
      for (var e in productList) {
        debugPrint(e.price);
      }
    }
    //Best Selling
    if (bestSelling.value) {
      productList.sort((a, b) => b.totalSales!.compareTo(a.totalSales!));
      for (var e in productList) {
        debugPrint('${e.totalSales}');
      }
    }
  }
}
