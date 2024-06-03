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
                    const Icon(
                      FeatherIcons.unlock,
                      size: 100,
                      color: AppColors.primaryColor,
                    ),
                    const Text(
                      'Login to Bookmark News',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 24),
                    ),
                    const SizedBox(height: 40),
                    TextFormFieldWidget(
                      controller: controller.emailController,
                      hintText: "Email address",
                      textInputType: TextInputType.emailAddress,
                      required: true,
                    ),
                    const SizedBox(height: 16),
                    TextFormFieldWidget(
                      controller: controller.passwordController,
                      hintText: "Password",
                      textInputType: TextInputType.visiblePassword,
                      required: true,
                      obscure: true,
                    ),
                    const SizedBox(height: 20),
                    Obx(() => SolidButton(
                        onTap: () {
                          controller.userLogin(context);
                        },
                        isLoading: controller.isLoading.value,
                        buttonText: 'Login')),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          const TextSpan(text: 'Don\'t have an account? '),
                          TextSpan(
                            text: 'Signup',
                            style: const TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w700),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                pushTo(AppRouter.signup);
                              },
                          ),
                        ],
                      ),
                    ).paddingOnly(top: 16),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
