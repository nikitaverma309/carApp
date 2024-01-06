import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import '../common/widget/app_loadig_indicator.dart';
import '../enum/app_conection_status.dart';
import '../healper/app_helper.dart';
import '../healper/sp_helper.dart';
import '../page/auth/splash_screen/feature_showcase_papge.dart';
import '../page/auth/widget/delete_account_fail_dialog.dart';
import '../page/main_page/main_page.dart';
import '../service/database_service.dart';
import '../service/navigation_service.dart';

class AuthProvider with ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  var _logger = Logger();
  AppLoadingStatus connectionStatus = AppLoadingStatus.none;
  bool dataSyncing = false;
  bool authLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  navigateToNextPage({required BuildContext context}) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return MainPage();
        }));
      }
    } catch (e) {
      throw "error while checking user exist or not";
    }
  }

  Future googleLogin({required BuildContext context}) async {
    showDialog(
        context: context,
        builder: (builder) {
          return AppLoadingIndicator(message: "Logging...");
        });
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw ("google login error : google user is null");
      }
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      var res = await FirebaseAuth.instance.signInWithCredential(credential);
      if (res.user == null) {
        throw "google login error : google user is null";
      }
      await SpHelper.saveBool(SpKey.authByGoogle, true);

      await navigateToNextPage(context: context);

      AppHelper.getToast("User Login Successfully");
    } catch (e) {
      AppHelper.getToast('something went wrong');
      AppHelper.logger.e(e.toString());
    } finally {
      Navigator.of(context).pop();
    }
  }

  Future emailLogin({required BuildContext context}) async {
    showDialog(
        context: context,
        builder: (builder) {
          return AppLoadingIndicator(message: "Logging...");
        });
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text,
              password: loginPasswordController.text);


      if (credential.user == null) {
         throw "user not login properly";
      }
      await navigateToNextPage(context: context);
      await SpHelper.saveBool(SpKey.authByGoogle, false);
      AppHelper.getToast("User Login Successfully");
    } on FirebaseAuthException catch (e) {
       if (e.code == 'user-not-found') {
        AppHelper.getToast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        AppHelper.getToast('Wrong password provided for that user.');
      } else {
        AppHelper.getToast('Invalid email or password');
      }
    } catch (e) {
      AppHelper.getToast('something went wrong');
      AppHelper.logger.e(e.toString());
    } finally {
      Navigator.of(context).pop();
    }
  }

  Future emailSignup({required BuildContext context}) async {
    showDialog(
        context: context,
        builder: (builder) {
          return AppLoadingIndicator(message: "Creating profile...");
        });

    try {
      var res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      print("wait");
      print(res.user?.uid);

      if (res.user == null) {
        throw "not able to create account";
      }

      await navigateToNextPage(context: context);
      await SpHelper.saveBool(SpKey.authByGoogle, false);
      AppHelper.getToast("User Login Successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppHelper.getToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        AppHelper.getToast('The account already exists for that email.');
      }
    } catch (e) {
      AppHelper.getToast('something went wrong');
      AppHelper.logger.e(e.toString());
    } finally {
      Navigator.of(context).pop();
    }
  }

  Future resetEmailPassword({required BuildContext context}) async {
    connectionStatus = AppLoadingStatus.loading;
    notifyListeners();
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      Navigator.of(context).pop();
      AppHelper.getSnackBar(context: context, msg: "Password Reset Email Sent");
    } catch (e) {
      AppHelper.getSnackBar(context: context, msg: "Something went wrong");
    } finally {
      connectionStatus = AppLoadingStatus.success;
      notifyListeners();
    }
  }

  Future<bool> isUserExist(
      {required BuildContext context, required User user}) async {
    try {
      var _snapshot = await DataBaseService.getUser(uid: user.uid);
      Map<String, dynamic>? _userData =
          _snapshot.data() as Map<String, dynamic>?;
      if (_userData == null) {
        return false;
      }
      if (_userData["name"] == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future logout({required BuildContext context}) async {
    showDialog(context: context, builder: (builder) => AppLoadingIndicator());

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw "user not found";
      }

      // logout user
      bool isAuthByGoogle =
          await SpHelper.loadBool(SpKey.authByGoogle) ?? false;
      FirebaseAuth.instance.signOut();

      if (isAuthByGoogle) {
        await googleSignIn.disconnect();
      }

      await SpHelper.deleteAllLocalData();

      AppHelper.getToast("User Logout Successfully");
      NavigationService.pushAndRemoveUntil(page: FeatureShowCasePage());
    } catch (e) {
      AppHelper.getToast("Something went wrong");
      _logger.e("error : ${e.toString()}");
    }
  }

  Future deleteAccount({required BuildContext context}) async {
    showDialog(context: context, builder: (builder) => AppLoadingIndicator());

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw "user not found";
      }

      // logout user
      bool isAuthByGoogle =
          await SpHelper.loadBool(SpKey.authByGoogle) ?? false;
      FirebaseAuth.instance.signOut();
      if (isAuthByGoogle) {
        await googleSignIn.disconnect();
      }
      // delete user local data
      await SpHelper.deleteAllLocalData();
      AppHelper.getToast("Account Deleted Successfully");
      NavigationService.pushAndRemoveUntil(page: FeatureShowCasePage());
    } catch (e) {
      showDialog(
          context: context, builder: (builder) => DeleteAccountFailDialog());
      log("error : ${e.toString()}");
    } finally {}
  }
}
