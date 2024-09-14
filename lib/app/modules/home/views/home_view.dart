import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learn_flutter_authentication/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () => controller.filterData("28"),
                icon: const Icon(
                  Icons.filter_list_outlined,
                ),
              ),
              IconButton(
                onPressed: () => controller.logout(),
                icon: const Icon(
                  Icons.logout_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: ListTile(
                  title: Text(
                    '${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}',
                  ),
                  subtitle: Text(
                    '${(listAllDocs[index].data() as Map<String, dynamic>)["age"]}',
                  ),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tileColor: Colors.grey[200],
                  onTap: () => Get.toNamed(
                    Routes.EDIT_USER,
                    arguments: listAllDocs[index].id,
                  ),
                  trailing: IconButton(
                    onPressed: () =>
                        controller.deleteData(listAllDocs[index].id),
                    icon: Icon(
                      color: Colors.red[700],
                      Icons.delete,
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_USER),
        child: const Icon(Icons.add),
      ),
    );
  }
}
