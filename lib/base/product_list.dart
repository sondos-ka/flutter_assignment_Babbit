

import 'package:flutter/material.dart';
import 'package:flutterassignment/base/Product.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {

final products=Provider.of<List<Product>>(context);
try{
products.forEach((product) {print(product.mediaUrl);
print("done");
});}catch(e){print("e $e");}
    return Container();
  }
}
