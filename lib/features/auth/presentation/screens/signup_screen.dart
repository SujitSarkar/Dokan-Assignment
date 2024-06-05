part of 'screen_imports.dart';

class Signupcreen extends StatelessWidget {
  const Signupcreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(AuthService()),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: controller.signupFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CardWidget(
                        borderRadius: 60,
                        child: CircleAvatar(
                          radius: 60.r,
                          backgroundColor: AppColors.cardColor,
                          child: SvgPicture.asset(
                            Assets.assetsSvgAccount,
                            height: 50.sp,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0.0,
                        bottom: 10.0,
                        child: CardWidget(
                          borderRadius: 20,
                          gradient: const LinearGradient(
                              colors: [
                                AppColors.primaryColor,
                                AppColors.secondaryColor,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          child: CircleAvatar(
                            radius: 18.r,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.camera_alt,
                              color: AppColors.backgroundColor,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  52.heightBox,
                  TextFormFieldWidget(
                    controller: controller.nameController,
                    hintText: AppString.name,
                    textCapitalization: TextCapitalization.words,
                    required: true,
                    prefix: SvgPicture.asset(Assets.assetsSvgAccount),
                  ),
                  16.heightBox,
                  TextFormFieldWidget(
                    controller: controller.userNameController,
                    hintText: AppString.username,
                    required: true,
                    prefix: SvgPicture.asset(Assets.assetsSvgAccount),
                  ),
                  16.heightBox,
                  TextFormFieldWidget(
                    controller: controller.emailController,
                    hintText: AppString.email,
                    textInputType: TextInputType.emailAddress,
                    required: true,
                    prefix: SvgPicture.asset(Assets.assetsSvgMail),
                  ),
                  16.heightBox,
                  TextFormFieldWidget(
                    controller: controller.passwordController,
                    hintText: AppString.password,
                    textInputType: TextInputType.visiblePassword,
                    required: true,
                    obscure: true,
                    prefix: SvgPicture.asset(Assets.assetsSvgLock),
                  ),
                  16.heightBox,
                  TextFormFieldWidget(
                    controller: controller.confirmPasswordController,
                    hintText: AppString.confirmPass,
                    textInputType: TextInputType.visiblePassword,
                    required: true,
                    obscure: true,
                    prefix: SvgPicture.asset(Assets.assetsSvgLock),
                  ),
                  20.heightBox,
                  Obx(
                    () => SolidButton(
                        onTap: () => controller.userSignup(context),
                        isLoading: controller.isLoading.value,
                        backgroundColor: AppColors.secondaryColor,
                        height: 61,
                        buttonText: AppString.signup),
                  ),
                  40.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardWidget(
                          height: 56,
                          width: 56,
                          contentPadding: const EdgeInsets.all(16),
                          child: SvgPicture.asset(
                            Assets.assetsSvgFacebook,
                            width: 12.36,
                            height: 22.91,
                          )),
                      14.widthBox,
                      CardWidget(
                          height: 56,
                          width: 56,
                          child: Image.asset(
                            Assets.assetsImageGoogle,
                            width: 22.91,
                            height: 22.91,
                          )),
                    ],
                  ),
                  20.heightBox,
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        const TextSpan(text: '${AppString.alreadyHaveAcc} '),
                        TextSpan(
                          text: AppString.login,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => popScreen(),
                        ),
                      ],
                    ),
                  ).paddingOnly(top: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
