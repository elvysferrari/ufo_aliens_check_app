import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeModel{
  late String id;
  late String title;
  late String description;
  late String url;
  late DateTime date;

  NoticeModel(this.id, this.title, this.description, this.url, this.date);

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'url': url,
    'date': date
  };

  NoticeModel.fromMap(Map<String, dynamic> json, String idDoc){
    id = json['id'] == "" ? idDoc : json['id'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    if(json['date'] != null) {
      Timestamp t = json['date'];
      date = t.toDate();
    }else{
      date = DateTime.now();
    }
  }

  NoticeModel.fromSnapshot(DocumentSnapshot snapshot){
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    id = data['id'];
    title = data['title'];
    description = data['description'];
    url = data['url'];
    if(data['date'] != null) {
      Timestamp t = data['date'];
      date = t.toDate();
    }else{
      date = DateTime.now();
    }
  }
}