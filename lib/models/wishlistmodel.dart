class WishlistModel{
  final String? id;
  final String? productId;
  final String? email;


  WishlistModel.fromJson(Map<String,Object?> json)
        :this(
          id:json['id']!as String,
          productId:json['products']!as String,
          email:json['email']! as String,
        );
        WishlistModel({
          this.id,
          required this.productId,
          required this.email, 
        });
}