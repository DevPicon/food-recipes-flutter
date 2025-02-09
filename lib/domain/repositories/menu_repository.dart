import 'package:dartz/dartz.dart';
import 'package:restaurant_menu/domain/entities/dish.dart';
import 'package:restaurant_menu/shared/error/custom_error.dart';

abstract class MenuRepository {
  Future<Either<CustomError, List<Dish>>> getDishes();
}
