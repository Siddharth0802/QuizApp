import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answer extends StatelessWidget {
  final String answertext;
  final Icon answericon;
  final Function answertap;
  
  Answer({this.answertext,this.answericon,this.answertap,});

  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wt = MediaQuery.of(context).size.width;
    return GestureDetector(


      onTap:answertap,


      child: Container(

        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 5,vertical:15 ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: ht/14,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(answertext,style: GoogleFonts.poppins(color: Colors.white,),),
            answericon,

          ],
        ),

      ),

    );
  }
}
