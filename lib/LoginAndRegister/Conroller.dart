

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../FirebaseService.dart';

class LoginController extends GetxController
{
   final txtEmail = TextEditingController();
   final txtPass = TextEditingController();
    void createAccount(String email,password)
    {
        Service.service.createAccount(email, password);
    }

   void singInAccount(String email,password)
   {
       Service.service.signInAccount(email, password);
   }
   void signOut()
   {
     Service.service.logout();
   }
}