// import 'package:equatable/equatable.dart';

// abstract class Game_1State extends Equatable {
//   const Game_1State();

//   @override
//   List<Object> get props => [];
// }

// class Game_1Initial extends Game_1State {}

// class TrialInProgress extends Game_1State {
//   final int trialNumber;
//   final bool isAudioPlaying;
//   final String resultMessage;

//   const TrialInProgress({
//     required this.trialNumber,
//     this.isAudioPlaying = false,
//     this.resultMessage = "",
//   });

//   @override
//   List<Object> get props => [trialNumber, isAudioPlaying, resultMessage];
// }

// class AnswerSubmitted extends Game_1State {
//   final bool isCorrect;
//   final String resultMessage;

//   const AnswerSubmitted({required this.isCorrect, required this.resultMessage});

//   @override
//   List<Object> get props => [isCorrect, resultMessage];
// }
