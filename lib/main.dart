import 'package:flutter/material.dart';
import 'package:shoppingg_list1/ui/shopping_list_page.dart';

void main() {
  runApp(ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          backgroundColor: Colors.white60
      ),
      home: ShoppingListPage(),
    );
  }
}