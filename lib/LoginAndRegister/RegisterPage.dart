import 'package:firebase_exam/HomePage/HomeScreen.dart';
import 'package:firebase_exam/LoginAndRegister/Conroller.dart';
import 'package:firebase_exam/LoginAndRegister/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});
 final controller=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
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
                    ElevatedButton(onPressed: () {
                      controller.createAccount(controller.txtEmail.text,controller.txtPass.text);
                      Get.to(LoginPage());
                    }, child: Text("Sing Up.."),),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
