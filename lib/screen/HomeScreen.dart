
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterassignment/base/Product.dart';
import 'package:flutterassignment/base/const.dart';
import 'package:flutterassignment/base/product_list.dart';
import 'package:flutterassignment/base/rootWidgets.dart';
import 'package:flutterassignment/base/strings.dart';
import 'package:flutterassignment/services/dataBase.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List cats= List<Cat>();
  int curPage=0;


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

    return
      StreamProvider<List<Product>>.value(
        value: dataBase().products,

        child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,


          bottomNavigationBar: BottomNavigationBar(
            currentIndex : curPage,
              onTap: (int index) {
          setState(() {
          this.curPage = index;
          },);},//
              // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                  icon:  curPage==0 ?  SvgPicture.asset('assets/Icons/User off.svg'): SvgPicture.asset('assets/Icons/User off-1.svg'),
                  label:sUser
              ), BottomNavigationBarItem(
                  icon: curPage==1 ?SvgPicture.asset('assets/Icons/categories off.svg'):SvgPicture.asset('assets/Icons/categories off-1.svg'),
                  label:sCategories
              ),BottomNavigationBarItem(
                icon: curPage==2 ? SvgPicture.asset('assets/Icons/chat off.svg'):SvgPicture.asset('assets/Icons/chat off.svg-1'),
                label: sChat,
              ),BottomNavigationBarItem(
                icon: curPage==3 ? SvgPicture.asset('assets/Icons/Home on.svg'):SvgPicture.asset('assets/Icons/Home on.svg-1'),
                label: sHome,
              ),
            ],
          ),

        body: SingleChildScrollView(
          child: SafeArea(

            child: Column(
              children: [

                logoBlock(MediaQuery.of(context).size.width),

              Text(sCategories,style:categoryLableStyle),

              Container(
                color: cRedLine,height:2,width: 85,)

           , Container(
                  padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).orientation== Orientation.landscape?MediaQuery.of(context).size.height*3-30:MediaQuery.of(context).size.height-70,
                     child: //for stop scroll in gridView
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
           )
               ,
                Container(
                  padding: EdgeInsets.fromLTRB(0,20,15,0),
                  height: 50,
                  child: ListView.builder(
                    reverse: true,
                   // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: cats.length,
                    itemBuilder: (BuildContext context, int index){
                       return Container(
                         padding: EdgeInsets.only(left: 40),
                           child: Text(catListView[index], style:categoryListStyle,));
                    }
                  ),
                ),
                Container(
                    height: 1000,
                    child: ProductList()),






              ],
            ),
          ),
        ),
    ),
      );
  }
}
