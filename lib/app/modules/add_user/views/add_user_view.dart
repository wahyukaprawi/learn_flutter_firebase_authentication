import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_user_controller.dart';

class AddUserView extends GetView<AddUserController> {
  const AddUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User View'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.nameC,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: controller.ageC,
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => controller.addUser(
                controller.nameC.text,
                controller.ageC.text,
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
