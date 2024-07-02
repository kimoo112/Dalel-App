class HistoricalModel {
  String? id;
  String? title;
  String? content;
  String? image;

  HistoricalModel({this.id, this.title, this.content, this.image});

  factory HistoricalModel.fromJson(Map<String, dynamic> json) {
    return HistoricalModel(
      id: json['id'] as String?,
      title: json['Title'] as String?,
      content: json['content'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'Title': title,
        'content': content,
        'image': image,
      };
}
