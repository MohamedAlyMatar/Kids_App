import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_app/src/features/Game_Two/data/models/item_model.dart';

import 'package:kids_app/src/features/Game_Two/domain/usecases/init_game.dart';

abstract class GameTwoEvent {}

class GameInitEvent extends GameTwoEvent {}

class GameStartEvent extends GameTwoEvent {}

abstract class GameTwoState {}

class GameInitialState extends GameTwoState {}

class GameLoadedState extends GameTwoState {
  final List<ItemModel> items;
  final bool startGame;

  GameLoadedState({required this.items, this.startGame = true});
}

class GameTwoBloc extends Bloc<GameTwoEvent, GameTwoState> {
  final InitGame initGame = InitGame();

  GameTwoBloc() : super(GameInitialState()) {
    on<GameInitEvent>((event, emit) {
      final items = initGame();
      emit(GameLoadedState(items: items));
    });

    on<GameStartEvent>((event, emit) {
      final currentState = state as GameLoadedState;
      emit(GameLoadedState(items: currentState.items, startGame: false));
    });
  }
}
