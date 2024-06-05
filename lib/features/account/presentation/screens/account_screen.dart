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
              title: AppString.myAccount.text
                  .color(AppColors.screenTitleColor)
                  .fontWeight(FontWeight.bold)
                  .size(22.57.sp)
                  .make(),
              centerTitle: true,
            ),
            body: Obx(() => controller.isLoading.value
                ? const LoadingWidget()
                : ListRefreshIndicator(
                    onRefresh: () async {
                      await controller.getUserInfo();
                      controller.setUserInfoToTextField();
                    },
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      children: [
                        //User avatar
                        DottedBorder(
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
                                  SvgPicture.asset(
                                Assets.assetsSvgAccount,
                              ).paddingAll(20),
                              placeholder: (context, url) => SvgPicture.asset(
                                Assets.assetsSvgAccount,
                              ).paddingAll(20),
                              width: 112.w,
                              height: 112.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).centered(),
                        30.heightBox,

                        //Name & Email
                        (controller.userModel.value?.firstName != null &&
                                    controller
                                        .userModel.value!.firstName!.isNotEmpty
                                ? '${controller.userModel.value?.firstName} ${controller.userModel.value?.lastName}'
                                : controller.userModel.value?.name ??
                                    AppString.notFound)
                            .text
                            .fontWeight(FontWeight.bold)
                            .size(24.sp)
                            .make()
                            .centered(),
                        (controller.userModel.value?.email ??
                                AppString.notFound)
                            .text
                            .color(AppColors.hintColor)
                            .size(15.sp)
                            .make()
                            .centered(),
                        30.heightBox,

                        CardWidget(
                            borderRadius: 10.r,
                            contentPadding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                AccountExpandableMenu(
                                  leadingSvgAsset: Assets.assetsSvgAccount,
                                  title: AppString.account,
                                  children: [
                                    TextFormFieldWithTitle(
                                      controller: controller.email,
                                      hintText:
                                          'Your ${AppString.emailAddress}',
                                      labelText: AppString.email,
                                      required: true,
                                      textInputType: TextInputType.emailAddress,
                                    ),
                                    16.heightBox,
                                    TextFormFieldWithTitle(
                                      controller: controller.firstName,
                                      hintText:
                                          'Your ${AppString.firstName.toLowerCase()}',
                                      labelText: AppString.firstName,
                                      required: true,
                                      textCapitalization:
                                          TextCapitalization.words,
                                    ),
                                    16.heightBox,
                                    TextFormFieldWithTitle(
                                      controller: controller.lastName,
                                      hintText:
                                          'Your ${AppString.lastName.toLowerCase()}',
                                      labelText: AppString.lastName,
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
                                            buttonText: AppString.cancel,
                                            height: 50,
                                          ),
                                        ),
                                        16.widthBox,
                                        Expanded(
                                            child: Obx(
                                          () => SolidButton(
                                            onTap: () =>
                                                controller.updateUserInfo(),
                                            buttonText: AppString.save,
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
                                  title: AppString.password,
                                  onTap: () {},
                                ),
                                const Divider(
                                    color: AppColors.disableStartColor),
                                AccountMenuWidget(
                                  leadingSvgAsset: Assets.assetsSvgNotification,
                                  title: AppString.notification,
                                  onTap: () {},
                                ),
                                const Divider(
                                    color: AppColors.disableStartColor),
                                AccountMenuWidget(
                                  leadingSvgAsset: Assets.assetsSvgWishlist,
                                  title: AppString.wishlist,
                                  onTap: () {},
                                ),
                                const Divider(
                                    color: AppColors.disableStartColor),
                                AccountMenuWidget(
                                  leadingSvgAsset: Assets.assetsSvgLogout,
                                  title: AppString.logout,
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
          AppString.exitMgs,
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
              AppString.no,
              style: TextStyle(
                color: AppColors.buttonColor,
                fontSize: 18.sp,
              ),
            ),
          ),
          TextButton(
            onPressed: () => controller.logout(),
            child: Text(
              AppString.yes,
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
