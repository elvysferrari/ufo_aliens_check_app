import 'package:get/get.dart';
import 'package:ufo_aliens_check_app/models/notice_model.dart';
import 'package:ufo_aliens_check_app/models/race_model.dart';

import '../constants/firebase.dart';
import '../models/documentary_model.dart';
import '../models/image_model.dart';
import '../models/send_post_model.dart';
import '../models/video_model.dart';

class ContentController extends GetxController{
  static ContentController instance = Get.find();

  RxList<VideoModel> _videos = RxList<VideoModel>([]);
  List<VideoModel> get videos => _videos.value;

  RxList<ImageModel> _images = RxList<ImageModel>([]);
  List<ImageModel> get images => _images.value;

  RxList<RaceModel> _races = RxList<RaceModel>([]);
  List<RaceModel> get races => _races.value;

  RxList<NoticeModel> _notices = RxList<NoticeModel>([]);
  List<NoticeModel> get notices => _notices.value;

  RxList<DocumentaryModel> _documentaries = RxList<DocumentaryModel>([]);
  List<DocumentaryModel> get documentaries => _documentaries.value;

  @override
  onReady() {
    super.onReady();
    _videos.bindStream(listarVideos());
    _images.bindStream(listarImagens());
    _races.bindStream(listarRaces());
    _notices.bindStream(listarNoticias());
    _documentaries.bindStream(listarDocumentaries());
  }

  Stream<List<VideoModel>> listarVideos() =>
      firebaseFirestore.collection("videos").orderBy('date', descending: true).snapshots().map((query) =>
          query.docs.map((item) => VideoModel.fromMap(item.data(), item.id)).toList());

  Stream<List<ImageModel>> listarImagens() =>
      firebaseFirestore.collection("images").orderBy('date', descending: true).snapshots().map((query) =>
          query.docs.map((item) => ImageModel.fromMap(item.data(), item.id)).toList());

  Stream<List<RaceModel>> listarRaces() =>
      firebaseFirestore.collection("races").orderBy('name').snapshots().map((query) =>
          query.docs.map((item) => RaceModel.fromMap(item.data(), item.id)).toList());

  Stream<List<NoticeModel>> listarNoticias() =>
      firebaseFirestore.collection("notices").orderBy('date', descending: true).snapshots().map((query) =>
          query.docs.map((item) => NoticeModel.fromMap(item.data(), item.id)).toList());

  Stream<List<DocumentaryModel>> listarDocumentaries() =>
      firebaseFirestore.collection("documentaries").orderBy('date', descending: true).snapshots().map((query) =>
          query.docs.map((item) => DocumentaryModel.fromMap(item.data(), item.id)).toList());

  Future<void> addVideo(VideoModel video) async {
    firebaseFirestore.collection("videos").add(video.toJson());
  }

  Future<void> addImage(ImageModel image) async {
    firebaseFirestore.collection("images").add(image.toJson());
  }

  Future<ImageModel> getImage(String id) async {
    var snapshot = await firebaseFirestore.collection("images").doc(id).get();
    ImageModel img = ImageModel.fromSnapshot(snapshot, id);
    return img;
  }

  Future<void> updateImage(ImageModel image) async {
    await firebaseFirestore.collection('images').doc(image.id).set(image.toJson());
  }

  Future<VideoModel> getVideo(String id) async {
    var snapshot = await firebaseFirestore.collection("videos").doc(id).get();
    VideoModel video = VideoModel.fromSnapshot(snapshot, id);
    return video;
  }

  Future<void> updateVideo(VideoModel video) async {
    await firebaseFirestore.collection('videos').doc(video.id).set(video.toJson());
  }

  Future<void> sendPost(String name, String title, String description, String url) async {
    SendPostModel sendPost = SendPostModel(name, title, description, url, false);
    firebaseFirestore.collection("posts").add(sendPost.toJson());
  }

  Future<void> addVideoManual() async {
    var videos = listVideosManual();
    for (var v in videos) {
      firebaseFirestore.collection("videos").add(v.toJson());
    }


  }

  Future<void> addImageManual() async {
    /*ImageModel image = ImageModel(
        id: "",
        url: "",
        shortDescription: "",
        fullDescription: "",
        date: DateTime.now(),
        userName: "administrator",
        totalFake: "0",
        totalReal: "0"
    );*/
    var images = listImagesManual();
    for (var i in images) {
      firebaseFirestore.collection("images").add(i.toJson());
    }


  }

  List<VideoModel> listVideosManual(){
    List<VideoModel> list = [];

    VideoModel video = VideoModel(
        id: "",
        url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2Fnotprimak.mp4?alt=media&token=fd058a6e-58c7-4f9b-9d79-b8bbf978fbf2",
        shortDescription: "",
        fullDescription: "",
        date: DateTime.now(),
        userName: "notprimak",
        totalFake: "1",
        totalReal: "1",
    );
    list.add(video);

    video = VideoModel(
      id: "",
      url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2Fmuassantv.mp4?alt=media&token=60ff9622-f33c-4eed-ba1e-698b76716b56",
      shortDescription: "UFO 🛸",
      fullDescription: "UFO 🛸",
      date: DateTime.now(),
      userName: "muassantv",
      totalFake: "1",
      totalReal: "1",
    );
    list.add(video);

    video = VideoModel(
      id: "",
      url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2Fufologia11.mp4?alt=media&token=de109619-d29d-4285-96e2-92369e6001f9",
      shortDescription: "UFO 🛸",
      fullDescription: "UFO 🛸",
      date: DateTime.now(),
      userName: "ufologia11",
      totalFake: "1",
      totalReal: "1",
    );
    list.add(video);
    return list;
  }

  List<ImageModel> listImagesManual(){
    List<ImageModel> list = [];

    ImageModel img = ImageModel(
        id: "",
        url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2FCapturar1.JPG?alt=media&token=2046919a-6184-4dfe-acf1-ab4da1183a22",
        shortDescription: "OVNI",
        fullDescription: "OVNI",
        date: DateTime.now(),
        userName: "anonymous",
        totalFake: "1",
        totalReal: "1"
    );
    list.add(img);

    img = ImageModel(
        id: "",
        url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2FCapturar10.JPG?alt=media&token=f6d993eb-c6f3-4cf2-9348-d1a415cae2be",
        shortDescription: "OVNI",
        fullDescription: "OVNI",
        date: DateTime.now(),
        userName: "anonymous",
        totalFake: "1",
        totalReal: "1"
    );
    list.add(img);

    img = ImageModel(
        id: "",
        url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2FCapturar2.JPG?alt=media&token=09e1f910-4a7c-4152-9b71-0996f8e516e0",
        shortDescription: "OVNI",
        fullDescription: "OVNI",
        date: DateTime.now(),
        userName: "anonymous",
        totalFake: "1",
        totalReal: "1"
    );
    list.add(img);

    img = ImageModel(
        id: "",
        url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2FCapturar3.JPG?alt=media&token=f607127c-aea7-4d49-a16c-a9ffd7e1881e",
        shortDescription: "OVNI",
        fullDescription: "OVNI",
        date: DateTime.now(),
        userName: "anonymous",
        totalFake: "1",
        totalReal: "1"
    );
    list.add(img);

    img = ImageModel(
        id: "",
        url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2FCapturar4.JPG?alt=media&token=9402f8a0-91e9-4148-93a9-4472786225c8",
        shortDescription: "OVNI",
        fullDescription: "OVNI",
        date: DateTime.now(),
        userName: "anonymous",
        totalFake: "1",
        totalReal: "1"
    );
    list.add(img);

    img = ImageModel(
        id: "",
        url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2FCapturar5.JPG?alt=media&token=5534f18d-05f1-4fb5-86a5-af2aa47cfcd4",
        shortDescription: "OVNI",
        fullDescription: "OVNI",
        date: DateTime.now(),
        userName: "anonymous",
        totalFake: "1",
        totalReal: "1"
    );
    list.add(img);

    img = ImageModel(
        id: "",
        url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2FCapturar6.JPG?alt=media&token=f4ec12a3-b008-4b14-b749-743649ad360f",
        shortDescription: "OVNI",
        fullDescription: "OVNI",
        date: DateTime.now(),
        userName: "anonymous",
        totalFake: "1",
        totalReal: "1"
    );
    list.add(img);

    img = ImageModel(
        id: "",
        url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2FCapturar7.JPG?alt=media&token=6c713ec6-fc84-493e-8e98-0394b0e14dde",
        shortDescription: "OVNI",
        fullDescription: "OVNI",
        date: DateTime.now(),
        userName: "anonymous",
        totalFake: "1",
        totalReal: "1"
    );
    list.add(img);

    img = ImageModel(
        id: "",
        url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2FCapturar8.JPG?alt=media&token=9d3c40d5-14f2-4de8-b0cb-797ce88d1e64",
        shortDescription: "OVNI",
        fullDescription: "OVNI",
        date: DateTime.now(),
        userName: "anonymous",
        totalFake: "1",
        totalReal: "1"
    );
    list.add(img);

    img = ImageModel(
        id: "",
        url: "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/ufos%2FCapturar9.JPG?alt=media&token=c711824a-9756-440a-ac8e-4b9a68ed2c9b",
        shortDescription: "OVNI",
        fullDescription: "OVNI",
        date: DateTime.now(),
        userName: "anonymous",
        totalFake: "1",
        totalReal: "1"
    );
    list.add(img);
    return list;
  }

  Future<void> addNoticeManual() async {
    var notices = listINoticeManual();
    for (var n in notices) {
      firebaseFirestore.collection("notices").add(n.toJson());
    }
  }

  List<NoticeModel> listINoticeManual(){
    List<NoticeModel> list = [];

    NoticeModel n = NoticeModel(
        "",
        "Lutador de UFC revela vídeo impressionante de OVNI gravado em Florianópolis em 1996",
      "Pai, filho e vizinho testemunharam um dos avistamentos mais impressionantes de OVNI no Campeche, em Florianópolis",
      "https://ndmais.com.br/internet/ufc-video-campeche-ovni-1996",
      DateTime.now()

    );
    list.add(n);



    return list;
  }

  Future<void> addRaceManual() async {
    var races = listIRaceManual();
    for (var r in races) {
      firebaseFirestore.collection("races").add(r.toJson());
    }
  }

  List<RaceModel> listIRaceManual(){
    List<RaceModel> list = [];

    RaceModel n = RaceModel(
      "",
      "PLEIADIANOS",
      "Plêiades",
      "10.000 A.C",
      "Esta raça é originária de sistemas solares junto às Plêiades. Mais precisamente do planeta Erra, perto da estrela Taygeta. São frequentemente associados a crescimento espiritual. Podem crescer até 2,5 m ( 8´). Praticam o 'Cultivo do Sexo', a diferença nítida entre as expressões sexuais e as emoções sensuais. As suas naves são conhecidas como 'beamship'. Embora ainda visitem a Terra têm-se mantido bastante silenciosos desde 10.000 AC. São uma das raças mais antigas conhecidas. Continuam a desenvolver as suas capacidades mentais necessárias para eventualmente atingirem o seu objectivo: um estado espiritual ainda superior.",
      "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Fpleiadianos.png?alt=media&token=53dbaa9b-563d-4787-8d96-6754e66628f8",
      "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "KYLLIMIR-AUK",
        "Volans",
        "N/A",
        "Vêm da constelação Volans (Peixe Voador). Os avistamentos desta raça são raros na Terra. Eles são uma 'raça mistério'. Diz-se que foram proibidos de visitar a Terra cerca de 100 AC. mas não pararam completamente de vir ao nosso planeta, devido aos seus aliados: a raça Maitre. Última vez que foram avistados na Terra - Dezembro de 1989.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FKyllimir-Auk.png?alt=media&token=8c1a688d-9e55-455b-ba76-a37fcaffcb4c",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "KURS",
        "Dillimuns",
        "N/A",
        "Acredita-se que está ligada à raça Anunnaki. Vêm do planeta Dillimuns. Estão por de trás da história de Enlil e Ninlil. Estão diretamente envolvidos no desenvolvimento da raça humana no início da nossa civilização. Depois de centenas de anos afastados da Terra, recentemente regressaram. O seu próprio chefe está entre os recentes visitantes. Vão agora ficar na Terra permanentemente... terão um papel importante nos anos futuros. Passam tempos imersos num liquido dourado precioso que acreditam que aumente a duração da sua vida.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Fkurs.png?alt=media&token=3df0c14b-151c-4850-92e2-2235eb3084ab",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "HAV-HANNUAE-KONDRS",
        "Sextans",
        "934 D.C",
        "Vêm da galáxia anã de Sextans. Visitaram a Terra pela primeira vez em 934 AC na região que atualmente é a Romênia. Frequentemente abduzem e matam humanos... e retiram e bebem o sangue dos humanos assim como dos animais. São os 'responsáveis' pelo mito dos vampiros. Vários governos conhecem e aceitam a sua ação. Os corpos humanos que abduzem nunca são devolvidos. A última vez que foram vistos na Terra - Escócia, 1996.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FHav-Hannuae-Kondrs.png?alt=media&token=ffa02c62-c077-4b71-b4c0-8546a05d1cec",
        "N"
    );
    list.add(n);

    n = RaceModel(
        "",
        "MAZAREK",
        "Girafa",
        "Séc. XIV",
        "Vêm da constelação Camelopardalis (Girafa). Desde o Século XIV ao princípio do Século XX (calendário humano) não lhes foi permitido sair do seu planeta, por outras raças extraterrestres. São uma raça muito violenta e predadora. Foram aliados da raça Maitre. Podem atingir 1,6 m (5'). A última vez que foram vistos na Terra foi em Agosto de 2001.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Fmazarek.png?alt=media&token=2566b2db-36d7-410a-959c-048ef8f20e55",
        "N"
    );
    list.add(n);

    n = RaceModel(
        "",
        "AL-GRUALIX",
        "Baleia",
        "N/A",
        "Vêm da constelação Cetus (Baleia) perto de Deneb Kaitos Shemali. Embora sejam muitas vezes confundidos com reptilianos não têm nada de comum, exceto a aparência. Têm uma altura de cerca de 2 metros (6') e podem viver até 350 anos. Esta é uma das 21 raças que constam como tendo mais de 2 sexos (gêneros). Esta raça tem 8 sexos distintos e todos podem reproduzir com contato sexual com qualquer das outras. O objetivo da sua visita à Terra é desconhecido. A última vez que foram detectados foi perto de Lima no Peru, em Dezembro de 2004.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FAl-Grualix.png?alt=media&token=7fe8cd97-a69d-4a28-9c12-614350f4c543",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "OS MENSAGEIROS",
        "N/A",
        "N/A",
        "Provavelmente a mais enigmática das raças. Não se sabe muito sobre eles. Visitam a Terra com intervalos aproximados de 300 anos. A sua próxima visita pode agora acontecer em qualquer momento. Não se revelam, Não fazem contato direto com os humanos. Deixam gravuras nas rochas (desenhos e escrita) e símbolos nos monumentos históricos (por exemplo). As suas naves têm o formato de 'lágrima' e são prateados.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Fosmensageiros.png?alt=media&token=9f6757e5-b4f0-44e6-a4de-4c2a6c9665d2",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "RAMAY",
        "Cocheiro",
        "Maias",
        "Vêm de Capella, Constelação Auriga (Cocheiro). Uma raça muito pacífica. Eles tentaram coexistir  connosco. 'Criaram' a civilização Maia pegando em seres humanos de vários lugares do mundo e colocando-os na América do Sul. São uma raça de 'cientistas' ...ensinaram os Maias sobre astronomia e 'tempo'. Deixaram os Maias quando esta cultura estava no seu maior esplendor. Foi depois de deixarem os Maias que começaram os sacrifícios sangrentos em seu nome. Esta raça visitou-nos muitas vezes depois disso... Último avistamento: Bora-Bora em 2001. Sexo masculino vivem 130 anos. Sexo feminino vivem 26 anos.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Framay.png?alt=media&token=865ec7c2-8138-40a2-b08d-8d4984d6dd19",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "MOONVIANTHAN-KAYPHIK",
        "Raposa",
        "N/A",
        "Vêm da constelação Vulpecula (Raposa). Tiveram encontros com, pelo menos, 2 presidentes americanos e com muitos líderes de topo da União Soviética e Russos. Trocam alguma tecnologia com a contrapartida de poderem fazer abduções 'à vontade'. Não envolvem outras raças extraterrestres neste processo. Tiveram um grande papel na cultura Siberiana e Tibetana. Ainda têm bases nessas áreas, que estão escondidas na face norte das montanhas. Colonizaram mais de 40 planetas... por enquanto todos fora do nosso sistema solar!",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FMoonvianthan-Kayphik.png?alt=media&token=c16d8965-d228-4b40-81f9-47d56871786a",
        "N"
    );
    list.add(n);

    n = RaceModel(
        "",
        "RAK",
        "N/A",
        "N/A",
        "Visitaram a Terra menos vezes que as demais, apenas 5 vezes, sendo a ultima no ano 71 DC, gerando a crença nos gênios no Islamismo e no oriente médio ,mas deixaram de visitar este planeta por ser incompatível como sistema imunológico deles.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Frak.png?alt=media&token=795df088-a66f-4a00-a1b1-f7fb512cffd1",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "OS INVÍSIVEIS",
        "Meseta",
        "N/A",
        "Esta raça ficou conhecida por ser 'vista' em locais de alta segurança. São quase completamente invisíveis a olho nú. Tanto o exército russo como o americano, desenvolveram tecnologia que permite detectá-los no radar (as naves) , mas não os seres. Sabe-se três coisas : 1 . Deixam um cheiro ácido onde estiveram 2.Quando estão em janelas vê-se uma figura indistinta ( como um fantasma) , foram detectados em câmaras de segurança 3. Quando os cães começam a ladrar sem razão aparente é provável que se encontrem perto (eles ou os reptilianos). Vêm da constelação MENSA (Meseta). O seu objetivo é desconhecido.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Finvisiveis.png?alt=media&token=e402d223-0c3e-4c72-b814-2ca3f32a7164",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "ALLAMAHULUK-STRAT-163",
        "Júpiter",
        "N/A",
        "Depois de perderem uma batalha contra os reptóides na índia antiga ( em data não identificada) foram forçados a abandonar o planeta que vinham visitando há uns 200 anos. Recomeçaram as visitas desde 1948. Tecnologicamente é uma raça muito avançada. As suas naves são frequentemente invisíveis ( ao radar e à vista humana ) e vestem um tipo de fato que também os torna invisíveis. Pensa-se que vêm de Júpiter ou de uma das suas luas. Último avistamento: Portugal, Maio 2005.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2F163.png?alt=media&token=957f3b34-bac9-40fc-9c46-d3a08238a31e",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "AL NANNA",
        "Gêmeos",
        "1235 A.C",
        "Os membros desta raça são a razão porque os humanos criaram o termo de Marcianos. Vêm da constelação Gemini (Gêmeos). Têm bases permanentes em Marte há milhares de anos onde recolhem um mineral parecido com o ouro. A primeira visita à Terra registada foi em 1235 A.C no Japão. Último avistamento: Madagáscar, 2003.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Fallnanna.png?alt=media&token=ee484d4d-65fd-46b9-89d1-7dc88721ea83",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "INDUGUTK",
        "N/A",
        "N/A",
        "Esta raça tem várias bases na superficie e na Lua, onde extraem minério. (matéria desconhecida). Usam escravos para fazer a maior parte do trabalho... tratam muito bem estes 'escravos', e os Indugutk consideram-nos indíspensáveis. As suas operações na superficie e na Lua são muito secretas. Estão quase em permanente contacto com altas patentes dos governos Russo, Chinês e Americano! Têm a capacidade de mudarem de forma ('Shapeshift') quase perfeitamente ficando como seres humanos. Também são conhecidos como 'Men in Black' pois usam fatos escuros especiais (para proteger a sua pele) quando tomam a forma humana para executarem operações especiais na Terra.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Findugutk.png?alt=media&token=2661b441-c684-43cd-823e-27a3a2731ae6",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "2017",
        "UDFJ-39546284",
        "1935 D.C",
        "Só contactaram os humanos uma única vez: na URSS em 1935. De acordo com os relatos, eles falam uma espécie de dialeto eslavo. Deixaram uma mensagem de 10 frases. Oriundos da galáxia UDFJ-39546284, a uma distância estimada de 13,2 bilhões de anos-luz. Viajam usando aquilo que outras raças extraterrestres designam de 'buraco de minhoca' o que lhes permite curvar o espaço/tempo. Conforme os relatos, estes seres são altos, loiros, de cabelos compridos e 'cheiravam a flores'.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2F2017.png?alt=media&token=d43eaaec-7d97-4078-a14f-7cea5e52d291",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "EL-MANOUK",
        "Grus",
        "1935 D.C",
        "Vem da constelação de Grus, próxima de Alnair. É uma das raças mais pacíficas. É uma das raças criadoras da 'Aliança das 5 Raças' (Conselho dos 5), mas não faz parte dela. Conselho dos 5 é um grupo de 5 raças extraterrestres que protegem os humanos contra raças menos pacíficas. Criaram a frase '5 Universos, 2500 espécies, 1 raça'. O conselho deverá encontrar-se na Terra durando os 10 últimos dias de Agosto de 2013, e a razão se dá por conta de a Terra ter recebido muitas visitas de novas raças alienígenas nos últimos 500 anos. Último avistamento na Terra: setembro de 2002, perto do Mar de Cortez.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FEl-Manouk.png?alt=media&token=8bfed3d7-9a3b-4e3f-aba4-ec4ca426e5bf",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "JI GHANTIK",
        "Horologium",
        "N/A",
        "Mantém contatos esporádicos com 3 governos da Terra, mas não com os mais poderosos (URSS, Rússia ou China). As outras raças consideram-nos como seres de natureza violenta. Tem nos visitado há 3000 anos. Vem da constelação de Horologium e são aliados da raça Maitre. Último avistamento: 1 de fevereiro de 2003, perto de Houston, Rússia.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FJi%20Ghantik.png?alt=media&token=111dd35e-f2ce-4a8c-8874-1fe252928334",
        "N"
    );
    list.add(n);

    n = RaceModel(
        "",
        "JEFOK",
        "Indus",
        "1500 A.C",
        "Vem da constelação Indus. São conhecidos pelas outras raças como 'pacificadores'. São extremamente avançados tecnologicamente. O primeiro avistamento na Terra data de 1500 A.C. Encontraram-se com JFK 3 semanas antes de ser assassinado. Também se encontraram com outros líderes humanos, por volta da mesma data. Não são vistos na Terra desde a morte de JFK. Em 1965 mandaram uma mensagem aos líderes humanos, de países com grande poderio nuclear (conteúdo desconhecido)",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FJefok.png?alt=media&token=83099f15-f5df-43bd-9455-0a07eba5fa2d",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "DORSAY",
        "Cassiopéia",
        "1500 A.C",
        "Atingem altura máxima de 0,5 metros. Visitaram a Terra pelo menos 250 vezes. Vem da constelação de Cassiopéia, onde possuem 2 planetas de origem. Comem outros tipos de extraterrestres e também seres humanos. Sua raça tem, pelo menos, 4 bilhões de anos, e tem estado em guerra com uma outra espécie alienígena há 2 bilhões de anos. O último avistamento na Terra data de novembro de 2001, nos Alpes italianos.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FDorsay.png?alt=media&token=0acba697-0c6e-4a4b-8489-3d65e5d38bbe",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "MAGELL",
        "N/A",
        "N/A",
        "Sabe-se que é uma raça muito pacífica. Têm duas bases permanentes na América do Sul. São 100% noturnos. Não interagem com os humanos, e são descritos pelas outras raças extraterrestres como 'tímidos'. Apanham roedores e insetos aos milhares por mês... Razão: desconhecida. Pelo menos 3 deles estiveram sob custódia militar brasileira nos últimos 12 anos. Último avistamento: perto de Oaxaca, México em 2003. São visitados pela sua própria espécie de 20 em 20 anos... a próxima visita será cerca de 2016.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FMAGELL.png?alt=media&token=d32208fa-f141-420c-aa12-f7bb352feb61",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "AKART",
        "Sextante",
        "N/A",
        "Vem da constelação Sextans (Sextante). Uma das suas naves despenhou-se perto de Varginha (Brasil) em 1996. Dois dos seus ocupantes estão sob custódia dos EUA, depois de terem pago bilhôes de dólares ao governo brasileiro. Têm as naves mais rápidas de todas as raças extraterrestres conhecidas. Último avistamento: Fevereiro 2002, perto de Varginha (Brasil) outra vez!.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FAkart.png?alt=media&token=55638736-bfd6-43d8-8ace-5f4f8392b8ac",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "MAITRE",
        "Magopei",
        "Pré-histórica",
        "Têm 2 planetas de origem na constelação Megopei. Têm a mesma altura que os humanos, e são considerados por muitas raças extraterrestres como 'parasitas'. Visitaram a Terra pela primeira vez na época pré-histórica (data desconhecida). O rapto dos humanos é feito abertamente. Têm o objetivo de colonizar a Terra, o que não aconteceu devido à proteção das outras raças extraterrestres, como o 'Conselho dos 5'. São hermafroditas e a vida deles pode durar 120 anos. Colonizaram pelo menos 26 planetas. Raptaram cerca de 5000 Humanos (Homens). Visitaram a terra pelo menos 200 vezes. Último avistamento: Setembro de 2006, perto de Nome, Alaska, URSS.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Fmaitre.png?alt=media&token=2c2e8ea1-b0ca-40c0-bc7a-51c8d4f7d5f2",
        "N"
    );
    list.add(n);

    n = RaceModel(
        "",
        "DRIES",
        "Cetus",
        "N/A",
        "Crescem até cerca de 2,5 metros. A estrutura do seu crânio é muito complexa. Visitaram  planeta Terra pelo menos 20 vezes. Fazem abduções de Humanos que usam para reprodução Humana. Roubaram cerca de 520 pessoas (homens e mulheres). Vêm da terceira estrela da constelação Cetus. Têm 2 planetas de origem, colonizaram 40 planetas com a ajuda de 'escravos'. Dez desses planetas foram conquistados à força. Trabalham com mais 3 raças. Comem sobretudo produtos derivados de proteína animal. De acordo com os relatos extraterrestres não estão ainda 'mentalmente/espiritualmente' preparados para interagir com a maior parte das outras raças. A composição química dos 2 planetas de origem é semelhante à da Terra. Espera-se que se 'revelem' abertamente à raça humana em 2024.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FDries.png?alt=media&token=adb3bc0c-91f2-4036-95fd-d524cefd3ef3",
        "N"
    );
    list.add(n);

    n = RaceModel(
        "",
        "LANG",
        "Cabeleira de Berenice",
        "N/A",
        "É uma espécie pequena que cresce só até 70 cm. Vêm da terceira estrela da constelação Coma Berenices (Cabeleira de Berenice). Têm 3 planetas de origem (talvez 4) e colonizaram pelo menos 10. Foi uma das primeiras raças a visitar a Terra. Foram a raça que deu origem às 'histórias' sobre Fadas. Duas raças extraterrestres afirmam que abduziram 10 milhôes de Humanos ao longo da história (este número é muito constestado por outra raça... dizem que o número é muito inferior... e uma raça até fez uma declaração a um Presidente russo dizendo que a raça Lang nunca abduziu um Humano). Último avistamento: Nova Zelândia em janeiro de 2006... o grupo era formado por 20 indivíduos.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Flang.png?alt=media&token=25fd2000-143e-4354-af55-d0a1768548df",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "SMAD",
        "Batteray",
        "2500 A. Atrás.",
        "Vêm do planeta Svokk, constelação Batteray. As naves têm forma cónica. A sua aparência é semelhante aos humanos. De acordo com uma raça extraterrestre só lhes restam 6 naves. Colonizaram 20 planetas, 18 dos quais eram habitados. A sua primeira visita à Terra foi há 2500 anos e estão extremamente interessados com as nossas crenças religiosas. É uma raça em declínio ('enfraquecendo' segundo outras raças).",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Fsmad.png?alt=media&token=da0e93fb-9df2-4232-992b-4ddc8e16a215",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "TENGRI TENGRI",
        "F1340",
        "10.000 A. Atrás",
        "Vêm do planeta Tengri (setor galático 56, sistema estelar F1342). Fazem vida subterrânea e têm uma população de 10 milhôes. Primeira visita à Terra: hà cerca de 10.000 anos atrás. Não precisam de atmosfera ou água para sobreviverem. Têm uma nave onde cabem 5 milhôes deles. Ao longo da história têm tido vários contatos com governos da Terra. Último avistamento perto de Buenos Aires, Argentina, em 2013.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FTengri-Tengri.png?alt=media&token=9b2b7658-cd8a-403a-8e1a-4dd776241c9d",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "GRAYSLI",
        "Virgem",
        "3.000 A. Atrás",
        "A altura é semelhante à do homem. O corpo está coberto de pêlo sedoso curto. Têm 2 planetas de origem na constelação Virgo (Virgem). Visitaram a terra 12 vezes pelo menos. A primeira visita foi na era (dinastias) dos Faraós do Egito há cerca de 3000 anos. Permaneceram 10 anos seguidos lá nessa época. A pirâmide Djoser foi construída em sua honra!. Têm observado de perto o nosso desenvolvimento nos últimos 200 anos, sabendo que alguns humanos poderosos podem ser (e são) desencainhados por algumas raças extraterrestres (disfarçadas de Humanos). Em cada nave viajam apenas 6. Os últimos avistamentos foram em Julho de 2002 e em Fevereiro de 2004.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FGraysli.png?alt=media&token=1ca96ac1-7aec-47d1-b608-bcef0e924e75",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "ANUNNAKI",
        "Nibiru",
        "N/A",
        "Vêm do planeta Nibirue (ou Nibiru). O seu planeta é parte do sistema solar da Terra, mas com uma órbita muito maior... aproxima-se do Sol de 4000 em 4000 anos e não a cada 3500 (mais ou menos) como é suposto. São semelhantes aos homens mas de maior estatura (2,5 metros), e mais musculados. De acordo com o livro, quando chegaram à Terra, já cá estavam outras raças estabelecidas... algumas malevolentes e com poderes sobrenaturais. Os Anunakene derrotaram-nos e tornaram-se a raça mais poderosa na Terra. Fizeram engenharia genética na espécie mais inteligente da Terra (nós... na altura pouco mais que primatas espertos) para ter uma raça de escravos à sua disposição. Nessa época Samael e Lilith eram o Rei e Rainha Anunnaki. Não se aperceberam da presença dos reptilianos na Terra. Só cooperaram com outra raça extraterrestre os Zeta Reticulai. Não devem ser confundidos com a raça Solipsi Rai(ou 'Grays'). Eventualmente foram-se embora da Terra (razões desconhecidas) mas antes de se irem embora, criaram uma subespécie de Zeta... esta espécie eventualmente tornou-se os governantes do Egito (Faraós) até os Reptilianos se terem infiltrado (como Sacerdotes) e acabado o seu reinado. Deram origem às lendas sobre 'gigantes'. Eles vão regressar um dia, como prometeram, contudo a data do regresso é ainda um mistério. Sabem tudo o que se passa na Terra tal como nos outros planetas onde tiveram influência (e/ou ainda têm). A proximidade do planeta Nibirue (ou Nibiru) causa instabilidade cósmica e repercussões climáticas em todos os planetas do nosso sistema solar, mas não causa a quantidade de destruição que geralmente se supões ou se acredita. Quão longe estão é ainda um mistério.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FAnunnaki.png?alt=media&token=458d0c1e-fcab-49ab-86d0-3a9e4276a11d",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "AFIM",
        "Lyra",
        "N/A",
        "Vêm da constelação de Lyra. Chamam-se a si próprios 'AFIM SPIANSTSY' por causa da guerra que lutaram contra uma raça chamada 'Spiantsy'... a raça 'Spiantsy' tinha 12 vezes mais membros e 35 vezes mais naves e recursos que os 'AFIM'... mas os 'AFIM' foi quem ganhou no final. Portanto juntaram o nome 'Spiantsy' ao nome da sua raça, como aviso para outras raças. São de estatura menor que a dos humanos, pele azul e às manchas, mais escuros no gênero masculino e mais claro no feminino. O seu planeta chama-se Crimea Ai Petri. Tecnologicamente são muito desenvolvidos. Conseguem vir do seu planeta para a Terra em 20 minutos. Não precisam de oxigênio. Eles têm uma atmosfera mais constituída predominantemente por uma mistura de hidrogênio e afins. Colonizaram 10 planetas de modo não violento. Quando estão perto dos humanos podem tornar-se invisíveis mas os humanos vão sentir uma certa dose de ansiedade inexplicável. As naves são pequenas e esféricas. Uma das razões porque nos visitam é para estudar o que chamam de 'desvio humano', para determinar o desenvolvimento futuro da raça humana.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FAfim-Spianstsy.png?alt=media&token=a49fb53e-28e9-4480-8709-890e885e3d14",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "SOLIPSI RAI",
        "Cisne",
        "N/A",
        "Raça harmoniosa em todos os aspectos. Têm um líder principal. O seu nome é... Ymartyyn. A sua civilização tem 2 bilhões de anos... já estiveram no mesmo nívem de desenvolvimento que nós. Não têm colônias... estão completamente concentrados no desenvolvimento dos outros planetas e raças. Vêm da constelação Cygnus (Cisne). Têm uma arma poderosa que mantém afastadas as raças vizinhas violentas e outros que tentassem invádi-los... uma vez a raça Maitre perdeu 5 naves devivo a isso. Dizem que raça Humana nos próximos milhares de anos ainda em 645 opções para nos salvarmos a nós, ao nosso planeta e garantir o futuro da nossa raça... mas dependerá da nossa capacidade de viajar no espaço. Eles são a raça Solipsi Rai, mas nós chamamos-lhes... 'Os Grays'!.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FSolipsi-Rai.png?alt=media&token=f167d630-e618-442a-928f-6d8ccfeeca4f",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "PUXHITY",
        "N/A",
        "N/A",
        "Esta raça foi muito influente no desenvolvimento de várias civilizações na América do Sul e Central. Numa certa época houve mais 2000 membros vivendo entre os humanos nessa região... até um dia em que a maior parte deles se foi embora deixando apenas 25 por sua conta... e os Humanos os mataram. Não mais voltaram à Terra depois desse 'incidente'. Sabe-se que eram muito altos... há relatos de uma raça extraterrestre dizem que alguns deles chegavam aos 4 metros. As razões pelas quais os Humanos da região mataram os 25 são desconhecidas.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FPuxhity.png?alt=media&token=8817ee8c-767f-494b-ad15-d7cc086f7cc4",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "X5-TYKUT",
        "N/A",
        "N/A",
        "Esta raã foi criada pela raça Maitre para servirem de escravos deles... e é para isso que eles ainda servem. São frequentemente enviados pelos Maitre para regiçoes sensíveis em segurança trabalhando como mensageiros e também para organizarem abduções. Podem vivier para sempre porque não são orgânicos... contudo as matérias-primas que os Maitre precisam para 'construir' um deles, são muito raras. Portanto não há muitos deles (estimativa: menos de 300). Têm a capacidade de conduzir naves e de usarem 'pensamento racional' (quando programados), assim como pilotar naves e outras tarefas. Vistos pela última vez na Terra em julho de 1997 perto de Brisbane (Austrália).",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FX5-Tykut.png?alt=media&token=1288fadd-89ad-44c6-9923-6d8feaa57d0d",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "TANZANY",
        "Perseu",
        "N/A",
        "Esta raça vem da constelação Perseus (Perseu), perto da estrela Gorgonea Secunda. Causaram milhares (talvez milhões) de mortes na Terra (e outros planetas), pois um dos seus interesses (ou área de 'estudo') é ver como outras raças reagem a tragédias e cataclismos. São muito avançados tecnologicamente. Uma raça extraterrestre declarou que eles (os Tanzany) causaram tanto o acidente de Hindenburg como o afundamento do Titanic. São muitas vezes vistos perto de 'tragédias'. Podem viver até 500 anos e têm uma altura cerca de 1,7 metros. As outras raças extraterrestres tentam não fazer contato com eles. Último avistamento: Janeiro de 1999 no estado de Nova Iorque.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FTanzany.png?alt=media&token=6135e5f8-83a2-4174-b767-973333b81919",
        "N"
    );
    list.add(n);

    n = RaceModel(
        "",
        "AIRK",
        "Ofiúco",
        "N/A",
        "Vêm da constelação Ophiucus (Ofiúco) perto da estrela Yed Prior. São considerados pelas outras raças como uma raça pacífica. O seu objetivo é desconhecido... Nunca ficam muito tempo na Terra e não interagem com Humanos ou outros extraterrestres quando estão aqui. Usam a Terra como local onde 'param' (para colher algo que podem precisar) antes de irem para o seu destino. São sobretudo noturnos. As suas naves emitem uma luz brilhante alaranjada e são (na maior parte, mas não todas) de forma octagonal. O último avistamento foi perto de Londres (Inglaterra) em Maio de 2003.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FAirk.png?alt=media&token=661216f1-582c-4fb5-9da4-254653da8430",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "VINNITUARY",
        "Pavão",
        "1000 D.C",
        "Vêm da constelação Pavo (Pavão). São uma raça muito respeitada e pacífica e presume-se que tem poderes místicos. Têm vindo à Terra pelo menos desde 1000 D.C. Não abduzem humanos. Não interagem com os humanos. Podem viver até 2000 anos. A sua estatura é igual à dos Humanos. São vegetarianos. Último avistamento: perto de Odessa (Ucrânia) em Julho de 1995.",
        "",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "KALENIA",
        "Águia",
        "300 A.C",
        "Vêm da constelação Aquila (Águia), estrela Tazared. Colonizaram 3 planetas e a duração de vida é de 150 anos. As suas naves são vistas frequentemente no Norte da África e na região do Sahara. A primeira visita na Terra foi cerca de 300 A.C. Não fazem abduções. Principal interesse na Terra: minerais. Último avistamento foi em 2003 perto de um vulcão, na Islândia.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FVinni-Tuary.png?alt=media&token=f6a455e7-5588-4edc-8508-5dc5ae6e484b",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "STROM",
        "Ursa Menor",
        "Idade do Gelo",
        "Vêm da constelação Ursa Minor (Ursa Menor). Os Storm são invertebrados celenterados. Estatura média de 2 metros. A vegetação é muito importante para sua cultura, é o principal objetivo das suas visitas. Fizeram pelo menos 200 visitas à Terra. Esta raça age com muita cautela e raramente é vista pelos Humanos. A primeira visita à terra foi no fim da última idade do gelo. Têm 20 colônias espalhadas pela Via Láctea. As suas naves têm forma de um octógono. Último avistamento: Outubro 1976 no Oregon, EUA.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FStrom.png?alt=media&token=07d202be-fd9b-4f74-bb6d-4fcdb6e31827",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "MYTHLAE",
        "Serpente",
        "1963 D.C",
        "São parentes distantes da espécie reptiloide, mas não são reptilianos. Vêm da constelação Serpens (Serpente), estrela Alya. Visitaram a Terra pela primeira vez em 13 de Junho de 1963. Não são considerados uma ameaça para espécie humana. Vistos frequentemente perto da Antártida. A razão das suas visitas é desconhecida. Último avistamento: Antártida, 1 Maio 1997.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FMythilae.png?alt=media&token=166f782d-4dfc-41ad-bb21-325c81ef6f4b",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "ALCOHBATA",
        "Perseu",
        "N/A",
        "Pensa-se que têm mais de 5000 naves e colonizaram à sua conta mais de 100 planetas. Considerada pelas outras raças extraterrestres como uma das raças parasitas. Estão a decorrer abduções frequentes. Objetivo das abduções: desconhecido. Não gostam de interagir com outras raças extraterrestres. Vêm da constelação Perseus (Perseu) e são muito agressivos. Suspeita-se que estejam envolvidos em várias quedas de aviões, como o voô do KA 007, sobre URSS em 1983. O governo soviético aceitou as culpas desse acidente. Última vez que foram vistos na Terra: Setembro de 2001, no Canadá.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FAlcohbata.png?alt=media&token=7c4b45bb-4e8b-4784-9b4d-7a3fb43ad081",
        "N"
    );
    list.add(n);

    n = RaceModel(
        "",
        "NEGUMAK",
        "N/A",
        "1989 D.C",
        "Primeira visita na Terra, que se conheça, 1989. Abduzem seres humanos e controlam a mente das pessoas que capturam (humanos abduzidos), e usam-nos, depois de libertados para objetivos desconhecidos. Foi esta raça a verdadeira inspiração para os alienígenas no filme 'Dia da Independência'. São uma das raças mais antigas que existem. Também são uma das raças que os governos da Terra mais temem, tendo em consideração o futuro dos Humanos.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FNegumak.png?alt=media&token=3c126e60-05ac-4d58-be28-0a0938843479",
        "N"
    );
    list.add(n);

    n = RaceModel(
        "",
        "ZETA RETICULAI",
        "Nets",
        "4000 A.C",
        "Muitas vezes confundidos (devido à aparência) com as raças Maitre e Solipsi Rai (ou 'Grays'). Vêm da constelação Nets. São aliados dos Anunnaki e cooperam com eles em diferentes planetas... São os representantes dos Anunnaki na Terra e mandam-lhes informação sobre os Humanos e este planeta pelo menos 25 vezes por ano. Os Anunnaki fizeram engenharia genética numa subespécie dos Zeta para que eles ficassem com uma aparência mais próxima da humana, mas deixando suficientes diferenças físicas para os Humanos os distinguirem. Mais tarde tornaram-se alguns Faraós do Egito. O mais conhecido de todos foi AKHENATON a quem os reptilianos tomaram o poder... infiltraram-se na Corte como Sacerdotes do Templo. Os primeiros relatos sobre os ZETAS datam de 4000 A.C, mas é bem plausível que o número seja maior. Foram os primeiros híbridos criados por engenharia genética pelos Anunnaki. A subespécie Zeta ainda existe na Terra e ainda (pelo menos 30%) apresenta as mesmas diferenças físicas com as quais foram criados. Ainda hoje, cerca de 30% deles têm malformações. Existem aqui ainda em duas formas... a original e a híbrida. A sua localização na Terra é desconhecida.",
        "",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "TARICE",
        "N/A",
        "N/A",
        "A sua origem é desconhecida. São muitas vezes vistos perto (ou a voar perto) de vulcões. (identificam-se devido à sofisticada natureza das suas navez). Nunca contactaram os Humanos e não existem relatos de violência ou abduções. Embora seja discretos, a sua presença na Terra é frequente e não tentam ocultar a sua presença. Há vários relatos contraditórios sobre a sua aparência. Último avistamento: juntp à costa da Noruega em 2000.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FZeta-Reticulai.png?alt=media&token=e9c017d9-37bf-4873-b909-3a93ef9373c7",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "PURITAV-ILLUMU",
        "N/A",
        "N/A",
        "A sua origem é desconhecida. São avistados com frequência no Noroeste amerciano (especialmente na zona do Oregon). Parecem estar interessados nos oceanos e sabe-se que têm naves subaquáticas (ou USO's). Nos anos 80 e 90 houve choques com navios da marinha americana, quando os americanos estavam a testar os novos sistemas de sonar e radar. São pacíficos e sobretudo noturnos. O último avistamento foi em 2000 perto de São Francisco.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Fpuritav-illumu.png?alt=media&token=65ad9452-94e1-4563-a0b7-fdfdc8f1066c",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "X-1Z",
        "N/A",
        "Séc. XVI",
        "Foram apenas avistados 2 vezes na Terra. De acordo com os relatos de outras raças, são capazes de mudar de forma 'shapeshift' e até 4 vezes em 10 segundos. A origem é desconhecida. Fazem abduções frequentes e executam experiências médicas em humanos. Visitam a Terra desde meados do Séc. XVI. Os únicos 2 avistamentos confirmados foram ao pé de Elazig (Turquia).",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Fx-1z.png?alt=media&token=033aa8d7-dc26-49ad-868d-887960730249",
        "N"
    );
    list.add(n);

    n = RaceModel(
        "",
        "CARAVELDI",
        "Camaleão",
        "N/A",
        "Considerada (por vezes) extremamente perigosa para os Humanos, assim como para outras espécies. Vêm da constelação de Chamaeleon (Camaleão). Estiveram em conflito com algumas outras raças por mais de 500 anos (do nosso tempo). São raramente vistos na Terra. Podem viver até 150 anos e atingir 3 metros de altura e têm 4 braços. O último avistamento foi perto de Nova Orleães (EUA) em 1976.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Fcaraveldi.png?alt=media&token=bed26489-96f3-4764-b60a-07e395629c0f",
        "N"
    );
    list.add(n);

    n = RaceModel(
        "",
        "ELFFAF",
        "Boieiro",
        "N/A",
        "Vêm da constelação Bootes (Boieiro) perto da estrela Asellus Primus. São parecidos com certos tipos de Grays mas não são 'aparentados'. A sua espécie tem 4 sexos (gêneros) diferentes, e são conhecidos como benevolentes. O objetivo da sua visita é desconhecido mas têm especial interesse em materiais/minerais pois são vistos perto de minas antigas. Último avistamento: San Isidro de El General (Costa Rica).",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Felffaf.png?alt=media&token=5ec2c894-6d53-422a-a53c-943423b42914",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "MATRAX",
        "Delfim",
        "4.000 A. Atrás",
        "Apesar da sua aparência (provoca medo aos humanos que os avistam) esta raça não é considerada agressiva. Podem viver até 400 anos, e vêm da constelação Delphinus, (Delfim) perto de Sualocin. Têm visitado a Terra pelo menos desde há 4.000 anos, mas foram avistados com frequência durante o Séc. XIX. Serviram de inspiração também para o filme 'O dia da Independência'. O último avistamento aconteceu perto de Marselha, França, em 1996.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Fmatrax.png?alt=media&token=4c9485f4-d0e3-48a0-b9fe-d50844aca2fe",
        "S"
    );
    list.add(n);

    n = RaceModel(
        "",
        "TISAR-3",
        "N/A",
        "N/A",
        "A sua origem é desconhecida mas há relatos que afirmam que levam 2 anos a chegar a este planeta. São os sobreviventes de uma raça reptóide extinta e não possuem o mesmo nível de tecnologia ou conhecimentos das outras raças que visitam a Terra. Têm algumas carcterísticas semelhantes às dos humanos, como a pele. Em 1977, ou 1978, perto de Siena (Itália), 2 da sua espécie foram capturados após aterrarem atrás de uma igreja em ruínas... 3 dias depois foram transferidos para uma base aérea americana na Itália, e finalmente levados para um local secreto onde, supostamente, ainda se encontram, os contatos mencionaram que se encontram alguns no Pacífico Sul e em outra base americana perto do Japão. O APIS/3 Soviético pode obter uma gravação de vídeo desta espécie. Último avistamento: 3 de Janeiro de 2001, perto de Vitoria, Canadá.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Ftisar-3.png?alt=media&token=9c541b8e-63be-4eec-a090-b9cc8f003795",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "ELLINA",
        "N/A",
        "N/A",
        "Supostamente foi esta raça que originou o mito dos Elfos (Elfo). São avistados com frequência nos países germânicos no interior de florestas. Não consta que sejam letais para os Humanos, no entanto são 'maliciosos'... parece que se divertem a assustar os Humanos quando estes se aproximam demais. Houve relatos que terem atráido Humanos para longe dos carros para roubar os seus pertences... e quando os Humanos se afastam dos veículos (e eles já roubaram o que queriam) assustam-nos o que faz que os humanos abandonem o local. Último avistamento: perto de Munique, Alemanha, em Dezembro de 2004.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2Fellina.png?alt=media&token=943a8b62-5afd-495f-b7bf-bd8911049f5a",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "KILLIMAT-ARR",
        "Cruzeiro do Sul",
        "N/A",
        "Eles vêm da constelação Crux (Cruzeiro do Sul) perto de GaCrux (estrela Gamma Crucis). É uma raça muito difícil de detectar ou seguir o rastro. Tanto o exército russo como o dos URSS, desenvolveram uma câmera especial e um sistema de radar que permite detectá-los quando estão entre nós. Mesmo assim só foram detectados 8 vezes. O objetivo das suas visitas é desconhecido. Quando são avistados geralmente acontece na zona conhecida como Triângulo das Bermudas.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FKillimat-Arr.png?alt=media&token=69937be8-f263-4b3d-a43f-bb9f8e62f99f",
        "N/A"
    );
    list.add(n);

    n = RaceModel(
        "",
        "REPTILIANOS",
        "Dragão",
        "15.000 A. Atrás",
        "A espécie mais conhecida e temida das espécies Reptóides (há pelo menos 3 espécies). Tem estado na Terra permanentemente há mais de 15.000 anos (confirmado), mas crê-se que podem ter cá estado (permanentemente ou intermitentemente) há milhôes de anos. Vêm da constelação de Draco (Dragão). Estão presentes em milhares de planetas e colonizara pelo menos 500 planetas através de infiltração dos governos e outros lugares de chefia em todos esses planetas. Alguns (mas não todos) os membros têm a capacidade de mudar de forma ('shapeshift') assim como capacidades telepáticas. Na Terra não precisaram de se encontrarem continuamente no poder pois têm vivido lado a lado com os Humanos (sem eles se darem conta) e 'vivera' a nossa evolução (em todos os aspectos). São considerados como uma das espécies tecnologicamente mais avançadas mas preferem trabalhar na 'sombra', usando isso como uma vantagem para o seu progresso ou planos/agenda. Conseguem viajar inter-dimensionalmente (a maior parte das raças não consegue) e alguns dos seus membros de mais alto nível também têm o poder de se tornar invisíveis... para ter esse poder um reptiliano tem primeiro de ser aceito no que eles chamam de 'o Draco', um grupo de elite de Reptilianos. Os Reptilianos do 'Draco' estão infiltrados (ou mesmo são co-fundadores) dos Illuminati. Têm 3 bases principais na Terra: na área do Triângulo das Bermudas; ao largo da costa da Dinamarca e ao largo da costa da Nova Zelândia. Há quem diga que não irão embora, pelo menos de sua própria vontade.",
        "https://firebasestorage.googleapis.com/v0/b/ufo-aliens-check-app.appspot.com/o/races%2FReptilianos.png?alt=media&token=a92fb976-5b70-4988-b9bf-b407468da187",
        "N"
    );
    list.add(n);

    return list;
  }

  Future<void> addDocumentaryManual() async {

    DocumentaryModel d = DocumentaryModel(
        "",
        "ALÉM DOS OVNIS | DOCUMENTÁRIO",
        "Neste programa EXTRA, disponibilizamos o documentário do extinto Canal Infinito, exibidos nos anos 2000, intitulado “Além dos OVNIs”. Neste vídeo feito com base em outro documentário de 1996, são apresentadas várias imagens e vídeos interessantes de OVNIs",
        "iT6VH9fLptk",
        DateTime.now()

    );

    firebaseFirestore.collection("documentaries").add(d.toJson());
  }
}