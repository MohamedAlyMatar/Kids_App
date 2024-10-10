import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_two_trial_event.dart';
part 'game_two_trial_state.dart';

class GameTwoTrialBloc extends Bloc<GameTwoTrialEvent, GameTwoTrialState> {
  GameTwoTrialBloc() : super(GameTwoTrialInitial()) {
    on<GameTwoTrialEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
