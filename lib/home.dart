import 'main.dart';
import 'quiz.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'main.dart';

class home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    totalscore = 0;
    var ht = MediaQuery.of(context).size.height;
    var wt = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
      ),

      body: Center(
        child: Column(
          children: [

            SizedBox(height: ht/10,),


            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('QUIZ BUZZ',textStyle: GoogleFonts.ubuntu(fontSize:30,color: Colors.white,fontWeight: FontWeight.bold),
                speed: Duration(milliseconds: 100),
                ),
              ],

              repeatForever: true,
            ),

            SizedBox(height: ht/8,),


            Container(
                height: ht/5.25,
                width: wt/1.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Center(child: Text('Instructions',
                  style: GoogleFonts.ubuntu(
                      fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                  ),
                  )),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Center(child: Text('Each Correct Answer will result into +4 Score and Each Incorrect Answer will result into -1 Score.',
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),),
                  )
                ],
              ),
            ),

            SizedBox(height: ht/8,),


            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)  => quiz()  ));

              },

              child: Container(
                alignment: Alignment.center,
                width: wt/2,
                height: ht/14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Text('Begin',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            )
          ],
        ),
      ),


      backgroundColor: Colors.black,
    );
  }
}
