import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUserController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController ageC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addUser(String name, String age) async {
    CollectionReference users = firestore.collection('users');
    try {
      String dateNow = DateTime.now().toIso8601String();
      await users.add({
        "name": name,
        "age": age,
        "time": dateNow,
      });
      Get.defaultDialog(
          title: 'Succesfull',
          middleText: 'Successfully added data.',
          onConfirm: () {
            nameC.clear();
            ageC.clear();
            Get.back(); // close dialog
            Get.back(); // back to home
          },
          textConfirm: 'OK');
    } catch (e) {
      Get.defaultDialog(
        title: 'Error Occurred',
        middleText: 'Could not add data.',
      );
    }
  }
}
