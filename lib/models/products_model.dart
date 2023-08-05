class Products{
  final String productName;
  final String subname;
  final String category;
  final int quantity;
  final int price;
  final String description;
  final List? imageList;
  final String? id;

  Products.fromJson(Map<String,Object?> json)

  : this(
    productName:json['name']! as String,
    subname:json['subname']! as String,
    category:json['category']! as String,
    quantity:json['quantity']! as int,
    price:json['price']! as int,
    description:json['description']! as String,
    imageList:json['image']! as List,
    id:json['id']! as String,

  );

  Products({
    required this.productName,
    required this.subname,
    required this.category,
    required this.quantity,
    required this.price,
    required this.description,
    required this.imageList,
    required this.id
  });
}