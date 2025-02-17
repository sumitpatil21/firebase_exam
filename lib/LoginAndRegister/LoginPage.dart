


import 'package:firebase_exam/HomePage/HomeScreen.dart';
import 'package:firebase_exam/LoginAndRegister/Conroller.dart';
import 'package:firebase_exam/LoginAndRegister/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../FirebaseService.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  @override
  final controller=Get.put(LoginController());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: controller.txtEmail,
                      decoration: InputDecoration(
                          hintText: "Email",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1
                              )
                          )
                      ),
                    ),
                    TextField(
                      controller: controller.txtPass,
                      decoration: InputDecoration(
                          hintText: "Password",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1
                              )
                          )
                      ),
                    ),

                    TextButton(onPressed: () {
                      Get.to(RegisterPage());
                    }, child: Text("You Have Don't Account!"),),
                    ElevatedButton(onPressed: () {
                      controller.singInAccount(controller.txtEmail.text,controller.txtPass.text);
                      if(Service.service.currentUser()!=null)
                        {
                          Get.to(HomeScreen());
                        }
                    }, child: Text("Sing In.."),),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );;
  }
}
