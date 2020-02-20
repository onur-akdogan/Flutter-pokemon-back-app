import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemonback/model/pokemon_detay.dart';
import 'PokemonBack.dart';
import 'dart:async';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokemonBack pokemonback;
  Future<PokemonBack> veri;

  Future<PokemonBack> pokemonlarigetir() async {
    var response = await http.get(url);
    var decodedJson = json.decode(response.body);
    pokemonback = PokemonBack.fromJson(decodedJson);
    return pokemonback;
  }

  @override
  void initState() {
    super.initState();
    veri = pokemonlarigetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon Back"),
        centerTitle: true,
      ),
      body: OrientationBuilder(
        builder: (context,orientation){
          if(orientation==Orientation.portrait){
            return  FutureBuilder(
            future: veri,
            builder: (context, AsyncSnapshot<PokemonBack> gelenPokemonBack) {
              if (gelenPokemonBack.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (gelenPokemonBack.connectionState ==
                  ConnectionState.done) {
                return GridView.count(
                  crossAxisCount: 2,
                  children: gelenPokemonBack.data.pokemon.map((poke) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PokemonDetay(pokemon: poke)));
                      },
                      child: Hero(
                          tag: poke.img,
                          child: Card(
                            elevation: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: FadeInImage.assetNetwork(
                                      placeholder: "assets/onur.png",
                                      image: poke.img,fit: BoxFit.contain),
                                ),
                                Text(
                                  poke.name,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )),
                    );
                  }).toList(),
                );
              }}
              );
          }else{
            return FutureBuilder(
            future: veri,
            builder: (context, AsyncSnapshot<PokemonBack> gelenPokemonBack) {
              if (gelenPokemonBack.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (gelenPokemonBack.connectionState ==
                  ConnectionState.done) {
                return GridView.extent(
                  maxCrossAxisExtent:300,
                  children: gelenPokemonBack.data.pokemon.map((poke) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PokemonDetay(pokemon: poke)));
                      },
                      child: Hero(
                          tag: poke.img,
                          child: Card(
                            elevation: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: FadeInImage.assetNetwork(
                                      placeholder: "assets/onur.png",
                                      image: poke.img,fit: BoxFit.contain),
                                ),
                                Text(
                                  poke.name,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )),
                    );
                  }).toList(),
                );
              }
            });

          }
        },
               
      ),
    );
  }
}
