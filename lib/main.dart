

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterassignment/screen/HomeScreen.dart';
import 'base/Product.dart';


void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home:HomeScreen()
    );

  }
}
/*
* StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('product_images').snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              final docs = snapshot.data.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_, i) {
                  final data = docs[i].data();
                  return ListTile(
                    title: Text(data['id']),
                    subtitle: Text(data['image_url']),
                  );
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        )*/