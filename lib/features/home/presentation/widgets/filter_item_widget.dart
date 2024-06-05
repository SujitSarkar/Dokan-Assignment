part of 'widget_imports.dart';

class FilterItemWidget extends StatelessWidget {
  const FilterItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppString.filter.text
                  .fontWeight(FontWeight.bold)
                  .size(18.sp)
                  .make(),
              16.heightBox,
              Obx(
                () => CheckBoxTile(
                    title: AppString.newest,
                    value: homeController.newest.value,
                    onChange: (value) {
                      homeController.newest(value);
                      homeController.oldest(false);
                      homeController.bestSelling(false);
                    }),
              ),
              Obx(
                () => CheckBoxTile(
                    title: AppString.oldest,
                    value: homeController.oldest.value,
                    onChange: (value) {
                      homeController.oldest(value);
                      homeController.newest(false);
                      homeController.bestSelling(false);
                    }),
              ),
              Obx(
                () => CheckBoxTile(
                    title: AppString.priceLowToHigh,
                    value: homeController.priceLowToHigh.value,
                    onChange: (value) {
                      homeController.priceLowToHigh(value);
                      homeController.priceHighToLow(false);
                      homeController.bestSelling(false);
                    }),
              ),
              Obx(
                () => CheckBoxTile(
                    title: AppString.priceHighToLow,
                    value: homeController.priceHighToLow.value,
                    onChange: (value) {
                      homeController.priceHighToLow(value);
                      homeController.priceLowToHigh(false);
                      homeController.bestSelling(false);
                    }),
              ),
              Obx(
                () => CheckBoxTile(
                    title: AppString.bestSelling,
                    value: homeController.bestSelling.value,
                    onChange: (value) {
                      homeController.bestSelling(value);
                      homeController.oldest(false);
                      homeController.newest(false);
                      homeController.priceLowToHigh(false);
                      homeController.priceHighToLow(false);
                    }),
              ),
            ],
          ),
        )),
        Row(
          children: [
            Expanded(
              child: OutlineButton(
                onTap: () => popScreen(),
                buttonText: AppString.cancel,
                height: 61,
              ),
            ),
            16.widthBox,
            Expanded(
              child: SolidButton(
                onTap: () {
                  homeController.applyFilter();
                  popScreen();
                },
                buttonText: AppString.apply,
                backgroundColor: AppColors.buttonColor,
                height: 61,
              ),
            ),
          ],
        ).paddingAll(16)
      ],
    );
  }
}
