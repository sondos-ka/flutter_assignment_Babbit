import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterassignment/base/strings.dart';




//colors
Color cRedLine=Color(0xFFb82d32);
Color cCardCat=Color(0xFFfeebe7);
Color cButton=Color(0xFF2b2b2b);
Color cPrice=Color(0xFF288e28);



//





//style
TextStyle categoryLableStyle= TextStyle(fontSize:23,fontWeight: FontWeight.bold,color: Colors.black);
TextStyle categoryTextStyle= TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Colors.black,);
TextStyle categoryListStyle= TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Colors.grey,);
TextStyle categoryListStyleSelected= TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Colors.black);
TextStyle priceStyle= TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Colors.green,);
TextStyle imageTextStyleWhite= TextStyle(fontSize:30,fontWeight: FontWeight.bold,color: Colors.white);

TextStyle imageTextStyle= TextStyle(fontSize:30,fontWeight: FontWeight.bold,color: Colors.black);
List<String> catListView=[sAll, sCat2,sCat1,sCat4,sCat3,sCat6,sCat5,sCat8,sCat7,sCat10,sCat9,sCat12,sCat11];


class Cat{
    int id;
    String name;
  String image;
  Cat({this.id,this.image,this.name});




}


