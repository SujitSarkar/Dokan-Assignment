part of 'screen_imports.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
        init: AccountController(AccountService()),
        builder: (accountController) {
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
            body: Obx(() => accountController.isLoading.value
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
                                imageUrl: accountController
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
                        (accountController.loginModel.value?.userDisplayName ??
                                'Not found')
                            .text
                            .fontWeight(FontWeight.bold)
                            .size(24.sp)
                            .make(),
                        (accountController.loginModel.value?.userEmail ??
                                'Not found')
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
                                AccountMenuWidget(
                                  leadingSvgAsset: Assets.assetsSvgAccount,
                                  title: 'Account',
                                  children: [
                                    TextFormFieldWithTitle(
                                      controller: TextEditingController(),
                                      hintText: 'Your email address',
                                      labelText: 'Email',
                                      required: true,
                                    ),
                                    16.heightBox,
                                    TextFormFieldWithTitle(
                                      controller: TextEditingController(),
                                      hintText: 'Your full name',
                                      labelText: 'Full Name',
                                      required: true,
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
                                          child: SolidButton(
                                            onTap: () {},
                                            buttonText: 'Save',
                                            backgroundColor:
                                                AppColors.buttonColor,
                                            height: 50,
                                          ),
                                        ),
                                      ],
                                    ),
                                    16.heightBox
                                  ],
                                ),
                                const Divider(
                                    color: AppColors.disableStartColor),
                                const AccountMenuWidget(
                                  leadingSvgAsset: Assets.assetsSvgPassword,
                                  title: 'Password',
                                  children: [],
                                ),
                                const Divider(
                                    color: AppColors.disableStartColor),
                                const AccountMenuWidget(
                                  leadingSvgAsset: Assets.assetsSvgNotification,
                                  title: 'Notification',
                                  children: [],
                                ),
                                const Divider(
                                    color: AppColors.disableStartColor),
                                const AccountMenuWidget(
                                  leadingSvgAsset: Assets.assetsSvgWishlist,
                                  title: 'Wishlist',
                                  children: [],
                                ),
                              ],
                            ))
                      ],
                    ),
                  )),
          );
        });
  }
}
