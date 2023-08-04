import 'package:cloud_firestore/cloud_firestore.dart';

class RaceModel{
  late String id;
  late String name;
  late String constelation;
  late String firstVisit;
  late String description;
  late String image;
  late String pacific;

  RaceModel(this.id, this.name, this.constelation, this.firstVisit, this.description, this.image, this.pacific);

  RaceModel.fromMap(Map<String, dynamic> json, String idDoc){
    id = json['id'] == "" ? idDoc : json['id'];
    name = json['name'];
    constelation = json['constelation'];
    firstVisit = json['firstVisit'];
    description = json['description'];
    image = json['image'];
    pacific =json['pacific'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'constelation': constelation,
    'firstVisit': firstVisit,
    'description': description,
    'image': image,
    'pacific': pacific
  };

  RaceModel.fromSnapshot(DocumentSnapshot snapshot){
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    id = data['id'];
    name = data['name'];
    constelation = data['constelation'];
    firstVisit = data['firstVisit'];
    description = data['description'];
    image = data['image'];
    pacific = data['pacific'];
  }
}