import 'package:flutter/material.dart';
import 'package:pokemonback/model/PokemonBack.dart';

class PokemonDetay extends StatelessWidget {
  Pokemon pokemon;
  PokemonDetay({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(pokemon.name),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height * (7 / 10),
            width: MediaQuery.of(context).size.height * (47 / 100),
            left: 20,
            //right: 10,
            
            top: MediaQuery.of(context).size.height * 0.2,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Boyu: " + pokemon.height,
                  ),
                  Text("Ağırlığı: " + pokemon.weight),
                  Text(
                    "Tipi",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((tip) => Chip(
                            backgroundColor: Colors.green.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),
                  Text("Evrimden Önce"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution != null
                        ? pokemon.prevEvolution
                            .map((evolution) => Chip(
                                backgroundColor: Colors.green.shade300,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("ilk hali")],
                  ),
                  Text("Evrimleştikten Sonra"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null
                        ? pokemon.nextEvolution
                            .map((evolution) => Chip(
                                backgroundColor: Colors.green.shade300,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("Son hali")],
                  ),
                  Text("Zayıf Noktası"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses != null
                        ? pokemon.weaknesses
                            .map((weaknesses) => Chip(
                                backgroundColor: Colors.green.shade300,
                                label: Text(
                                  weaknesses,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("Zayıf Noktası yok")],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 200,
                width: 200,
                child: Image.network(
                  pokemon.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
