part of 'screen_imports.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
        init: AccountController(AccountService()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: 'My Account'
                  .text
                  .color(AppColors.screenTitleColor)
                  .fontWeight(FontWeight.bold)
                  .size(22.57.sp)
                  .make(),
              centerTitle: true,
            ),
            body: Obx(() => controller.isLoading.value
                ? const LoadingWidget()
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        20.heightBox,
                        //User avatar
                        Center(
                          child: DottedBorder(
                            borderType: BorderType.Circle,
                            radius: Radius.circular(80.r),
                            dashPattern: const [4],
                            padding: const EdgeInsets.all(8),
                            color: AppColors.primaryColor,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(80)),
                              child: CachedNetworkImage(
                                imageUrl: controller
                                        .userModel.value?.avatarUrls?['96'] ??
                                    '',
                                errorWidget: (context, url, error) =>
                                    const ImagePlaceholderWidget(),
                                placeholder: (context, url) =>
                                    const ImagePlaceholderWidget(),
                                width: 112.w,
                                height: 112.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        30.heightBox,
                        (controller.userModel.value?.firstName != null &&
                                    controller
                                        .userModel.value!.firstName!.isNotEmpty
                                ? '${controller.userModel.value?.firstName} ${controller.userModel.value?.lastName}'
                                : controller.userModel.value?.name ??
                                    'Not found')
                            .text
                            .fontWeight(FontWeight.bold)
                            .size(24.sp)
                            .make(),
                        (controller.userModel.value?.email ?? 'Not found')
                            .text
                            .color(AppColors.hintColor)
                            .size(15.sp)
                            .make(),
                        30.heightBox,

                        CardWidget(
                            borderRadius: 10.r,
                            contentPadding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                AccountExpandableMenu(
                                  leadingSvgAsset: Assets.assetsSvgAccount,
                                  title: 'Account',
                                  children: [
                                    TextFormFieldWithTitle(
                                      controller: controller.email,
                                      hintText: 'Your email address',
                                      labelText: 'Email',
                                      required: true,
                                      textInputType: TextInputType.emailAddress,
                                    ),
                                    16.heightBox,
                                    TextFormFieldWithTitle(
                                      controller: controller.firstName,
                                      hintText: 'Your first name',
                                      labelText: 'First Name',
                                      required: true,
                                      textCapitalization:
                                          TextCapitalization.words,
                                    ),
                                    16.heightBox,
                                    TextFormFieldWithTitle(
                                      controller: controller.lastName,
                                      hintText: 'Your last name',
                                      labelText: 'Last Name',
                                      required: true,
                                      textCapitalization:
                                          TextCapitalization.words,
                                    ),
                                    20.heightBox,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: OutlineButton(
                                            onTap: () {},
                                            buttonText: 'Cancel',
                                            height: 50,
                                          ),
                                        ),
                                        16.widthBox,
                                        Expanded(
                                            child: Obx(
                                          () => SolidButton(
                                            onTap: () =>
                                                controller.updateUserInfo(),
                                            buttonText: 'Save',
                                            isLoading: controller
                                                .functionLoading.value,
                                            backgroundColor:
                                                AppColors.buttonColor,
                                            height: 50,
                                          ),
                                        )),
                                      ],
                                    ),
                                    16.heightBox
                                  ],
                                ),
                                const Divider(
                                    color: AppColors.disableStartColor),
                                AccountMenuWidget(
                                  leadingSvgAsset: Assets.assetsSvgPassword,
                                  title: 'Password',
                                  onTap: () {},
                                ),
                                const Divider(
                                    color: AppColors.disableStartColor),
                                AccountMenuWidget(
                                  leadingSvgAsset: Assets.assetsSvgNotification,
                                  title: 'Notification',
                                  onTap: () {},
                                ),
                                const Divider(
                                    color: AppColors.disableStartColor),
                                AccountMenuWidget(
                                  leadingSvgAsset: Assets.assetsSvgWishlist,
                                  title: 'Wishlist',
                                  onTap: () {},
                                ),
                                const Divider(
                                    color: AppColors.disableStartColor),
                                AccountMenuWidget(
                                  leadingSvgAsset: Assets.assetsSvgLogout,
                                  title: 'Logout',
                                  onTap: () =>
                                      showLogoutDialog(context, controller),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )),
          );
        });
  }

  void showLogoutDialog(BuildContext context, AccountController controller) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        title: Text(
          'Do you want to logout?',
          style: TextStyle(
            color: AppColors.screenTitleColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'No',
              style: TextStyle(
                color: AppColors.buttonColor,
                fontSize: 18.sp,
              ),
            ),
          ),
          TextButton(
            onPressed: () => controller.logout(),
            child: Text(
              'Yes',
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 18.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
