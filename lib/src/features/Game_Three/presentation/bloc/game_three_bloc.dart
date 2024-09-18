import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_three_event.dart';
part 'game_three_state.dart';

class GameThreeBloc extends Bloc<GameThreeEvent, GameThreeState> {
  GameThreeBloc() : super(GameThreeInitial()) {
    on<GameThreeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
