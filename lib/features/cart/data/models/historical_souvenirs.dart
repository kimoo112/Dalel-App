class HistoricalSouvenirsModel {
 final String name;
  final String image;

  HistoricalSouvenirsModel({
    required this.name,
    required this.image,
  });
}
List<HistoricalSouvenirsModel> getHistoricalSouvenirs = [
  HistoricalSouvenirsModel(name: 'Old Ring', image: 'assets/images/old_ring.png'),
  HistoricalSouvenirsModel(name: 'Mini Statue', image: 'assets/images/mini_statue.png'),
  HistoricalSouvenirsModel(name: 'Posters', image: 'assets/images/posters.png'),
  HistoricalSouvenirsModel(name: 'Old Maps', image: 'assets/images/old_maps.png'),
];

