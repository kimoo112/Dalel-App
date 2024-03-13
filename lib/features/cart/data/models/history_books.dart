class HistoryBooksModel {
  final String name;
  final String image;

  HistoryBooksModel({
    required this.name,
    required this.image,
  });
}

List<HistoryBooksModel> getHistoryBooks = [
  HistoryBooksModel(
      name: 'The Odyssey',
      image: 'assets/images/800px-Richard_coeur_de_lion 1@2x.png'),
  HistoryBooksModel(
      name: 'The Epic of Gilgamesh',
      image:
          'assets/images/Painting_of_Napoleon_Bonaparte_by_Jacques-Louis_David,_1813 1.png'),
  HistoryBooksModel(
      name: 'The Republic',
      image: 'assets/images/Salah al Din, mohamed saad 1.png'),
  HistoryBooksModel(name: 'Tao Te Ching', image: 'assets/images/image 2.png'),
];
