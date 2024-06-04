part of 'screen_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(HomeService()),
        builder: (homeController) {
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
                    icon: SvgPicture.asset(
                      height: 22,
                      width: 22,
                      Assets.assetsSvgSearch,
                      colorFilter: const ColorFilter.mode(
                          AppColors.textColor, BlendMode.srcIn),
                    ))
              ],
            ),
            body: ListRefreshIndicator(
                onRefresh: () async => await homeController.fetchProducts(),
                child: Obx(
                  () => homeController.isLoding.value
                      ? const LoadingWidget()
                      : homeController.productList.isNotEmpty
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
                                        homeController.productList.length,
                                    itemBuilder: (context, index) =>
                                        ProductTile(
                                            productModel: homeController
                                                .productList[index]),
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
        });
  }
}
