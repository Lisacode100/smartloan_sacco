import 'package:flutter/material.dart';
import 'verifyotp.dart';
class ResetPin extends StatefulWidget {
  const ResetPin({super.key});

  @override
  State<ResetPin> createState() => _ResetPinState();

}

class _ResetPinState extends State<ResetPin> {
  final TextEditingController _phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                    "<Back to HomePage>",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    )
                ),

              ),
            ),
            Container(
              width: 350,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),

                    )
                  ]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child:Icon(Icons.lock,size:40,color: Colors.green),
                  ),
                  SizedBox(height:16),
                  const Center(
                    child:Text(
                      "Reset your pin",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Enter your phone number in order to receive a code",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 10),

                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: '+256 *** *** ***',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),

                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){
                      String enteredPhone = _phoneController.text.trim();
                      if (!enteredPhone.startsWith("+")){
                        enteredPhone = "+256 $enteredPhone";
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=>VerifyOtpPage(phoneNumber:enteredPhone),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Send Code"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}