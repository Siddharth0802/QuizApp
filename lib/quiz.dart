import 'package:quizbuzz/answer.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
int totalscore = 0;


class quiz extends StatefulWidget {

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {



  int questionIndex = 0;

  bool answerselected = false;
  bool quizend=false;


  void questionanswered(bool answerScore){
    setState(() {
      answerselected = true;

      if(answerScore){
        totalscore+=4;
      }
      else{totalscore--;}

      if(questionIndex+1==questions.length){
        quizend = true;
      }


    });
  }

  void nextquestion(){
    setState(() {
      questionIndex++;
      answerselected = false;
    });

    if(questionIndex>=questions.length){
      questionIndex = 0;

      showDialog(context: context, builder: (_) => showresult());
    }

  }

  @override
  Widget build(BuildContext context) {
    var ht=MediaQuery.of(context).size.height;
    var wt=MediaQuery.of(context).size.width;

    return Scaffold(


      appBar: AppBar(backgroundColor: Colors.black),

      body: Center(
        child: Column(
          children: [
            SizedBox(height:ht/30),

            Container(
              child: Text(
                  'Question : ${questionIndex}/${questions.length}',
                  style: GoogleFonts.poppins(fontSize: 30,fontWeight: FontWeight.bold)
              ),
            ),

            SizedBox(height:ht/25),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              height: ht/7,
              width: wt,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Text(questions[questionIndex]['question'],
                  style: GoogleFonts.poppins(fontSize:19,color: Colors.white)
              ),
            ),    //Question

            SizedBox(height: 50),

            ...(questions[questionIndex]['answers']
            as List<Map<String,Object>>)
                .map((answer) => Answer(
              answertext: answer['answerText'],
              answericon:answerselected?
                      answer['score']?
                              Icon(Icons.check_box,color: Colors.green,) :
                                          Icon(Icons.close,color: Colors.red,):
                      Icon(Icons.circle,color: Colors.grey,),


              answertap: (){

                questionanswered(answer['score']);
              },
            )
            ),

            SizedBox(height: 50,),

            GestureDetector(
              onTap: (){
                nextquestion();
              },

              child: Container(
                width: wt/2,
                height: ht/14,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                child: Text(quizend? 'Show Result':'Next Question',style: GoogleFonts.poppins(fontSize:20,fontWeight:FontWeight.bold,color: Colors.white),) ,
              ),
            ),       //Next Question


          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}


class showresult extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var ht = MediaQuery.of(context).size.height;
    var wt = MediaQuery.of(context).size.width;
    // totalscore = 0;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Container(
              height: ht/5,
              width: wt/1.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
              ),
              child: Center(
                child: Text('Your Score : $totalscore/${questions.length*4}',style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,),
            ),
              ),
            ),

              SizedBox(height: ht/5,),

            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

              },

              child: Container(
                alignment: Alignment.center,
                width: wt/1.8,
                height: ht/13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                child: Text('Restart Quiz',
                  style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}




final questions = const [

  {
    'question':'The zeroes of the quadratic polynomial x2 + 99x + 127are',
    'answers':[
      {'answerText':'(A) both positive','score':false},
      {'answerText':'(B) both negative','score':true},
      {'answerText':'(C) one positive and one negative ','score':false},
      {'answerText':'(D) Both Equal','score':false},
    ]
  },

  {
    'question':"If the zeroes of the quadratic polynomial x2 + bx + c , c ≠ 0are equal, then",
    'answers':[
      {'answerText':"(A) c and a have opposite signs",'score':false},
      {'answerText':"(B) c and b have opposite signs",'score':false},
      {'answerText':"(B) c and b have opposite signs",'score':true},
      {'answerText':"(D) c and b have the same sign",'score':false},
    ]
  },

  {
    'question':"The number of polynomials having zeroes as –2 and 5 is",
    'answers':[
      {'answerText':"(A) 1 ",'score':false},
      {'answerText':"(B) 2",'score':false},
      {'answerText':"(C) 3",'score':false},
      {'answerText':"(D) MORE THAN 3",'score':true},
    ]
  },

  {
    'question':"The degree of the polynomial (x + 1) (x\u00B2 – x – x\u2074 +1) is:",
    'answers':[
      {'answerText':"(A) 2 ",'score':false},
      {'answerText':"(B) 3 ",'score':false},
      {'answerText':"(C) 4 ",'score':false},
      {'answerText':"(D) 5 ",'score':true},
    ]
  },

  {
    'question':"If the zeroes of the quadratic polynomial x2 + (a + 1)x + b are 2 and –3, then",
    'answers':[
      {'answerText':"(A) a = –7, b = –1 ",'score':false},
      {'answerText':"(B) a = 5, b = –1",'score':false},
      {'answerText':"(C) a = 2, b = – 6 ",'score':false},
      {'answerText':"(D) a = 0, b = – 6 ",'score':true},
    ]
  },

  {
    'question':" If one of the zeroes of the cubic polynomial x3 + ax2 + bx + c is –1, then theProduct of the other two zeroes is",
    'answers':[
      {'answerText':"(A) b-a+1 ",'score':true},
      {'answerText':"(B) b-a-1 ",'score':false},
      {'answerText':"(C) a-b+1 ",'score':false},
      {'answerText':"(D) a-b-1 ",'score':false},
    ]
  },

  {
    'question':"The value of p for which the polynomial x3 + 4x2 –px + 8 is exactly divisible by (x – 2) is: ",
    'answers':[
      {'answerText':"(A) 0 ",'score':false},
      {'answerText':"(B) 3 ",'score':false},
      {'answerText':"(C) 5 ",'score':false},
      {'answerText':"(D) 16 ",'score':true},
    ]
  },

  {
    'question':"If one of the zeroes of the quadratic polynomial (k – 1)x2 + kx + 1 is –3, then the value of k is: ",
    'answers':[
      {'answerText':"(A) 4/3 ",'score':true},
      {'answerText':"(B) -4/3 ",'score':false},
      {'answerText':"(C) 2/3 ",'score':false},
      {'answerText':"(D) -2/3 ",'score':false},
    ]
  },

  {
    'question':"If sum of the squares of zeroes of the quadratic polynomial 6x2 + x + k is 25/36, the value of k is:",
    'answers':[
      {'answerText':"(A) 4 ",'score':false},
      {'answerText':"(B) -4 ",'score':false},
      {'answerText':"(C) 2",'score':false},
      {'answerText':"(D) -2 ",'score':true},
    ]
  },

  {
    'question':"If α and β are zeroes of x2 – 4x + 1, then 1/α + 1/β – αβ is:",
    'answers':[
      {'answerText':"(A) 3 ",'score':true},
      {'answerText':"(B) 5 ",'score':false},
      {'answerText':"(C) -5 ",'score':false},
      {'answerText':"(D) -3 ",'score':false},
    ]
  },

];
