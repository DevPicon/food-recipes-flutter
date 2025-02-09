import 'package:restaurant_menu/data/models/dish_model.dart';

abstract class MenuDataSource {
  Future<List<DishModel>> getDishes();
}
