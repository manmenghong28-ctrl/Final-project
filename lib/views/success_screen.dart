import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/views/homescreen.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Center(
          child:Column(
            children: [
              Text("Congratulations!",style: TextStyle(fontSize: 35,decorationColor: Colors.amber),),
              Icon(Icons.check_circle_outline
              ,size: 300,color: Colors.green,),
              Text("SUCCESS!",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
              Text("Your payment has been processed "),
              Text("Successfully."),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  backgroundColor: Colors.green
                ),
                onPressed: (){
                  
                  Get.to(Homescreen());
                }, 
                child: Text("Done",style: TextStyle(color: Colors.white,fontSize: 40),))
        
            ],
          ),
        ),
      ),
    );
  }
}