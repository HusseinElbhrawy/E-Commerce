// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/home.dart';

class HomeModel extends Home {
  const HomeModel({
    required super.status,
    required super.message,
    required super.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      status: map['status'] as bool,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? HomeDataModel.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class HomeDataModel extends HomeData {
  const HomeDataModel({
    required super.banners,
    required super.products,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'banners': banners!.map((x) => x).toList(),
      'products': products!.map((x) => x).toList(),
    };
  }

  factory HomeDataModel.fromMap(Map<String, dynamic> map) {
    return HomeDataModel(
      banners: List<BannerModel>.from(
        (map['banners'] as List).map<BannerModel>(
          (x) => BannerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      products: List<ProductModel>.from(
        (map['products'] as List).map<ProductModel>(
          (x) => ProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeDataModel.fromJson(String source) =>
      HomeDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class BannerModel extends Banner {
  const BannerModel({
    required super.id,
    required super.image,
    required super.category,
    required super.product,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'category': category,
      'product': product,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'] as int,
      image: map['image'] as String,
      category: map['category'] != null
          ? CategoryModel.fromMap(map['category'] as Map<String, dynamic>)
          : null,
      product: map['product'] != null
          ? ProductModel.fromMap(map['product'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.image,
    required super.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      image: map['image'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.inFavorites,
    required super.inCart,
    required super.description,
    required super.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'old_price': oldPrice,
      'discount': discount,
      'images': image,
      'in_favorites': inFavorites,
      'in_cart': inCart,
      'description': description,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'] as String,
      price: map['price'],
      oldPrice: map['old_price'],
      discount: map['discount'],
      image: map['image'],
      inFavorites: map['in_favorites'] as bool,
      inCart: map['in_cart'] as bool,
      description: map['description'] as String,
      images: List<String>.from((map['images'] as List).map((e) => e)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
