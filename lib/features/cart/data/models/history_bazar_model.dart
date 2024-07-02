import 'package:dalel/core/utils/app_assets.dart';

class HistoryBazarModel {
  final String name;
  final String image;
  final double price;
  final bool isSouvenirs;

  HistoryBazarModel({
    required this.name,
    required this.image,
    required this.price,
    required this.isSouvenirs,
  });
}

List<HistoryBazarModel> getHistoryBazarProducts = [
  HistoryBazarModel(
      name: 'The Odyssey',
      image: Assets.images800pxRichardCoeurDeLion,
      price: 10.99, // Setting price for the first book
      isSouvenirs: false),
  HistoryBazarModel(
      name: 'The Epic of Gilgamesh',
      image: Assets.imagesPaintingOfNapoleonBonaparteByJacquesLouisDavid18131,
      price: 15.99, // Setting price for the second book
      isSouvenirs: false),
  HistoryBazarModel(
      name: 'The Republic',
      image: Assets.imagesSalahalDinmohamedsaad,
      price: 12.99, // Setting price for the third book
      isSouvenirs: false),
  HistoryBazarModel(
      name: 'Tao Te Ching',
      image: Assets.imagesImage2,
      price: 8.99, // Setting price for the fourth book
      isSouvenirs: false),
  HistoryBazarModel(
      name: 'Old Ring',
      image: 'assets/images/old_ring.png',
      price: 35.99,
      isSouvenirs: true),
  HistoryBazarModel(
      name: 'Mini Statue',
      image: 'assets/images/mini_statue.png',
      price: 12.99,
      isSouvenirs: true),
  HistoryBazarModel(
      name: 'Posters',
      image: 'assets/images/posters.png',
      price: 5.99,
      isSouvenirs: true),
  HistoryBazarModel(
      name: 'Old Maps',
      image: 'assets/images/old_maps.png',
      price: 22.99,
      isSouvenirs: true),
];
