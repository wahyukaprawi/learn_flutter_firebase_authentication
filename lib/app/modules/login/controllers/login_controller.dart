import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var hidden = true.obs;

  void onclose() {
    email.dispose();
    password.dispose();
  }
}
