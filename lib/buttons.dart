import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RButtons extends StatelessWidget {
  @override
 RButtons({@required this.icons, this.button} );
  final IconData icons ; 
  final Function button ; 
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icons),
      onPressed: button,
          constraints: BoxConstraints.tightFor(
            width: 50.0,
            height: 50.0,
          ),
         shape: CircleBorder(),
         fillColor: Color(0xFF4C4F5E),      
    );
  }
}