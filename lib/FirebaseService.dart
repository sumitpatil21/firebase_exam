import 'package:firebase_auth/firebase_auth.dart';

class Service {
   static Service service = Service._();
   Service._();

   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

   Future<void> createAccount(String email,String password)
   async {
     await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
   }
   Future<void> signInAccount(String email,String password)
   async {
     await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
   }

   Future<void> logout()
   async {
      await firebaseAuth.signOut();
   }

   Future<User?> currentUser()
   async {
     await firebaseAuth.currentUser;
     final currentUser = firebaseAuth.currentUser;
     User? user;
     if(currentUser!=null)
       {
         print(currentUser.email);
         return user;
       }
     else
       {
         return null;
       }

   }
}