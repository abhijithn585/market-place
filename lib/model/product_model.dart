
class ProductModel {
  String? name;
  String? price;
  String? category;
  String? details;
  String? imageUrl;
  String? location;
  String? sellerUid;
  String? sellerName;
  String? sellerImage;
  // UserModel? userModel;

  ProductModel({
    required this.name,
    required this.price,
    required this.category,
    required this.details,
    required this.imageUrl,
    required this.location,
    required this.sellerUid,
    required this.sellerName,
    required this.sellerImage,
    // required this.userModel
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"],
      price: json["price"],
      category: json["category"],
      details: json["details"],
      imageUrl: json["imageUrl"],
      location: json["location"],
      sellerUid: json["sellerUid"],
      sellerName: json["sellerName"],
      sellerImage: json["sellerImage"],
      // userModel: json["userModel"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "price": price,
      "category": category,
      "details": details,
      "imageUrl": imageUrl,
      "location": location,
      "sellerUid": sellerUid,
      "sellerName": sellerName,
      "sellerImage": sellerImage,
      // "userModel": userModel,
    };
  }
}
