import 'package:bmi_calculator/Resultpage.dart';
import 'package:bmi_calculator/buttons.dart';
import 'package:bmi_calculator/calculatebmi.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 
import 'Icon_card.dart';
import 'reused_card.dart';
import 'Resultpage.dart';
import 'package:bmi_calculator/calculatebmi.dart';
   


int height = 180;
int weight = 50;
int age = 20;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardcolor = inactivecardcolor ; 
  Color femalecardcolor = inactivecardcolor;

   void updatecolor(int gender){
    if(gender== 1 ){
      if(malecardcolor == inactivecardcolor){
      malecardcolor = npadcolor ;
      femalecardcolor = inactivecardcolor ;  }
    }
    if(gender== 2 ){
      if(femalecardcolor == inactivecardcolor){
      femalecardcolor = npadcolor ;
      malecardcolor = inactivecardcolor ;  }
    }
   }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        centerTitle: true,
        title: const Text('BMI CALCULATOR', style: TextStyle(color: Color(0xFFEB1555),), ),
      ),
        body: Column(
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: GestureDetector( onTap: (){
                  setState(() {
                   updatecolor(1); 
                  });

                }, child: Reusecard(colour:malecardcolor,cardChild: IconCard(icon: FontAwesomeIcons.mars,label: 'MALE',),)),),
                 Expanded(child:GestureDetector(onTap: (){
                   setState(() {
                    updatecolor(2); 
                   });
                 }, child: Reusecard(colour: femalecardcolor,cardChild: IconCard(icon: FontAwesomeIcons.venus,label: 'FEMALE'),)),),]
            ),
            ),
            Expanded(child: Reusecard(colour: npadcolor, cardChild: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                
            children: <Widget>[
             Text('HEIGHT',style: klabeltext ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.baseline,
               textBaseline: TextBaseline.alphabetic,
               children: <Widget>[
                 Text(height.toString(),style:kboldtext,),
                 Text('cm',style: klabeltext,),
               ],
             ),
             Slider(
               min: 120.0,
               max: 220.0,
               value: height.toDouble(),
               activeColor: Color(0xFFEB1555),
               inactiveColor: Color(0xFF8D8E98),
               onChanged: (double newValue){
                 setState(() {
                  height = newValue.round();
                 });
               }
             )
            ],
            
            ), ), ),
            Expanded(child:  Row(
              children: <Widget>[
                Expanded(child:Reusecard(colour: npadcolor,
                cardChild: Column( mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Text('WEIGHT',style: klabeltext,) , 
                   Text(weight.toString(),style:kboldtext ,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       RButtons(icons: FontAwesomeIcons.minus,button: (){
                         setState(() {
                          weight--; 
                         });
                       },),
                       SizedBox(
                         width : 10.0,
                       ),
                       RButtons(icons: FontAwesomeIcons.plus,button: (){
                         setState(() {
                          weight++; 
                         });
                       },),
                     ],
                   )
                  ],
                ) ,),),
                 Expanded(child: Reusecard(colour: npadcolor, cardChild: Column( mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Text('AGE',style: klabeltext,),
                   Text(age.toString(),style:kboldtext ,),
                       Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       RButtons(icons: FontAwesomeIcons.minus ,button : (){
                         setState(() {
                          age--; 
                         });
                       },),
                       SizedBox(
                         width : 10.0,
                       ),
                       RButtons(icons: FontAwesomeIcons.plus,button: (){
                         setState(() {
                          age++; 
                         });
                       },),
                     ],
                   )
                  ],
                ) ,),),]
            ),),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Resultpage(
                bmiresult : calc.calculateBMI(),
                resultsText : calc.getResults(),  
                interpretation : calc.bmiInterpretation()
              )));

               
            } ,
            child:  Container(
             color: Color(0xFFEB1555),
             margin: EdgeInsets.only(top :0.0),
             height: bottomContainerHeight,  
             width: double.infinity, 
             child: Center(
             child :   Text('CALCULATE', style:TextStyle(fontSize: 23),), ), 
            ))
            
          ],
        )
    );
  }
}





 

