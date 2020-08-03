import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reused_card.dart';
import 'package:flutter/material.dart';
import 'reused_card.dart';




class  Resultpage extends StatelessWidget {
  
Resultpage({@required this.resultsText, @required this.bmiresult, @required this.interpretation});

final String bmiresult ;
final String resultsText ;
final String interpretation ; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar( 
        centerTitle: true,
        title: const Text('BMI CALCULATOR', style: TextStyle(color: Color(0xFFEB1555),), ),
        
      ),  
       body: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       crossAxisAlignment: CrossAxisAlignment.stretch,
       
         children: <Widget>[
          Expanded(
            child: Container(
               margin: EdgeInsets.all(20.0),
              child:Text('Your Result',style: kboldtext,textAlign: TextAlign.center,),
            ),
          ),
          Expanded(
            flex: 5 ,
            child: Reusecard(
          colour:  npadcolor,
           cardChild : Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Text(resultsText.toUpperCase(),style: kresulttext,),
              Text(bmiresult,style: kbmiboldtext,),
              Text(interpretation,style: klabeltext, ),
            ],
          ),  
          ),
          ),
           GestureDetector(
            onTap: (){
              Navigator.pop(context);
            } ,
            child:  Container(
             color: Color(0xFFEB1555),
             margin: EdgeInsets.only(top :0.0),
             height: bottomContainerHeight,  
             width: double.infinity, 
             child: Center(
             child :   Text('HOME', style:TextStyle(fontSize: 23),), ), 
            ),),     
         ],  
         ),        
    );
  }
}
