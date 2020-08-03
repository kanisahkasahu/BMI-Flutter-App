import 'package:flutter/material.dart';

class Reusecard extends StatelessWidget {
  @override
  Reusecard({@required this.colour, this.cardChild} );
  final Color colour;
  final Widget cardChild ;
  Widget build(BuildContext context) {
    return Container(
          child: cardChild,   
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10),
          ), 
    );
  }
}
