import 'package:firebase_exam/Database/db_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddData extends StatelessWidget {
   AddData({super.key});

  @override
  final controller = Get.put(HomeController());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("  Income/Expence",style: TextStyle(fontSize: 20),),
              Switch(value: true, onChanged: (value) {

              },)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
               controller: controller.txtCategory,
              decoration: InputDecoration(
                  hintText: "Category",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 1
                      )
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
               controller: controller.txtAmount,
              decoration: InputDecoration(
                  hintText: "Amount",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 1
                      )
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
               controller: controller.txtDate,
              decoration: InputDecoration(
                  hintText: "Date",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 1
                      )
                  )
              ),
            ),
          ),
          ElevatedButton(onPressed: () {
            controller.insertDb(double.parse(controller.txtAmount.text), controller.txtCategory.text, controller.txtDate.text, 0);
            controller.fetchValue();
          }, child: Text("Save",),),
        ],
      ),
    );
  }
}
