class SendPostModel{
  late String name;
  late String url;
  late String title;
  late String description;
  late bool visualized;

  SendPostModel(this.name, this.title, this.description, this.url, this.visualized);

  Map<String, dynamic> toJson() => {
    'name': name,
    'url': url,
    'title': title,
    'description': description,
    'visualized': visualized
  };
}