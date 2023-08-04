import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../constants/ad_mob_constants.dart';
import '../../constants/controllers.dart';
import '../../constants/pallet_colors.dart';
import '../../models/video_model.dart';

class OptionsVideoScreen extends StatefulWidget {
  final VideoModel video;
  OptionsVideoScreen({super.key, required this.video });

  @override
  State<OptionsVideoScreen> createState() => _OptionsVideoScreenState();
}

class _OptionsVideoScreenState extends State<OptionsVideoScreen> {
  String userName = "elvys.ferrari";

  String shortDescription = "Até agora, o mundo inteiro está familiarizado e cativado pela saga dos misteriosos balões chineses e outros objetos não identificados sendo derrubados na América do Norte.";
  String fullDescription = "Até agora, o mundo inteiro está familiarizado e cativado pela saga dos misteriosos balões chineses e outros objetos não identificados sendo derrubados na América do Norte. O público americano está sendo alimentado muito pouco pelo governo e a mídia está colocando possibilidades que vão desde veículos de vigilância estrangeiros, possíveis operações PSYOP por nossos adversários, testes de possíveis bombas EMP Attack, armas biológicas e operações de bandeira falsa até Aliens!";
  String totalLikes = "601k";
  String totalComments = "1254k";

  bool visibleFullDescription = false;
  bool visibleButtonLike = false;

  BannerAd? _bannerAd;
  final String _adUnitId = AdMobConstants.adMobVideoBanner;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getLiked();
    });
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

  void _getLiked() async {
    var liked = await appController.getUserPostLike(widget.video.id);
    if(liked) {
      setState(() {
        visibleButtonLike = false;
      });
    }else{
      setState(() {
        visibleButtonLike = true;
      });
    }
  }

  void _addLike(bool value) async {
    await appController.addVideoUserLike(widget.video.id, value);
    setState(() {
      visibleButtonLike = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Visibility(
                            visible: !visibleButtonLike,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("VOTES", style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 16),),
                                Row(
                                  children: [
                                    const Text("REAL: ", style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),),
                                    Text(widget.video.totalReal, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),),
                                    const SizedBox(width: 32,),
                                    const Text("FAKE: ", style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),),
                                    Text(widget.video.totalFake, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14),),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                      Visibility(
                        visible: visibleButtonLike,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.teal,
                              radius: 34,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.thumb_up_alt_outlined, color: Colors.white, size: 32
                                    ),
                                    //,
                                    onPressed: () {
                                      _addLike(true);
                                    },
                                  ),
                                  const Text("REAL", style: TextStyle(color: Pallete.accent, fontWeight: FontWeight.bold, fontSize: 12),),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20,),
                            CircleAvatar(
                              backgroundColor: Colors.redAccent,
                              radius: 34,
                              child: Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.thumb_down_alt_outlined, color: Colors.white, size: 32
                                    ),
                                    //,
                                    onPressed: () {
                                      _addLike(false);
                                    },
                                  ),
                                  const Text("FAKE", style: TextStyle(color: Pallete.accent, fontWeight: FontWeight.bold, fontSize: 12),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            visibleFullDescription = !visibleFullDescription;
                          });
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.95,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(visibleFullDescription ? "${widget.video.userName}: ${widget.video.fullDescription}" : "${widget.video.userName}: ${widget.video.shortDescription}", textAlign: TextAlign.start, style: const TextStyle(
                                      color: Colors.white60,
                                    )),
                                    SizedBox(
                                      height: 65,
                                      child: _bannerAd != null ? AdWidget(ad: _bannerAd!) : const SizedBox(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}