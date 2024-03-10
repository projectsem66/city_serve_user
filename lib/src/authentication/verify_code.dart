import 'package:city_serve/navigationBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../login/round_button.dart';


class VerifyCodeScreen extends StatefulWidget {
  final String verificatioId;
  const VerifyCodeScreen({super.key, required this.verificatioId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool  loading = false;
  final verificationCodeController = TextEditingController();
  final auth =FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Login"),
        backgroundColor: Colors.purple.shade200,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: verificationCodeController,
            keyboardType: TextInputType.phone,
            decoration:InputDecoration(
                hintText: '6 digit code'
            ),
          ),
          SizedBox(height: 80,),
          RoundButton(title: "verify",
            loding: loading,
            onTap: () async {
            setState(() {
              loading = true;
            });
            final credential = PhoneAuthProvider.credential(
                verificationId: widget.verificatioId,
                smsCode: verificationCodeController.text.toString()
            );

            try {
              await auth.signInWithCredential(credential);
              
              Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationBarr()));
            }catch(e){

            }

            },)
        ],
      ),
    );
  }
}
