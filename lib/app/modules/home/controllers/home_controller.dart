// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference users = firestore.collection('users');
    return users.orderBy('time', descending: true).snapshots();
  }

  void deleteData(String docID) {
    DocumentReference<Map<String, dynamic>> docData =
        firestore.collection('users').doc(docID);
    try {
      Get.defaultDialog(
        title: 'Warning',
        middleText: 'Are you sure delete this data?',
        textCancel: 'CANCEL',
        onCancel: () {
          Get.back();
        },
        textConfirm: 'OK',
        onConfirm: () {
          Get.back();
          docData.delete();
        },
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Error Occurred',
        middleText: 'Could not edit data.',
      );
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void filterData(String age) async {
    final filters = await firestore
        .collection('users')
        .where("age", isGreaterThanOrEqualTo: age)
        .get();
    if (filters.docs.isNotEmpty) {
      print("Data Filter : ${filters.docs.length}");
      for (var element in filters.docs) {
        var id = element.id;
        var data = element.data();
        print("ID ${id}");
        print("Data : ${data}");
      }
    } else {
      print("Tidak ada data");
    }
  }
}
