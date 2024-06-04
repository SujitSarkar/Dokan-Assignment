part of 'widget_imports.dart';

class AccountMenuWidget extends StatelessWidget {
  const AccountMenuWidget({
    super.key,
    required this.leadingSvgAsset,
    required this.title,
    required this.onTap,
  });
  final String leadingSvgAsset;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: SvgPicture.asset(
        leadingSvgAsset,
      ),
      title: title.text.size(17.36).make(),
      trailing: const Icon(
        CupertinoIcons.forward,
        color: AppColors.hintColor,
        size: 18,
      ),
    );
  }
}
