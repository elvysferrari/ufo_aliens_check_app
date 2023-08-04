import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {

  late String id;
  late String userName;
  late String shortDescription;
  late String fullDescription;
  late String url;
  late String totalReal;
  late String totalFake;
  late DateTime date;

  VideoModel({ required this.id, required this.userName, required this.shortDescription, required this.fullDescription, required this.url, required this.totalReal, required this.totalFake, required this.date});

  VideoModel.fromMap(Map<String, dynamic> json, String idDoc){
    id = json['id'] == "" ? idDoc : json['id'];
    userName = json['userName'];
    shortDescription = json['shortDescription'];
    fullDescription = json['fullDescription'];
    url = json['url'];
    totalReal = json['totalReal'];
    totalFake = json['totalFake'];

    if(json['date'] != null) {
      Timestamp t = json['date'];
      date = t.toDate();
    }else{
      date = DateTime.now();
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userName': userName,
    'shortDescription': shortDescription,
    'fullDescription': fullDescription,
    'url': url,
    'totalReal': totalReal,
    'totalFake': totalFake,
    'date': date
  };

  VideoModel.fromSnapshot(DocumentSnapshot snapshot, String idDoc){
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    id = data['id'] == "" ? idDoc : data['id'];
    userName = data['userName'];
    shortDescription = data['shortDescription'];
    fullDescription = data['fullDescription'];
    url = data['url'];
    totalReal = data['totalReal'];
    totalFake = data['totalFake'];
    if(data['date'] != null) {
      Timestamp t = data['date'];
      date = t.toDate();
    }else{
      date = DateTime.now();
    }
  }
}