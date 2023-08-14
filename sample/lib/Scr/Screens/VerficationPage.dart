
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../locationfile.dart';


class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);
  @override
  State<VerificationPage> createState() => _VerificationPageState();
}


class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  final int _pinLength = 5;
  String _errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Text(
              "Enter the Code to verify your code",
              style: GoogleFonts.inter(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            OTPTextField(
              controller: _otpController,
              pinLength: _pinLength,
              onTextChanged: (pin) {
                setState(() {
                  _errorText = '';
                });
              },
              onSubmit: (pin) {
                _validateOTP(pin);
              },
            ),
            if (_errorText.isNotEmpty)
              Text(
                _errorText,
                style: TextStyle(color: Colors.red),
              ),
    // _validateOTP(_otpController.text);
            SizedBox(height: 20),
          InkWell(
            onTap: () {
              _validateOTP(_otpController.text);
            },
            child: Container(
              margin: EdgeInsets.only(top: 10,right: 20, left: 20),
              height: 40,
              width:double.infinity,
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(20),
                color: Colors.black87
              ),
              child:Center(
                child: Text(
                  "Verify",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ) ,
            ),
          )
          ],
        ),
      ),
    );
  }

  void _validateOTP(String pin) {
    if (pin.length == _pinLength) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessPage()), // Navigate to the success page
      );
    } else {
      setState(() {
        _errorText = "Invalid code";
      });
    }
  }
}

class OTPTextField extends StatelessWidget {
  final TextEditingController controller;
  final int pinLength;
  final ValueChanged<String>? onTextChanged;
  final ValueChanged<String>? onSubmit;

  OTPTextField({
    required this.controller,
    required this.pinLength,
    this.onTextChanged,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return PinInputTextField(
      pinLength: pinLength,
      decoration: _pinDecoration(),
      controller: controller,
      autoFocus: true,
      onChanged: onTextChanged,
      onSubmit: onSubmit,
    );
  }

  PinDecoration _pinDecoration() {
    return UnderlineDecoration(
      textStyle: TextStyle(fontSize: 24, color: Colors.black),
      colorBuilder: PinListenColorBuilder(Colors.black, Colors.blue),
      obscureStyle: ObscureStyle(
        isTextObscure: true,
        obscureText: '•', // You can customize the obscure character
      ),
      gapSpace: 8,
      // Rounded line ends
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Success')),
      body: InkWell(
        onTap: () {
    Navigator.push(context,MaterialPageRoute(builder: (context) => Locationpage(),));
        },
        child: Center(
          child: Text(
            'OTP Verification Successful!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}



