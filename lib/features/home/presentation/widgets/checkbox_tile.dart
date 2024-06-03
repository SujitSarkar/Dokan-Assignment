part of 'widget_imports.dart';

class CheckBoxTile extends StatelessWidget {
  const CheckBoxTile(
      {super.key,
      required this.title,
      required this.value,
      required this.onChange});
  final String title;
  final bool value;
  final Function(bool? value) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
            visualDensity: VisualDensity.compact,
            side: const BorderSide(color: AppColors.primaryColor, width: 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            value: value,
            onChanged: (value) => onChange(value),
          ),
        ),
        title.text.fontWeight(FontWeight.w500).size(16.sp).make(),
      ],
    );
  }
}
