import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../constants/ad_mob_constants.dart';
import 'list_alien_race_screen.dart';
import 'list_documentary_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  BannerAd? _bannerAd;

  final String _adUnitId = AdMobConstants.adMobImageBanner;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  void _loadAd() async {
    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        onAdOpened: (Ad ad) {},
        onAdClosed: (Ad ad) {},
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24,),
                  Text(AppLocalizations.of(context)!.wiki, style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 24,),
                  SizedBox(
                    height: 65,
                    child: _bannerAd != null ? AdWidget(ad: _bannerAd!) : const SizedBox(),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/head_alien.png",
                        width: 70,
                        height: 70,
                        fit: BoxFit.fitHeight,
                      ),
                      title: Text(AppLocalizations.of(context)!.title_races, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                      subtitle: Text(AppLocalizations.of(context)!.description_races, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                      onTap: (){
                        Get.to(() => const ListAlienRaceScreen());
                      },
                      tileColor: Colors.teal,
                      textColor: Colors.white70,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/youtube.png",
                        width: 70,
                        height: 70,
                        fit: BoxFit.fitHeight,
                      ),
                      title: Text(AppLocalizations.of(context)!.documentary_title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                      subtitle: Text(AppLocalizations.of(context)!.documentary_description, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                      onTap: (){
                        Get.to(() => const ListDocumentaryScreen());
                      },
                      tileColor: Colors.teal,
                      textColor: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
