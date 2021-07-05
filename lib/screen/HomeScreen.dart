
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterassignment/base/Product.dart';
import 'package:flutterassignment/base/const.dart';
import 'package:flutterassignment/base/rootWidgets.dart';
import 'package:flutterassignment/base/strings.dart';
import 'package:http/http.dart' as http;

String price="";
var discount;
var Size;
class ProductsRepository {

  Future<List<dynamic>> getProducts() async {
    final response = await http.get("https://f8520130-7c98-4e64-8490-9e1a9c377eb4.mock.pstmn.io/api/products/272?env=test");
    var data = json.decode(response.body);
    price=data["unit_price"];
    discount=data["unit_discount_price"];
    Size=data["product_size"];



    List<dynamic> productImages = data["product_images"];
    print(productImages[0]["media_url"]);
    return productImages;
  }

}



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
  Future<Product> futureProduct;

List cats= List<Cat>();
  int curPage=3;
  int selectedListItem1=0;
  int selectedListItem2=0;
  int selectedListItem3=0;



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
      Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,


        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:cRedLine,
          currentIndex : curPage,
            onTap: (int index) {
        setState(() {
        this.curPage = index;
        },);},//
            // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
                icon:  curPage== 0?  SvgPicture.asset('assets/Icons/User off-1.svg'): SvgPicture.asset('assets/Icons/User off.svg'),
                label:sUser
            ), BottomNavigationBarItem(
                icon: curPage== 1?SvgPicture.asset('assets/Icons/categories off-1.svg'):SvgPicture.asset('assets/Icons/categories off.svg'),
                label:sCategories
            ),BottomNavigationBarItem(
              icon: curPage==2 ? SvgPicture.asset('assets/Icons/chat off-1.svg'):SvgPicture.asset('assets/Icons/chat off.svg'),
              label: sChat,
            ),BottomNavigationBarItem(
              icon: curPage==3 ? SvgPicture.asset('assets/Icons/Home on-1.svg'):SvgPicture.asset('assets/Icons/Home on.svg'),
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
                     return GestureDetector(
                       onTap: (){setState(() {
                         selectedListItem1=index;
                       });},
                       child: Container(
                         padding: EdgeInsets.only(left: 40),
                           child: Text(catListView[index], style:selectedListItem1==index?categoryListStyleSelected :categoryListStyle,)),
                     );
                  }
                ),
              ),
              FutureBuilder<List<dynamic>>(
                future: ProductsRepository().getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());

                  } else if (snapshot.hasData) {
                    return
                      Container(
                        height:MediaQuery.of(context).orientation==Orientation.portrait? 500:850,
                        child: IgnorePointer(
                          child: Container(
                            padding: EdgeInsets.all( 10),
                            child: GridView.builder(
                                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio:MediaQuery.of(context).orientation==Orientation.portrait? width/750: width/1300,
                                ),
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return productShow(width / 3 - 10, snapshot.data[index]["media_url"],
                                      price );
                                }
                            ),
                          ),
                        ),
                      );
                    /*Text(
                      snapshot.data[0]["media_url"]

                    );*/
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),

              Container(
                  padding: EdgeInsets.all(20),

                  child: watchMoreButton((){},width)),

              Container(

                  child: imageText("assets/Banners/special-sizes.png",sBigSizes,width,imageTextStyle)),
              Container(
                padding: EdgeInsets.fromLTRB(0,20,15,0),
                height: 50,
                child: ListView.builder(
                    reverse: true,
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: cats.length,
                    itemBuilder: (BuildContext context, int index){
                      return GestureDetector(
                        onTap: (){setState(() {
                          selectedListItem2=index;
                        });},
                        child: Container(
                            padding: EdgeInsets.only(left: 40),
                            child: Text(catListView[index], style: selectedListItem2==index?categoryListStyleSelected :categoryListStyle,)),
                      );
                    }
                ),
              ),
              FutureBuilder<List<dynamic>>(
                future: ProductsRepository().getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());

                  } else if (snapshot.hasData) {
                    return
                      Container(
                        height:MediaQuery.of(context).orientation==Orientation.portrait? 500:850,
                        child: IgnorePointer(
                          child: Container(
                            padding: EdgeInsets.all( 10),
                            child: GridView.builder(
                                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio:MediaQuery.of(context).orientation==Orientation.portrait? width/750: width/1300,
                                ),
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return productShow(width / 3 - 10, snapshot.data[index]["media_url"],
                                      price );
                                }
                            ),
                          ),
                        ),
                      );
                    /*Text(
                      snapshot.data[0]["media_url"]

                    );*/
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Container(
                  padding: EdgeInsets.all(20),

                  child: watchMoreButton((){},width)),
              Container(

                  child: imageText("assets/Banners/sale-banner.png",sDiscount,width,imageTextStyleWhite)),
              Container(
                padding: EdgeInsets.fromLTRB(0,20,15,0),
                height: 50,
                child: ListView.builder(
                    reverse: true,
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: cats.length,
                    itemBuilder: (BuildContext context, int index){
                      return GestureDetector(
                        onTap: (){setState(() {
                          selectedListItem3=index;
                        });},
                        child: Container(
                            padding: EdgeInsets.only(left: 40),
                            child: Text(catListView[index], style: selectedListItem3==index?categoryListStyleSelected :categoryListStyle,)),
                      );
                    }
                ),
              ),
              FutureBuilder<List<dynamic>>(
                future: ProductsRepository().getProducts(),
                builder: (context, snapshot) {

                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());

                  } else if (snapshot.hasData) {
                    return
                      Container(
                        height:MediaQuery.of(context).orientation==Orientation.portrait? 500:850,
                        child: IgnorePointer(
                          child: Container(
                            padding: EdgeInsets.all( 10),
                            child: GridView.builder(
                                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio:MediaQuery.of(context).orientation==Orientation.portrait? width/750: width/1300,
                                ),
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return productShow(width / 3 - 10, snapshot.data[index]["media_url"],
                                      price );
                                }
                            ),
                          ),
                        ),
                      );
                    /*Text(
                      snapshot.data[0]["media_url"]

                    );*/
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Container(
                  padding: EdgeInsets.all(20),

                  child: watchMoreButton((){},width)),









            ],
          ),
        ),
      ),
    );
  }
}
