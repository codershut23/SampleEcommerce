
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'VerficationPage.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _phoneNumberController = TextEditingController();
  String _errorText = '';

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _validatePhoneNumber() {
    String phoneNumber = _phoneNumberController.text.trim();

    if (phoneNumber.length != 10) {
      setState(() {
        _errorText = 'Invalid phone number';
      });
    } else {
      setState(() {
        _errorText = '';
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot password",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 10, right: 20),
                child: Text(
                  "If your e-mail address is no longer valid, or the service is not"
                      " a Computer rest the password",
                  maxLines: 2,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    prefix: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.phone_android_outlined),
                    ),
                    hintText: "phone",
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    errorText: _errorText.isNotEmpty ? _errorText : null,
                  ),
                ),
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black87),
                child: TextButton(
                  onPressed: _validatePhoneNumber,
                  child: Text(
                    "Submit",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


