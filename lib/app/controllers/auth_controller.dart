// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_authentication/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void signup(String email, String password) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await myUser.user?.sendEmailVerification();
      Get.defaultDialog(
          title: 'Verification Email',
          middleText: 'Check your email for verification.',
          onConfirm: () {
            Get.back();
            Get.offAllNamed(Routes.LOGIN);
          },
          textConfirm: 'OK');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: 'Error Occurred',
          middleText: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          title: 'Error Occurred',
          middleText: 'The account already exists for that email.',
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Error Occurred',
        middleText: 'Unable to register account.',
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: 'Verification Email',
          middleText: 'Verify your email.',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        Get.defaultDialog(
          title: 'Invalid Credentials',
          middleText:
              'The credentials provided are invalid. Please check and try again.',
        );
      } else if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: 'Error Occurred',
          middleText: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: 'Error Occurred',
          middleText: 'Wrong password provided for that user.',
        );
      } else {
        Get.defaultDialog(
          title: 'Error Occurred',
          middleText: 'An unexpected error occurred: ${e.message}.',
        );
      }
    }
  }

  void resetPassword(String email) async {
    if (email != '' && GetUtils.isEmail(email)) {
      try {
        auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: 'Check your email',
            middleText: 'We have sent an email to reset your password.',
            onConfirm: () {
              Get.back();
              Get.offAllNamed(Routes.LOGIN);
            },
            textConfirm: 'OK');
      } catch (e) {
        Get.defaultDialog(
          title: 'Error Occurred',
          middleText: 'Unable to send email to reset password.',
        );
      }
    } else {
      Get.defaultDialog(
        title: 'Error Occurred',
        middleText: 'Invalid email.',
      );
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
