import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'description_event.dart';
part 'description_state.dart';

class DescriptionBloc extends Bloc<DescriptionEvent, DescriptionState> {
  DescriptionBloc() : super(DescriptionInitial()) {
    on<DescriptionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
