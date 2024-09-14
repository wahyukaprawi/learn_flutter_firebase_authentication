import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController ageC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getData(String docID) {
    DocumentReference<Map<String, dynamic>> docData =
        firestore.collection('users').doc(docID);
    return docData.get();
  }

  void editUser(String name, String age, String docID) async {
    DocumentReference<Map<String, dynamic>> docData =
        firestore.collection('users').doc(docID);
    try {
      await docData.update({
        "name": name,
        "age": age,
      });
      Get.defaultDialog(
        title: 'Succesfull',
        middleText: 'Successfully edit data.',
        onConfirm: () {
          nameC.clear();
          ageC.clear();
          Get.back(); // close dialog
          Get.back(); // back to home
        },
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Error Occurred',
        middleText: 'Could not edit data.',
      );
    }
  }
}
