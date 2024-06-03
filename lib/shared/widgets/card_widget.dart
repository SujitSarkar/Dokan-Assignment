part of 'widget_imports.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.child, this.contentPadding});
  final Widget child;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: contentPadding,
      decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 8,
                offset: const Offset(1, 4))
          ]),
      child: child,
    );
  }
}
