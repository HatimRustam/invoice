class product_model {
  final int? id;
  final String? img;
  final String? name;
  final double? price;

  product_model(
      {required this.id,
      required this.img,
      required this.name,
      required this.price});
}

List<product_model> product = [
  product_model(
      id: 1,
      img: "assets/images/istockphoto-1226733438-612x612-removebg-preview.png",
      name: "Avocada salad",
      price: 10),
  product_model(
      id: 2,
      img: "assets/images/images-removebg-preview.png",
      name: "Fruit salad",
      price: 12),
  product_model(
      id: 3,
      img: "assets/images/istockphoto-168855393-612x612-removebg-preview.png",
      name: "veg salad",
      price: 6),
  product_model(
      id: 4,
      img: "assets/images/istockphoto-1226733438-612x612-removebg-preview.png",
      name: "Cucumber salad",
      price: 5),
];

class cartmodel {
  final String? image;
  final String? name;
  final double? price;
  final int? qnty;

  cartmodel(
      {required this.name,
      required this.price,
      required this.image,
      this.qnty});
}

List<cartmodel> cartlist = [];
