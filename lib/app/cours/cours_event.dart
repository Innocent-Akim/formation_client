part of 'cours_bloc.dart';

@immutable
abstract class CoursEvent {}

class CoursFind extends CoursEvent {}



class CoursFindOne extends CoursEvent {
  final id;
  CoursFindOne({this.id});
}
