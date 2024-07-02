class HistoricalCharacterModel {
  String? id;
  String? kingName;
  String? content;
  String? image;

  HistoricalCharacterModel({
    this.id,
    this.kingName,
    this.content,
    this.image,
  });

  factory HistoricalCharacterModel.fromJson(Map<String, dynamic> json) {
    return HistoricalCharacterModel(
      id: json['id'] as String?,
      kingName: json['king_name'] as String?,
      content: json['content'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'king_name': kingName,
        'content': content,
        'image': image,
      };
}
