
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../colors.dart'; // Import the package

class puppylogin extends StatefulWidget {
  const puppylogin({Key? key}) : super(key: key);

  @override
  State<puppylogin> createState() => _puppyloginState();
}

class _puppyloginState extends State<puppylogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Center(
              child: SvgPicture.asset("assets/svg/flashscreen.svg"),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text("login or signup",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: grey,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top:16, left: 55, right: 55),
              decoration: BoxDecoration(
                border: Border.all(color: white, width: 1.0),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: white.withOpacity(1),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: white, width: 1.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.white, width: 1.0),
                  ),
                  hintText: "phone number",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                    ),
                    borderRadius: BorderRadius.circular(10),

                  ),
                ),
                initialCountryCode: 'US', // Set the initial country code
                onChanged: (phone) {
                  print(phone.completeNumber); // Print the complete phone number
                },
              ),
            ),
            Container(

              height: 45,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10, right: 55, left: 55),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: purple),
                  color: purple
              ),
              child:Center(
                child: Text("Continue",
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: white
                  ),
                ),
              ),

                ),
            Container(
              margin: EdgeInsets.only(top: 10),
               child: Text("or", style: GoogleFonts.inter(
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   color: grey
               ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                    color:Colors.red, child: SvgPicture.asset("assets/svg/fb.svg",height: 25,width: 25,)),
              ],
            )

          ]),
      ));


  }
}
