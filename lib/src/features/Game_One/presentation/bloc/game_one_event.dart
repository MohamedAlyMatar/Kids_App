// import 'package:equatable/equatable.dart';

// abstract class Game_1Event extends Equatable {
//   const Game_1Event();

//   @override
//   List<Object> get props => [];
// }

// class StartTrial extends Game_1Event {
//   final int trialNumber;

//   const StartTrial({required this.trialNumber});

//   @override
//   List<Object> get props => [trialNumber];
// }

// class PlayAudio extends Game_1Event {}

// class SubmitAnswer extends Game_1Event {
//   final bool isCorrect;

//   const SubmitAnswer({required this.isCorrect});

//   @override
//   List<Object> get props => [isCorrect];
// }

part of 'game_one_bloc.dart';

abstract class GameOneEvent extends Equatable {
  GameTwoEvent();

  @override
  List<Object> get props => [];
}
