import 'package:client/core/responsiveness/size_config.dart';
import 'package:client/core/theme/sizes.dart';
import 'package:client/features/auth/repositories/auth_remote_repo.dart';
import 'package:client/features/auth/view/pages/signin_page.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/auth_link_text.dart';
import 'package:client/features/auth/view/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' as fpdart;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /// INSTANCE OF SIZE CONFIG CLASS
  final SizeConfig s = SizeConfig();

  /// TEXT EDITING CONTROLLERS
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// FORM KEY
  final GlobalKey formKey = GlobalKey<FormState>();

  /// DISPOSE CONTROLLERS METHOD
  void _disposeControllers() {
    nameController.dispose();
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
                    "Sign Up.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: s.sp(FontSize.LM),
                    ),
                  ),
                  const SizedBox(height: 70),
                  CustomTextFormField(
                    hintText: "Name",
                    controller: nameController,
                  ),
                  const SizedBox(height: 15),
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
                    title: "Register",
                    fontSize: s.sp(FontSize.SM),
                    width: s.wp(92),
                    height: s.hp(5),
                    onTap: () async {
                      final response = await AuthRemoteRepo().signup(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      final value = switch (response) {
                        fpdart.Left(value: final l) => l,
                        fpdart.Right(value: final r) => r.toString(),
                      };

                      debugPrint(value.toString());
                    },
                  ),
                  const SizedBox(height: 45),
                  AuthLinkText(
                    s: s,
                    leadingText: "Already have an account?  ",
                    text: "Sign In",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
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
