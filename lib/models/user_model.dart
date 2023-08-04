class UserModel {
  late String uuid;

  UserModel(this.uuid);

  Map<String, dynamic> toJson() => {
    'uuid': uuid
  };
}