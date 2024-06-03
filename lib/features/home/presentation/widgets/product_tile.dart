part of 'widget_imports.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Product Image
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: productModel.images?.first.src ?? '',
              errorWidget: (context, url, error) =>
                  const ImagePlaceholderWidget(),
              placeholder: (context, url) => const ImagePlaceholderWidget(),
              width: double.infinity,
              height: 140.h,
              fit: BoxFit.cover,
            ),
          ),
          16.heightBox,
          //Product Title
          (productModel.name ?? '')
              .text
              .maxLines(2)
              .size(14.sp)
              .overflow(TextOverflow.ellipsis)
              .make()
              .paddingSymmetric(horizontal: 12),
          const Spacer(),
          //Product Price
          productModel.onSale != null && productModel.onSale == true
              ? RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor),
                    children: [
                      TextSpan(
                          text: '\$${productModel.regularPrice}',
                          style: TextStyle(
                              color: AppColors.hintColor,
                              fontSize: 15.sp,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w400)),
                      TextSpan(text: ' \$${productModel.salePrice}'),
                    ],
                  ),
                ).paddingSymmetric(horizontal: 12)
              : ('\$${productModel.price ?? 0.0}')
                  .text
                  .size(18.sp)
                  .fontWeight(FontWeight.bold)
                  .make()
                  .paddingSymmetric(horizontal: 12),
          8.heightBox,
          //Average rating
          buildStarRow(double.parse(productModel.averageRating ?? '0.0'))
              .paddingOnly(left: 12, right: 12, bottom: 12)
        ],
      ),
    );
  }

  Widget buildStarRow(double rating) {
    final int fullStars = rating.floor();
    final bool hasHalfStar = (rating - fullStars) >= 0.5;
    final int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);
    final double startSize = 14.0.sp;
    List<Widget> stars = [];
    // Add full stars
    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(
        Icons.star,
        color: AppColors.activeStartColor,
        size: startSize,
      ));
    }
    // Add half star if applicable
    if (hasHalfStar) {
      stars.add(Icon(
        Icons.star_half,
        color: AppColors.activeStartColor,
        size: startSize,
      ));
    }
    // Add empty stars
    for (int i = 0; i < emptyStars; i++) {
      stars.add(Icon(
        Icons.star,
        color: AppColors.disableStartColor,
        size: startSize,
      ));
    }
    return Row(children: stars);
  }
}
