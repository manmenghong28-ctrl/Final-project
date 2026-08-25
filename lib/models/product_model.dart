
class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String image;

  Product(
    {
      required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.image,
  }
  );
  // convert json to product object
  factory Product.fromJson(Map<String,dynamic> json){
    return Product(
      id: json['id']??0, 
      name: json['name']??'', 
      // price: (json['price'] as num).toDouble(),
      price: json['price'] !=null ? double.tryParse(json['price'].toString())??0.0:0.0,
      description: json['description']??'', 
      image: json['image']??'',
      );
  }
}
