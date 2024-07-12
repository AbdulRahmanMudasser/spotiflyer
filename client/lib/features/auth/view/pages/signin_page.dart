import 'package:client/core/responsiveness/size_config.dart';
import 'package:client/core/theme/app_palette.dart';
import 'package:client/core/theme/sizes.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  /// INSTANCE OF SIZE CONFIG CLASS
  final SizeConfig s = SizeConfig();

  /// TEXT EDITING CONTROLLERS
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// FORM KEY
  final GlobalKey formKey = GlobalKey<FormState>();

  /// DISPOSE CONTROLLERS METHOD
  void _disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  /// DISPOSE METHOD
  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    s.init(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: s.hp(15),
                  ),
                  Text(
                    "Sign In.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: s.sp(FontSize.LM),
                    ),
                  ),
                  const SizedBox(height: 70),
                  CustomTextFormField(
                    hintText: "Email",
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    hintText: "Password",
                    controller: passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 40),
                  AuthGradientButton(
                    title: "Login",
                    fontSize: s.sp(FontSize.SM),
                    width: s.wp(92),
                    height: s.hp(5),
                    onTap: () {},
                  ),
                  const SizedBox(height: 45),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: s.sp(FontSize.SM),
                      ),
                      text: "Don't have an account?  ",
                      children: const [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: AppPalette.gradient2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
