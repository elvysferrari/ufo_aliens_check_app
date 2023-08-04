import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ufo_aliens_check_app/models/race_model.dart';

class AlienRaceScreen extends StatelessWidget {
  final RaceModel race;

  const AlienRaceScreen({required this.race, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, backgroundColor: Colors.black87, title: Text(race.name, style: const TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold),),),
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(.5),
                            offset: const Offset(3, 2),
                            blurRadius: 2)
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Stack(
                              children: [
                                CachedNetworkImage(
                                  height: 280,
                                  imageUrl: race.image,
                                  width: double.infinity,
                                )
                              ]
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 20,),
                                const SizedBox(width: 4,),
                                Text(
                                  "Origem: ${race.constelation}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                const Icon(Icons.timer, color: Colors.brown, size: 20,),
                                const SizedBox(width: 4,),
                                Text(
                                  "1º Visita: ${race.firstVisit}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                Icon(
                                  race.pacific == "S" ? Icons.flag_sharp : Icons.flag_sharp,
                                  color: race.pacific == "S" ? Colors.green : Colors.red,
                                  size: 20,),
                                const SizedBox(width: 4,),
                                Text(
                                  "Pacífica: ${race.pacific.replaceAll("S", "Sim")
                                      .replaceAll("N", "Não")}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  race.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
