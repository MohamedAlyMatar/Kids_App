import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'familiarize_event.dart';
part 'familiarize_state.dart';

class FamiliarizeBloc extends Bloc<FamiliarizeEvent, FamiliarizeState> {
  FamiliarizeBloc() : super(FamiliarizeInitial()) {
    on<FamiliarizeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
