
import 'package:car_rental_app/page/auth/widget/auth_login_button.dart';
import 'package:car_rental_app/page/auth/widget/auth_textfield.dart';
import 'package:car_rental_app/page/auth/widget/forgot_password_modal.dart';
import 'package:car_rental_app/page/auth/widget/google_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../healper/app_helper.dart';
import '../../provider/auth_provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),

                SizedBox(
                  height: height * .04,
                ),
                buildTitle(title: "Email ID"),
                SizedBox(
                  height: height * .006,
                ),
                AuthTextField(
                  controller: authProvider.emailController,
                  title: 'Enter Email ID',
                  icon: Icon(Icons.email_outlined),
                ),
                SizedBox(
                  height: height * .03,
                ),
                buildTitle(title: "Password"),
                SizedBox(
                  height: height * .006,
                ),
                AuthTextField(
                  showHideBtn: true,
                  controller: authProvider.loginPasswordController,
                  title: 'Enter Password',
                  icon: const Icon(Icons.lock_open_outlined),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Center(
                  child: AppLoginButton(
                    title: 'Login',
                    onTap: () {
                      if (!AppHelper.isValidEmail(
                          authProvider.emailController.text)) {
                        return AppHelper.getToast("Enter valid email");
                      }

                      bool validPassword = AppHelper.isValidPassword(
                          authProvider.loginPasswordController.text);
                      if (!validPassword) {
                        String value = authProvider.loginPasswordController.text;
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


                      authProvider.emailLogin(context: context);
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
                          fontWeight: FontWeight.w400,
                        ),
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
                  height: height * .03,
                ),
                Center(
                  child: GoogleAuthButton(
                    onPressed: () {
                      authProvider.googleLogin(context: context);
                    },
                  ),
                ),
                SizedBox(
                  height: height * .0305,
                ),
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {
                        _showModalBottomSheet(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 12),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
  
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,   isScrollControlled: true,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return ForgotPasswordModal();
      },
    );
  }
}


