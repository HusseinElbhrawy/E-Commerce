// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Home extends Equatable {
  final bool status;
  final String? message;
  final HomeData? data;
  const Home({
    required this.status,
    this.message,
    this.data,
  });
  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}

class HomeData extends Equatable {
  final List<Banner>? banners;
  final List<Product>? products;
  const HomeData({
    required this.banners,
    required this.products,
  });
  @override
  List<Object?> get props => [
        banners,
        products,
      ];
}

class Banner extends Equatable {
  final int? id;
  final String? image;
  final Category? category;
  final Product? product;
  const Banner({
    required this.id,
    required this.image,
    required this.category,
    required this.product,
  });
  @override
  List<Object?> get props => [
        id,
        image,
        category,
        product,
      ];
}

class Category extends Equatable {
  final int? id;
  final String? image;
  final String? name;

  const Category({
    required this.id,
    required this.image,
    required this.name,
  });
  @override
  List<Object?> get props => [
        id,
        image,
        name,
      ];
}

class Product extends Equatable {
  final int? id;
  final num? price;
  final num? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final List<String>? images;
  final bool? inFavorites;
  final bool? inCart;

  const Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });
  @override
  List<Object?> get props => [
        id,
        price,
        oldPrice,
        discount,
        image,
        name,
        description,
        images,
        inFavorites,
        inCart,
      ];
}
