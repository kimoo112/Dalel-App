class HistoricalKingsModel {
  String? id;
  String? name;
  String? content;
  String? timePeriod;
  String? image;

  HistoricalKingsModel({
    this.id,
    this.name,
    this.content,
    this.timePeriod,
    this.image,
  });

  factory HistoricalKingsModel.fromJson(Map<String, dynamic> json) {
    return HistoricalKingsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      content: json['content'] as String?,
      timePeriod: json['time_period'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'content': content,
        'time_period': timePeriod,
        'image': image,
      };
}
