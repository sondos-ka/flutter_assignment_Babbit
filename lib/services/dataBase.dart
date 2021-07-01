
import 'package:cloud_firestore/cloud_firestore.dart';

import '../base/Product.dart';

class dataBase{
  dataBase();

  //collection reference
  final CollectionReference productImageCollection=FirebaseFirestore.instance.collection('product_images');

  Stream<List<Product>> get products{

    return productImageCollection.snapshots().map(_productListFromSnapshot);
  }


  List<Product> _productListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return Product(
          id: doc.data()['id']??0,
          mediaUrl: doc.data()['media_url']?? '',
          productId: doc.data()['product_id']?? 0,
          category: doc.data()['category']?? 0,
          price: doc.data()['price']?? 0
      );
    }
    ).toList();

  }

/*
  Stream<Product> get pro{

    return productImageCollection.snapshots().map(_productFromSnapshot);
  }

 Product _productFromSnapshot(QuerySnapshot snapshot){
    snapshot.docs.map((doc) {
      return Product(
          id: doc.data()['id']?? '',
          mediaUrl: doc.data()['media_url']?? '',
          productId: doc.data()['product_id']?? ''
      );}
    );






  }*/
}
