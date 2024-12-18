// To parse this JSON data, do
//
//     final dummyModel = dummyModelFromJson(jsonString);

import 'dart:convert';

DummyModel dummyModelFromJson(String str) => DummyModel.fromJson(json.decode(str));

String dummyModelToJson(DummyModel data) => json.encode(data.toJson());

class DummyModel {
  int statusCode;
  String statusMessages;
  Data data;

  DummyModel({
    required this.statusCode,
    required this.statusMessages,
    required this.data,
  });

  factory DummyModel.fromJson(Map<String, dynamic> json) => DummyModel(
    statusCode: json["statusCode"],
    statusMessages: json["statusMessages"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "statusMessages": statusMessages,
    "data": data.toJson(),
  };
}

class Data {
  List<Product> products;

  Data({
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  int id;
  String name;
  String description;
  double price;
  String currency;
  bool inStock;
  double rating;
  String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    required this.inStock,
    required this.rating,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"]?.toDouble(),
    currency: json["currency"],
    inStock: json["in_stock"],
    rating: json["rating"]?.toDouble(),
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "currency": currency,
    "in_stock": inStock,
    "rating": rating,
    "image_url": imageUrl,
  };
}
