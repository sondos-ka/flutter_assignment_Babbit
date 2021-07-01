
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterassignment/base/strings.dart';

import 'const.dart';


Widget logoBlock(width){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(15),

          child:SvgPicture.asset('assets/Icons/Cart.svg') ,
        ),

       Container(
         alignment: Alignment.center,
           height: 80,
           child: Image.asset('assets/Logo/Logo.png')),
        Container(
          padding: EdgeInsets.all(15),

          child:SvgPicture.asset('assets/Icons/search.svg') ,
        ),

      ],

    )
    ,
    Container(width: width,
        padding: EdgeInsets.all(15),
        child: Image.asset('assets/Banners/Banner.png',fit: BoxFit.cover,))],
  );

}








Widget categoriesBlock(String image,String name,double width){
  return Container(
width: width,
    height: 130,

    padding: EdgeInsets.only(top: 10),
    child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), side: new BorderSide(color: Colors.black, width: 1.0),
            ),
            color: cCardCat,
            child:Stack(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(image,fit: BoxFit.cover,),
                  ),
                ),

                Container(
                alignment: Alignment.center,
                  width: width/3,
                    padding: EdgeInsets.only(left: 12),
                    child: Text(name,style: categoryTextStyle,textAlign: TextAlign.center,))
              ],
            )




        ),
  );



}

Widget productShow(width,image,price){

  return Container(
    width: width,


    padding: EdgeInsets.only(top: 10),
    child: Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), side: new BorderSide(color: Colors.black, width: 1.0),
        ),
        color: Colors.white,
        child:Container(
          child: Column(

            children: [
              Container(
                alignment: Alignment.topRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(image,fit: BoxFit.cover,),
                ),
              ),

              SizedBox(height: 5,),

              Container(
                  alignment: Alignment.center,
                  child: Text(price.toString(),style: categoryTextStyle,textAlign: TextAlign.center,))
            ],
          ),
        )




    ),
  );


}
