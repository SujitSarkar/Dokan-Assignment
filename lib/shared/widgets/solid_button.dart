part of 'widget_imports.dart';

class SolidButton extends StatelessWidget {
  const SolidButton(
      {super.key,
      required this.onTap,
      required this.buttonText,
      this.trailingIconData,
      this.isLoading = false,
      this.width,
      this.height,
      this.backgroundColor,
      this.borderRadius,
      this.splashColor,
      this.themeColor});
  final Function() onTap;
  final String buttonText;
  final IconData? trailingIconData;
  final bool isLoading;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? themeColor;
  final BorderRadiusGeometry? borderRadius;
  final WidgetStateProperty<Color?>? splashColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              backgroundColor: backgroundColor ?? AppColors.primaryColor,
              elevation: 0.0,
              minimumSize: Size(
                  width ?? MediaQuery.of(context).size.width, height ?? 50.h),
              maximumSize: Size(
                  width ?? MediaQuery.of(context).size.width, height ?? 50.h),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      borderRadius ?? BorderRadius.all(Radius.circular(10.r))))
          .copyWith(
              overlayColor: splashColor ??
                  WidgetStateProperty.all(Colors.white.withOpacity(0.5))),
      onPressed: onTap,
      child: isLoading
          ? const LoadingWidget(color: Colors.white)
          : buttonText.text
              .fontWeight(FontWeight.w700)
              .size(17.sp)
              .color(themeColor ?? Colors.white)
              .make(),
    );
  }
}
