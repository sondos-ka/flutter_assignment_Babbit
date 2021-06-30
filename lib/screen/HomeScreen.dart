
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterassignment/base/const.dart';
import 'package:flutterassignment/base/rootWidgets.dart';
import 'package:flutterassignment/base/strings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List cats= List<Cat>();


  @override
  void initState() {
   cats..add(Cat(id: 1, name: sCat1, image: sImgCat1

      ))..add(Cat(id: 2, name: sCat2, image: sImgCat2

      ))..add(Cat(id: 3, name: sCat3, image: sImgCat3

      ))..add(Cat(id: 4, name: sCat4, image: sImgCat4

      ))..add(Cat(id: 5, name: sCat5, image: sImgCat5

      ))..add(Cat(id: 6, name: sCat6, image: sImgCat6

      ))..add(Cat(id: 7, name: sCat7, image: sImgCat7

      ))..add(Cat(id: 8, name: sCat8, image: sImgCat8

      ))..add(Cat(id: 9, name: sCat9, image: sImgCat9

      ))..add(Cat(id: 10, name: sCat10, image: sImgCat10

      ))..add(Cat(id: 11, name: sCat11, image: sImgCat11

      ))..add(Cat(id: 12, name: sCat12, image: sImgCat12

      ))

      ;
        super.initState();


  }
  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(

          child: Column(
            children: [
              logoBlock(MediaQuery.of(context).size.width),
            Container(

          child: Column(
            children: [
              Text(sCategories,style:categoryLableStyle),
              Container(
                color: cRedLine,height:2,width: 85,)]))
         , Expanded(
//                padding: EdgeInsets.all(10),
//          height: 2000,

                   child:
                IgnorePointer(
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:1.85

                      ),
                      itemCount: cats.length,

                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: categoriesBlock('assets/BabitCategories/'+cats[index].image+'.png',cats[index].name,width/2-10));
                      }
                  ),
                )

                /* Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               categoriesBlock('assets/BabitCategories/$sImgCat1.png',sCat1,width/2-10),
               categoriesBlock( 'assets/BabitCategories/$sImgCat2.png',sCat2,width/2-10)
             ],
           ),*/
         )
             , /* Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                     height: 200,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 200,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      height: 200,
                      color: Colors.green,
                    ),
                    Container(
                      height: 200,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),*/


            ],
          ),
        ),
      ),
    );
  }
}
