
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
import 'Screens/puppylogin.dart';
class Locationpage extends StatefulWidget {
  const Locationpage({Key? key}) : super(key: key);

  @override
  State<Locationpage> createState() => _LocationpageState();
}

class _LocationpageState extends State<Locationpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: white,),
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            // color:Colors.red,
            child: Center(child: SvgPicture.asset("assets/svg/flashscreen.svg",height: 200,)),
          ),

          Container(
            margin: EdgeInsets.only(top: 70),
            child: Text("We need your location",
    style: GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: black
    ),
    ),
            ),
          Container(
            margin: EdgeInsets.only(top:5),
            child: Text(
              "Set your current loction", style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: grey
            ),
              maxLines: 2,
            ),

          ),
          Container(
            margin: EdgeInsets.only(top:5),
            child: Text(
              "explore the app", style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: grey
            ),
              maxLines: 2,
            ),

          ),

Container(

  height: 45,
  width: double.infinity,
  margin: EdgeInsets.only(top: 18, right: 55, left: 55),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: purple),
    color: purple
  ),
  child:InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => puppylogin(),));
    },
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.location_fill,color: white,),
          Padding(
            padding: const EdgeInsets.only(left:
            5),
            child: Text("Enable Device Location",
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
          ),
          // Container(
          //   margin: ,
          // )
        ],
      ),
    ),
  ),
),

          Container(
            height: 45,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10, right: 55, left: 55),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border(
                left: BorderSide( color: purple),
                right: BorderSide( color: purple),
                top: BorderSide( color: purple),
                bottom: BorderSide( color: purple),
              ),
            ),
            child: Center(
              child: Text("Enter your location manually"),
            ),
          )
        ],
      ),
    );

  }
}
