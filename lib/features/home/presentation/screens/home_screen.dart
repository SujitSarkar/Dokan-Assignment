part of 'screen_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.appName),
        centerTitle: true,
      ),
      body: ListRefreshIndicator(
          onRefresh: () async => await homeController.fetchProducts(),
          child: Obx(
            () => homeController.isLoding.value
                ? const LoadingWidget()
                : homeController.productList.isNotEmpty
                    ? Container()
                    : NoDataFound(
                        onRefresh: () {
                          homeController.fetchProducts();
                        },
                      ),
          )),
    );
  }
}
