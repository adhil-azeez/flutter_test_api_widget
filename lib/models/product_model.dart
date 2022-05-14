import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_test_api_widget/models/_base_model.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends BaseModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel(this.id, this.title, this.price, this.description, this.category,
      this.image, this.rating);

  factory ProductModel.fromJson(Map<String, dynamic> data) =>
      _$ProductModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class RatingModel extends BaseModel {
  final double rate;
  final int count;

  RatingModel(this.rate, this.count);

  factory RatingModel.fromJson(Map<String, dynamic> data) =>
      _$RatingModelFromJson(data);

  Map<String, dynamic> toJson() => _$RatingModelToJson(this);
}
