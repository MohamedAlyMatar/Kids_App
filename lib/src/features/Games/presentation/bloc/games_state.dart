part of 'games_bloc.dart';

abstract class GamesState extends Equatable {
  const GamesState();  

  @override
  List<Object> get props => [];
}
class GamesInitial extends GamesState {}
