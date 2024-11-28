import 'package:digifly_task/core/routes/app_router.dart';
import 'package:digifly_task/core/widgets/auth_custom_text_field.dart';
import 'package:digifly_task/core/widgets/auth_header_text.dart';
import 'package:digifly_task/core/widgets/auth_logo.dart';
import 'package:digifly_task/core/widgets/auth_custom_button.dart';
import 'package:digifly_task/features/auth/login/widgets/forgot_pass_button.dart';
import 'package:digifly_task/features/auth/login/widgets/google_button.dart';
import 'package:digifly_task/features/auth/login/widgets/or_text.dart';
import 'package:digifly_task/features/auth/login/widgets/remember_me_button.dart';
import 'package:digifly_task/features/auth/sign_up/sign_up_view.dart';
import 'package:digifly_task/features/home/bottom_nav_bar.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/auth_another_option_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static const String id = "/LoginView";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 16.w, end: 16.w, top: 0.h, bottom: 56.h),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                const AuthLogo(),
                // Auth Header
                const AuthHeaderText(headerText: 'sign_in_to_continue'),
                // Email Field
                AuthCustomTextField(
                  controller: emailController,
                  hintText: 'email',
                  keyboardType: TextInputType.emailAddress,
                  icon: Assets.imagesEmailIcon,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Email is required"; // Error message if input is empty
                    }
                    // Regular expression to validate email format
                    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                    if (value.isEmpty) {
                      return "Email address is required";
                    } else if (!emailRegex.hasMatch(value)) {
                      return "Enter a valid email address"; // Error message for invalid email
                    }
                    return null; // Return null if input is valid
                  },
                  isPassword: false,
                ),
                // Password Field
                AuthCustomTextField(
                  controller: passwordController,
                  hintText: 'password',
                  keyboardType: TextInputType.visiblePassword,
                  icon: Assets.imagesLockIcon,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "password is required"; // Error message if input is empty
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null; // Return null if input is valid
                  },
                  isPassword: true,
                  passwordVisibility: passwordVisibility,
                  suffixIconTap: () {
                   setState(() {
                     passwordVisibility = !passwordVisibility;
                     print(passwordVisibility);
                   });
                  },
                ),
                //forget pass and remember me button
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RememberMeButton(),
                    ForgotPassButton(),
                  ],
                ),
                SizedBox(height: 40.h),
                // Login Button
                AuthCustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // If all validations pass
                        print("Form is valid");
                        setState(() {
                          context.pushReplacementNamed(BottomNavBar.id);
                        });
                      } else {
                        // If validation fails
                        print("Form is invalid");
                      }
                    },
                    text: 'login'),
                SizedBox(height: 24.h),
                const OrText(),
                // Google Button
                const GoogleButton(),
                SizedBox(height: 50.h),
                AuthAnotherOptionText(
                  text: 'do_not_have_an_acc',
                  buttonText: 'create_acc',
                  onTap: () {
                   setState(() {
                     context.pushNamed(SignUpView.id);
                   });
                  },
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
