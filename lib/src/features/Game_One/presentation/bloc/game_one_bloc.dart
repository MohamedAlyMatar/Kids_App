// import 'package:flutter_bloc/flutter_bloc.dart';

// enum GameEvent { playAudio, submitAnswer, nextLevel, retryTrial }

// class GameState {
//   final int currentLevel;
//   final int currentQuestion;
//   final int correctAnswers;
//   final bool isAudioPlaying;
//   final bool showPictures;
//   final String resultMessage;
//   final int remainingTrials;
//   final List<int> selectedPictureIndices;

//   GameState({
//     required this.currentLevel,
//     required this.currentQuestion,
//     required this.correctAnswers,
//     required this.isAudioPlaying,
//     required this.showPictures,
//     required this.resultMessage,
//     required this.remainingTrials,
//     required this.selectedPictureIndices,
//   });

//   GameState copyWith({
//     int? currentLevel,
//     int? currentQuestion,
//     int? correctAnswers,
//     bool? isAudioPlaying,
//     bool? showPictures,
//     String? resultMessage,
//     int? remainingTrials,
//     List<int>? selectedPictureIndices,
//   }) {
//     return GameState(
//       currentLevel: currentLevel ?? this.currentLevel,
//       currentQuestion: currentQuestion ?? this.currentQuestion,
//       correctAnswers: correctAnswers ?? this.correctAnswers,
//       isAudioPlaying: isAudioPlaying ?? this.isAudioPlaying,
//       showPictures: showPictures ?? this.showPictures,
//       resultMessage: resultMessage ?? this.resultMessage,
//       remainingTrials: remainingTrials ?? this.remainingTrials,
//       selectedPictureIndices:
//           selectedPictureIndices ?? this.selectedPictureIndices,
//     );
//   }
// }

// class GameBloc extends Bloc<GameEvent, GameState> {
//   final List<int> correctAnswers = [0, 2]; // Example correct answers

//   GameBloc()
//       : super(GameState(
//           currentLevel: 1,
//           currentQuestion: 1,
//           correctAnswers: 0,
//           isAudioPlaying: false,
//           showPictures: false,
//           resultMessage: '',
//           remainingTrials: 3,
//           selectedPictureIndices: [],
//         )) {
//     on<GameEvent>((event, emit) {
//       if (event == GameEvent.playAudio) {
//         emit(state.copyWith(
//           isAudioPlaying: true,
//           resultMessage: 'Audio is playing, listen carefully...',
//           showPictures: false,
//           selectedPictureIndices: [],
//         ));
//         Future.delayed(Duration(seconds: 3), () {
//           emit(state.copyWith(
//             isAudioPlaying: false,
//             showPictures: true,
//             resultMessage: 'Choose the correct images.',
//           ));
//         });
//       } else if (event == GameEvent.submitAnswer) {
//         int correctCount = state.selectedPictureIndices
//             .where((index) => correctAnswers.contains(index))
//             .length;
//         emit(state.copyWith(
//           isAudioPlaying: false,
//           resultMessage:
//               'You got $correctCount out of ${correctAnswers.length} correct!',
//           showPictures: false,
//         ));
//         if (state.remainingTrials > 0) {
//           emit(state.copyWith(
//             remainingTrials: state.remainingTrials - 1,
//             selectedPictureIndices: [],
//             isAudioPlaying: false,
//           ));
//         } else {
//           emit(state.copyWith(
//             resultMessage:
//                 'No trials left. Please retry or move to the next level.',
//             showPictures: false,
//           ));
//         }
//       } else if (event == GameEvent.nextLevel) {
//         emit(state.copyWith(
//           currentLevel: state.currentLevel + 1,
//           currentQuestion: 1,
//           remainingTrials: 3,
//           resultMessage:
//               'Congratulations! Moving to Level ${state.currentLevel + 1}',
//           showPictures: false,
//         ));
//       } else if (event == GameEvent.retryTrial) {
//         emit(state.copyWith(
//           currentLevel: 1,
//           remainingTrials: 3,
//           resultMessage: 'Trial reset. You have 3 new trials.',
//           showPictures: false,
//           selectedPictureIndices: [],
//         ));
//       }
//     });
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_one_event.dart';
part 'game_one_state.dart';

class GameOneBloc extends Bloc<GameOneEvent, GameOneState> {
  GameOneBloc() : super(GameOneInitial()) {
    on<GameOneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
