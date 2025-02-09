import 'package:dartz/dartz.dart';
import 'package:restaurant_menu/data/datasources/menu_datasource.dart';
import 'package:restaurant_menu/domain/entities/dish.dart';
import 'package:restaurant_menu/domain/repositories/menu_repository.dart';
import 'package:restaurant_menu/shared/error/custom_error.dart';

class MenuRepositoryImpl implements MenuRepository {
  const MenuRepositoryImpl({
    required MenuDataSource dataSource,
  }) : _menuDataSource = dataSource;

  final MenuDataSource _menuDataSource;

  @override
  Future<Either<CustomError, List<Dish>>> getDishes() async {
    try {
      final dishes = await _menuDataSource.getDishes();
      return Right(dishes);
    } catch (e) {
      return const Left(CustomError.unexpected());
    }
  }
}
