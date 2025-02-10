import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu/data/datasources/menu_mock_datasource.dart';
import 'package:restaurant_menu/data/repositories/menu_repository_impl.dart';
import 'package:restaurant_menu/features/food_list/application/bloc/menu_bloc.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late MenuBloc _menuBloc;

  @override
  void initState() {
    _menuBloc = MenuBloc(
      menuRepository: MenuRepositoryImpl(dataSource: MenuMockDatasource()),
    );
    _menuBloc.add(const MenuEvent.getMenu());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: const Text('Menu Screen'),
        ),
        body: BlocBuilder<MenuBloc, MenuState>(
            bloc: _menuBloc,
            builder: (context, state) {
              return state.when(
                  initial: SizedBox.new,
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  loaded: (dishes) => ListView.builder(
                      itemCount: dishes.length,
                      itemBuilder: (context, index) {
                        final dish = dishes[index];

                        return ListTile(
                          title: Text(dish.name),
                          subtitle: Text(dish.description),
                        );
                      }),
                  error: (message) => Center(child: Text(message)));
            }));
  }
}
