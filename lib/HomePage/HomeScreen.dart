import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_exam/Database/AddData.dart';
import 'package:firebase_exam/LoginAndRegister/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Database/db_Controller.dart';
import '../LoginAndRegister/Conroller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(HomeController());
  final logout = Get.put((LoginController()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          InkWell(onTap: () {
            logout.signOut();
            if(User==null)
            {
              Get.put(LoginPage());
            }
          },child: Icon(Icons.logout)),
        ],
      ),
      body: FutureBuilder(
        future: controller.fetchValue(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => Obx(
                () => InkWell(
                  onTap: () {
                    controller.deleteDb(index);
                  },
                  child: ListTile(
                    title: Text(controller.budgetList[index].category.toString()),
                    leading: Text(controller.budgetList[index].id.toString()),
                    subtitle:
                        Text(controller.budgetList[index].amount.toString()),
                    trailing: Text(controller.budgetList[index].date.toString()),
                  ),
                ),
              ),
              itemCount: controller.budgetList.length,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddData());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
