part of 'widget_imports.dart';

class AccountMenuWidget extends StatefulWidget {
  const AccountMenuWidget(
      {super.key,
      required this.leadingSvgAsset,
      required this.title,
      required this.children});
  final String leadingSvgAsset;
  final String title;
  final List<Widget> children;

  @override
  State<AccountMenuWidget> createState() => _AccountMenuWidgetState();
}

class _AccountMenuWidgetState extends State<AccountMenuWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        tilePadding: EdgeInsets.zero,
        dense: true,
        onExpansionChanged: (value) => setState(() => isExpanded = value),
        leading: SvgPicture.asset(widget.leadingSvgAsset),
        trailing: AnimatedRotation(
          turns: isExpanded ? 0.25 : 0,
          duration: const Duration(milliseconds: 200),
          child: const Icon(
            CupertinoIcons.forward,
            color: AppColors.hintColor,
            size: 18,
          ),
        ),
        backgroundColor: AppColors.cardColor,
        title: widget.title.text.size(17.36).make(),
        children: widget.children,
      ),
    );
  }
}
