import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
}
