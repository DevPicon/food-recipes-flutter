import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:restaurant_menu/domain/entities/dish.dart';

part 'dish_model.g.dart';
part 'dish_model.freezed.dart';

@freezed
class DishModel extends Dish with _$DishModel {
  const factory DishModel({
    @Default("") String name,
    @Default("") String description,
  }) = _DishModel;

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);
}
