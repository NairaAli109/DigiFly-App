import 'package:digifly_task/core/widgets/auth_another_option_text.dart';
import 'package:digifly_task/core/widgets/auth_custom_button.dart';
import 'package:digifly_task/core/widgets/auth_custom_text_field.dart';
import 'package:digifly_task/core/widgets/auth_header_text.dart';
import 'package:digifly_task/core/widgets/auth_logo.dart';
import 'package:digifly_task/features/auth/login/login_view.dart';
import 'package:digifly_task/features/home/bottom_nav_bar.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const String id = "/SignUpView";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usrNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passwordVisibility = false;
  bool confirmPasswordVisibility = false;

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
                const AuthHeaderText(headerText: 'create_new_acc'),
                // username field
                AuthCustomTextField(
                  controller: usrNameController,
                  hintText: 'user_name',
                  keyboardType: TextInputType.text,
                  icon: Assets.imagesProfile,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Username is required";
                    }
                    return null; // Return null if input is valid
                  },
                  isPassword: false,
                ),
                // Email Field
                AuthCustomTextField(
                  controller: emailController,
                  hintText: 'email',
                  keyboardType: TextInputType.emailAddress,
                  icon: Assets.imagesEmailIcon,
                  validator: (value) {
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
                  controller: confirmPasswordController,
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
                // Confirm Password Field
                AuthCustomTextField(
                  controller: passwordController,
                  hintText: 'confirm_pass',
                  keyboardType: TextInputType.visiblePassword,
                  icon: Assets.imagesLockIcon,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "password is required"; // Error message if input is empty
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    if (confirmPasswordController.text !=
                        passwordController.text) {
                      return "Password did not match";
                    }
                    return null; // Return null if input is valid
                  },
                  isPassword: true,
                  passwordVisibility: confirmPasswordVisibility,
                  suffixIconTap: () {
                    setState(() {
                      confirmPasswordVisibility = !confirmPasswordVisibility;
                      print(confirmPasswordVisibility);
                    });
                  },
                ),
                // register Button
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
                    text: 'create_acc'),
                SizedBox(height: 50.h),
                AuthAnotherOptionText(
                  text: 'already_have_an_account',
                  buttonText: 'login',
                  onTap: () {
                    setState(() {
                      context.pushNamed(LoginView.id);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
