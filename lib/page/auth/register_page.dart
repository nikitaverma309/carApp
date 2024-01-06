
import 'package:car_rental_app/page/auth/widget/auth_login_button.dart';
import 'package:car_rental_app/page/auth/widget/auth_textfield.dart';
import 'package:car_rental_app/page/auth/widget/google_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../healper/app_helper.dart';
import '../../provider/auth_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    buildTitle({required String title}) {
      return Text(title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.grey.shade800));
    }

    return Consumer<AuthProvider>(builder: (context, authProvider, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .03,
                ),
                buildTitle(title: "Email ID"),
                SizedBox(
                  height: height * .006,
                ),
                AuthTextField(
                  isEmail: true,
                  controller: authProvider.emailController,
                  title: 'Enter Email ID',
                  icon: Icon(Icons.email_outlined),
                ),
                SizedBox(
                  height: height * .02,
                ),
                buildTitle(title: "Name"),
                SizedBox(
                  height: height * .006,
                ),
                AuthTextField(
                  controller: authProvider.nameController,
                  title: 'Enter Your Name',
                  icon: Icon(Icons.email_outlined),
                ),
                SizedBox(
                  height: height * .02,
                ),
                buildTitle(title: "Password"),
                SizedBox(
                  height: height * .006,
                ),
                AuthTextField(
                  showHideBtn: true,
                  controller: authProvider.passwordController,
                  title: 'Enter Password',
                  icon: Icon(Icons.lock_open_outlined),
                ),
                SizedBox(
                  height: height * .02,
                ),
                buildTitle(title: "Confirm Password"),
                SizedBox(
                  height: height * .006,
                ),
                AuthTextField(
                  showHideBtn: true,
                  controller: authProvider.confirmPasswordController,
                  title: 'Enter Confirm Password',
                  icon: Icon(Icons.lock_open_outlined),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Center(
                  child: AppLoginButton(
                    title: 'Register',
                    onTap: () {
                      if (!AppHelper.isValidEmail(
                          authProvider.emailController.text)) {
                        return AppHelper.getToast("Enter valid email");
                      }

                      if (authProvider.nameController.text.isEmpty) {
                        return AppHelper.getToast("Enter your name");
                      }

                      bool validPassword = AppHelper.isValidPassword(
                          authProvider.passwordController.text);
                      if (!validPassword) {
                        String value = authProvider.passwordController.text;
                        if (value.length < 8) {
                          return AppHelper.getToast(
                              "Password length must be great then 8");
                        } else {
                          bool containsUppercase =
                              value.contains(RegExp(r'[A-Z]'));
                          if (!containsUppercase) {
                            return AppHelper.getToast(
                                "Contains at least one Uppercase(A-Z) character");
                          }
                          bool containsLowercase =
                              value.contains(RegExp(r'[a-z]'));
                          if (!containsLowercase) {
                            return AppHelper.getToast(
                                "Contains at least one Lowercase(a-z) character");
                          }
                          bool containsNumber =
                              value.contains(RegExp(r'[0-9]'));
                          if (!containsNumber) {
                            return AppHelper.getToast(
                                "Contains at least one Numeric(0-9) character");
                          }
                          return AppHelper.getToast(
                              "Contains at least one special character");
                        }
                      }
                      if (authProvider.passwordController.text !=
                          authProvider.confirmPasswordController.text) {
                        return AppHelper.getToast(
                            "Confirm  password must be same");
                      }

                      authProvider.emailSignup(context: context);
                    },
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: .5,
                      color: Colors.grey.withOpacity(.5),
                    )),
                    SizedBox(
                      width: 16,
                    ),
                    Center(
                      child: Text(
                        "Or with",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(.99)),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: Container(
                      height: .5,
                      color: Colors.grey.withOpacity(.5),
                    )),
                  ],
                ),
                SizedBox(
                  height: height * .025,
                ),
                Center(
                  child: GoogleAuthButton(onPressed: () {
                    authProvider.googleLogin(context: context);
                  }),
                ),
                SizedBox(
                  height: height * .05,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
