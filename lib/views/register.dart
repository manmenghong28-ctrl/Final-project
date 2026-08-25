import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/services/auth_service.dart';
import 'package:flutter_firebase_login/views/login.dart';
import 'package:get/route_manager.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  TextEditingController email =TextEditingController();
  TextEditingController password=TextEditingController();
  AuthService authService=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 244, 226),
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://i.pinimg.com/736x/eb/76/a4/eb76a46ab920d056b02d203ca95e9a22.jpg"),
              ),
              Text("Sign Up",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Account",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text("Sign up to start your premium shopping experience."),
            Divider(height: 85, color: const Color.fromARGB(255, 95, 97, 97)),
            TextField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter email",
                label: Text("Email"),
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
           
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                 if(email.text.isNotEmpty && password.text.isNotEmpty){
                  authService.signup(email.text, password.text);
                 }else{
                  Get.snackbar("Error", 'Please fill email and password');
                    
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
                child: Text("Sign Up"),
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
                    Get.to(LoginScreen());
                  }, 
                  child: Text("Sign In")),
              ],
              ),
          ],
        ),
      ),
    );
  }
}
