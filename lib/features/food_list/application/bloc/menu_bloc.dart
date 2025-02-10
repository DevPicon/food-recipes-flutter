import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_menu/domain/entities/dish.dart';
import 'package:restaurant_menu/domain/repositories/menu_repository.dart';

part 'menu_bloc.freezed.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc({
    required MenuRepository menuRepository,
  })  : _menuRepository = menuRepository,
        super(const _Initial()) {
    on<_GetMenuEvent>(_onGetMenuEvent);
  }

  final MenuRepository _menuRepository;

  void _onGetMenuEvent(_GetMenuEvent event, Emitter<MenuState> emit) async {
    emit(const _Loading());

    await Future.delayed(
      const Duration(seconds: 2),
    );

    final result = await _menuRepository.getDishes();

    result.fold((error) {
      emit(_Error(message: error.message));
    }, (dishes) {
      emit(_Loaded(dishes: dishes));
    });
  }
}

@freezed
class MenuState with _$MenuState {
  const factory MenuState.initial() = _Initial;
  const factory MenuState.loading() = _Loading;
  const factory MenuState.loaded({
    required List<Dish> dishes,
  }) = _Loaded;
  const factory MenuState.error({
    required String message,
  }) = _Error;
}

@freezed
class MenuEvent with _$MenuEvent {
  const factory MenuEvent.getMenu() = _GetMenuEvent;
}
