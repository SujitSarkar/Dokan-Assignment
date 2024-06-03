part of 'screen_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: 'Product List'
            .text
            .color(AppColors.screenTitleColor)
            .fontWeight(FontWeight.bold)
            .size(22.57.sp)
            .make(),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 28,
                color: AppColors.textColor,
              ))
        ],
      ),
      body: ListRefreshIndicator(
          onRefresh: () async => await homeController.fetchProducts(),
          child: Obx(
            () => homeController.isLoding.value
                ? const LoadingWidget()
                : homeController.filteredProductList.isNotEmpty
                    ? Column(
                        children: [
                          FilterCard(
                            sortOnTap: () {
                              modalBottomSheet(
                                  context: context,
                                  child: const FilterItemWidget());
                            },
                          ),
                          Expanded(
                            child: GridView.builder(
                              padding: const EdgeInsets.all(16),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: .62,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 12),
                              itemCount:
                                  homeController.filteredProductList.length,
                              itemBuilder: (context, index) => ProductTile(
                                  productModel: homeController
                                      .filteredProductList[index]),
                            ),
                          ),
                        ],
                      )
                    : NoDataFound(
                        onRefresh: () {
                          homeController.fetchProducts();
                        },
                      ),
          )),
    );
  }
}
