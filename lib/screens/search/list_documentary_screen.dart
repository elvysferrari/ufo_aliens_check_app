import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ufo_aliens_check_app/models/documentary_model.dart';
import 'package:ufo_aliens_check_app/screens/search/youtube_player_screen.dart';
import '../../constants/ad_mob_constants.dart';
import '../../constants/controllers.dart';


class ListDocumentaryScreen extends StatefulWidget {
  const ListDocumentaryScreen({super.key});

  @override
  State<ListDocumentaryScreen> createState() => _ListDocumentaryScreenState();
}

class _ListDocumentaryScreenState extends State<ListDocumentaryScreen> {

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 65,
                child: _bannerAd != null ? AdWidget(ad: _bannerAd!) : const SizedBox(),
              ),
              Expanded(
                child: StreamBuilder<List<DocumentaryModel>>( // inside the <> you enter the type of your stream
                  stream: contentController.listarDocumentaries(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  tileColor: Colors.white38,
                                  title: Text(
                                    snapshot.data![index].title,
                                    style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(snapshot.data![index].description,
                                      style: const TextStyle(color: Colors.white60, fontSize: 12)),

                                  trailing: const Icon(Icons.play_circle_outline_outlined, color: Colors.redAccent, size: 32,),
                                  onTap: (){
                                    Get.to(() => YoutubePlayerScreen(snapshot.data![index].url));
                                  },
                                );
                              },
                              separatorBuilder:  (BuildContext context, int index) => const Divider(color: Colors.tealAccent),
                              itemCount: snapshot.data!.length)
                      );
                    }else if (snapshot.hasError) {
                      return const Text('Error');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

    /*return Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24,),
                  const Text("ALIEN EXPLORER APP", style: TextStyle(
                    color: Colors.teal,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 24,),
                  Text(
                    AppLocalizations.of(context)!.intro,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60

                    ),
                  ),
                  const SizedBox(height: 24,),
                ],
              )
            ),
          ),
        ),
      );*/
  }
}
