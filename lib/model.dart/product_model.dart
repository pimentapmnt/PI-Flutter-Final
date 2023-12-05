
class Product {
  final String image, title;
  final int id, idJogo;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.idJogo,
  });
}

List<Product> products = [
  Product(
    id: 1,
    idJogo: 1,
    title: "VALORANT",
    image: "assets/images/valorant.jpg",
  ),
  Product(
    id: 2,
    idJogo: 2,
    title: "LEAGUE OF LEGENDS",
    image: "assets/images/lol.jpg",
  ),
  Product(
    id: 3,
    idJogo: 3,
    title: "COUNTER STRIKE 2",
    image: "assets/images/cs2.jpg",
  ),
  Product(
    id: 4,
    idJogo: 4,
    title: "FIFA",
    image:
        "assets/images/fifa.jpg",
  ),
  Product(
    id: 5,
    idJogo: 5,
    title: "TEAM FIGHT TATICS",
    image: "assets/images/tft.jpg",
  ),
  Product(
    id: 6,
    idJogo: 6,
    title: "ROCKET LEAGUE",
    image: "assets/images/rl.jpg",
  ),
];
