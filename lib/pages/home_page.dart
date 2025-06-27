import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "SMART",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "SACCOS",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ],
                ),

              ),
              SizedBox(height: 10),
              Text(
                "Track your Savings Account from anywhere at anytime",
                style: TextStyle(color: Color(0xFF002147),fontSize: 18),

              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12)
                    ),
                    onPressed: (){},
                    child: Text(
                      "Register your SACCO",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal:20,vertical:12),
                    ),


                    onPressed: (){},
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),






                ],
              ),



            ],
          )

      ),
    );
  }
}

