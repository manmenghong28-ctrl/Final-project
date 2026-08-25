
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_login/views/homescreen.dart';
import 'package:flutter_firebase_login/views/login.dart';
import 'package:get/get.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signup (String email,String password)async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      await auth.signOut();
      Get.snackbar("Success", "Signup success");
      Get.offAll(()=>LoginScreen());
    }catch(e){
      Get.snackbar("Failed", "${e.toString()}",duration: Duration(seconds: 15));
    }
  }
  Future <void> signin(String email,String password)async{

    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "SignIn success");
      Get.to(Homescreen());
    }catch(e){
      Get.snackbar("Failed", "${e.toString()}");
    }
  }
}