part of 'screen_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(AuthService()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.assetsSvgDokanLogo,
                      height: 50.h,
                      width: 166.w,
                    ),
                    83.heightBox,
                    'Sign In'.text.size(25).fontWeight(FontWeight.bold).make(),
                    40.heightBox,
                    TextFormFieldWidget(
                      controller: controller.emailController,
                      hintText: "Email",
                      textInputType: TextInputType.emailAddress,
                      required: true,
                      prefixIcon: FeatherIcons.mail,
                    ),
                    const SizedBox(height: 16),
                    TextFormFieldWidget(
                      controller: controller.passwordController,
                      hintText: "Password",
                      textInputType: TextInputType.visiblePassword,
                      required: true,
                      obscure: true,
                      prefixIcon: FeatherIcons.lock,
                    ),
                    19.heightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: 'Forgot Password?'
                          .text
                          .size(13)
                          .align(TextAlign.end)
                          .fontWeight(FontWeight.w500)
                          .color(AppColors.hintColor)
                          .make(),
                    ),
                    40.heightBox,
                    Obx(() => SolidButton(
                        onTap: () => controller.userLogin(context),
                        height: 61,
                        backgroundColor: AppColors.secondaryColor,
                        isLoading: controller.isLoading.value,
                        buttonText: 'Login')),
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
                    40.heightBox,
                    InkWell(
                      onTap: () => pushTo(AppRouter.signup),
                      child: 'Create New Account'
                          .text
                          .size(17)
                          .align(TextAlign.center)
                          .fontWeight(FontWeight.w400)
                          .color(AppColors.hintColor)
                          .make(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
