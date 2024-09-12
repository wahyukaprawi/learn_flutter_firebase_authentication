import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learn_flutter_authentication/app/controllers/auth_controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/singup_controller.dart';

class SingupView extends GetView<SingupController> {
  final authC = Get.find<AuthController>();
  SingupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Singup View'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.email,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: controller.password,
              obscureText: controller.hidden.value,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () => authC.signup(
                controller.email.text,
                controller.password.text,
              ),
              child: const Text(
                'Signup',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Do you have an account?",
                ),
                TextButton(
                  onPressed: () => Get.offAllNamed(Routes.LOGIN),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
