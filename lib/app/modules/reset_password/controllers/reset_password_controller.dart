import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  TextEditingController email = TextEditingController();

  void onclose() {
    email.dispose();
  }
}
