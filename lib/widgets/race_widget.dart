import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufo_aliens_check_app/models/race_model.dart';

import '../screens/search/alien_race_screen.dart';

class RaceWidget extends StatelessWidget {
  final RaceModel race;
  const RaceWidget({Key? key, required this.race}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => AlienRaceScreen(race: race,));
      },
      child: Container(
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
                        height: 160,
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
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    race.name,
                    style: const TextStyle(
                        fontSize: 16,
                      color: Colors.tealAccent,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                ),
                const SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
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
                  padding: const EdgeInsets.only(left: 8.0),
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
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Icon(race.pacific == "S" ? Icons.flag_sharp : Icons.flag_sharp, color: race.pacific == "S" ? Colors.green : Colors.red, size: 20,),
                      const SizedBox(width: 4,),
                      Text(
                          "Pacífica: ${race.pacific.replaceAll("S", "Sim").replaceAll("N", "Não")}",
                        style: const TextStyle(
                            fontSize: 14,
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
    );
  }
}