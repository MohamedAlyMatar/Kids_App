import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_two_event.dart';
part 'game_two_state.dart';

class GameTwoBloc extends Bloc<GameTwoEvent, GameTwoState> {
  GameTwoBloc() : super(GameTwoInitial()) {
    on<GameTwoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
