import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:ufo_aliens_check_app/constants/controllers.dart';
import 'package:ufo_aliens_check_app/models/race_model.dart';

import '../../widgets/race_widget.dart';

class ListAlienRaceScreen extends StatefulWidget {
  const ListAlienRaceScreen({super.key});

  @override
  State<ListAlienRaceScreen> createState() => _ListAlienRaceScreenState();
}

class _ListAlienRaceScreenState extends State<ListAlienRaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(centerTitle: true, backgroundColor: Colors.black87,title: Text(AppLocalizations.of(context)!.title_races, style: const TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),)),
      body: Column(
        children: [

          Expanded(
            child: Container(
              child: Obx(()=>GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: .60,
                  padding: const EdgeInsets.all(10),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 10,
                  children: contentController.races.map((RaceModel race) {
                    return RaceWidget(race: race,);
                  }).toList())),
            ),
          ),
        ],
      ),
    );
  }
}
