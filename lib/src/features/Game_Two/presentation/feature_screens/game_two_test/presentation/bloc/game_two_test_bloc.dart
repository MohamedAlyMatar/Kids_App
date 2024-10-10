import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_two_test_event.dart';
part 'game_two_test_state.dart';

class GameTwoTestBloc extends Bloc<GameTwoTestEvent, GameTwoTestState> {
  GameTwoTestBloc() : super(GameTwoTestInitial()) {
    on<GameTwoTestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
