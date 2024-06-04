part of 'widget_imports.dart';

class AccountExpandableMenu extends StatefulWidget {
  const AccountExpandableMenu({
    super.key,
    required this.leadingSvgAsset,
    required this.title,
    required this.children,
  });
  final String leadingSvgAsset;
  final String title;
  final List<Widget> children;

  @override
  State<AccountExpandableMenu> createState() => _AccountExpandableMenuState();
}

class _AccountExpandableMenuState extends State<AccountExpandableMenu> {
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
