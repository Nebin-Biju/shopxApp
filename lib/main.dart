import 'package:flutter/material.dart';
import 'package:shopxapp/pages/homepage.dart';

void main(){
  runApp(ShopX());
}
class ShopX extends StatelessWidget {
  const ShopX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
