import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_1_event.dart';
part 'game_1_state.dart';

class Game_1Bloc extends Bloc<Game_1Event, Game_1State> {
  Game_1Bloc() : super(Game_1Initial()) {
    on<Game_1Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
