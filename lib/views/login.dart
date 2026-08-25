import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/services/auth_service.dart';
import 'package:flutter_firebase_login/views/homescreen.dart';
import 'package:flutter_firebase_login/views/register.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
   TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();
   AuthService authService=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 244, 226),
      appBar: AppBar(title: Text("Sign in")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text("Sign in to enjoy a seamless shopping experience."),
            Divider(height: 85, color: const Color.fromARGB(255, 95, 97, 97)),
            TextField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter email",
                label: Text("Email"),
                suffix: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter password",
                label: Text("Password"),
                suffixIcon: Icon(Icons.remove_red_eye_sharp),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
               if(email.text.isNotEmpty && password.text.isNotEmpty){
                authService.signin(email.text, password.text);
               }else{
                Get.snackbar("Error", "Please check email and password not match ");
               }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  minimumSize: Size(350, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 68, 65, 65),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text("Sign In"),
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: const Color.fromARGB(255, 38, 31, 31),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 38, 28, 28),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: const Color.fromARGB(255, 33, 25, 25),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
             Center(
              child: OutlinedButton.icon(
                onPressed: (){}, 
                //icon: Icon(Icons.g_mobiledata),
                label: Text("Countinue with Google"),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                ),
            ),
            SizedBox(height: 20,),
             Center(
              child: OutlinedButton.icon(
                onPressed: (){}, 
                //icon: Icon(Icons.g_mobiledata),
                label: Text("Countinue with Apple"),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an accont?"),
                TextButton(
                  onPressed: (){
                    Get.to(RegisterScreen());
                  }, 
                  child: Text("Sign Up")),
              ],
              ),
          ],
        ),
      ),
    );
  }
}
