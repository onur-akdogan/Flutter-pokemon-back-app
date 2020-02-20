import 'package:flutter/material.dart';

import 'model/pokemon_liste.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Back',debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.green,
      ),
      home:PokemonList(),
    );
  
  }
}
