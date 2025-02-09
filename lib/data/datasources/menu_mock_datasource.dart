import 'package:restaurant_menu/data/datasources/menu_datasource.dart';
import 'package:restaurant_menu/data/models/dish_model.dart';
import 'package:restaurant_menu/shared/data/menu_data.dart';

class MenuMockDatasource implements MenuDataSource {
  @override
  Future<List<DishModel>> getDishes() async {
    return List<DishModel>.from(
      menuData.map(
        (json) => DishModel.fromJson(json),
      ),
    );
  }
}
