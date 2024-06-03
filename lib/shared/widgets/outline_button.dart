part of 'widget_imports.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton(
      {super.key,
      required this.onTap,
      required this.buttonText,
      this.primaryColor,
      this.isLoading = false,
      this.backgroundColor,
      this.borderRadius,
      this.fixedSize,
      this.minimumSize,
      this.maximumSize,
      this.splashColor,
      this.width,
      this.height});

  final Function() onTap;
  final String buttonText;
  final Size? fixedSize;
  final bool isLoading;
  final Size? minimumSize;
  final Size? maximumSize;
  final double? width;
  final double? height;
  final Color? primaryColor;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
              elevation: 0.0,
              minimumSize: Size(
                  width ?? MediaQuery.of(context).size.width, height ?? 50.h),
              maximumSize: Size(
                  width ?? MediaQuery.of(context).size.width, height ?? 50.h),
              side: BorderSide(color: primaryColor ?? AppColors.hintColor),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      borderRadius ?? BorderRadius.all(Radius.circular(10.r))))
          .copyWith(
              overlayColor: WidgetStateProperty.all(
                  splashColor ?? AppColors.hintColor.withOpacity(0.2))),
      onPressed: onTap,
      child: isLoading
          ? const LoadingWidget(color: Colors.white)
          : buttonText.text
              .fontWeight(FontWeight.w700)
              .size(17.sp)
              .color(AppColors.hintColor)
              .make(),
    );
  }
}
