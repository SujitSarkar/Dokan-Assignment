part of 'widget_imports.dart';

class ImagePlaceholderWidget extends StatelessWidget {
  const ImagePlaceholderWidget({super.key, this.height, this.width});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Ink(
          width: width ?? 130.w,
          height: height ?? 140.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Icon(
            Icons.image,
            color: AppColors.disableStartColor,
            size: 130.sp,
          ),
        ));
  }
}
