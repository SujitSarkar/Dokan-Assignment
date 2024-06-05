part of 'widget_imports.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({super.key, required this.sortOnTap});
  final Function() sortOnTap;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.assetsSvgFilter,
              height: 16.h,
              width: 15.w,
              fit: BoxFit.cover,
            ),
            AppString.filter.text
                .size(16.sp)
                .color(AppColors.hintColor)
                .make()
                .paddingOnly(left: 12),
            const Spacer(),
            InkWell(
              onTap: sortOnTap,
              child: Row(
                children: [
                  AppString.sortBy.text
                      .size(16.sp)
                      .color(AppColors.hintColor)
                      .make()
                      .paddingOnly(left: 12),
                  6.widthBox,
                  SvgPicture.asset(
                    Assets.assetsSvgArrowDown,
                    height: 8.h,
                    width: 14.w,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            16.widthBox,
            SvgPicture.asset(
              Assets.assetsSvgMenu,
              height: 14.h,
              width: 19.w,
              fit: BoxFit.cover,
            ),
          ],
        )).paddingSymmetric(horizontal: 16);
  }
}
