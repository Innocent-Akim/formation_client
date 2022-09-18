part of 'cours_bloc.dart';

@immutable
abstract class CoursState {}

class CoursInitial extends CoursState {}

class CoursLoading extends CoursState {}

class CoursLoaded extends CoursState {}

class CoursProgress extends CoursState {}

class CoursEmpty extends CoursState {}

class CoursSucces extends CoursState {
  final  data;
  CoursSucces({this.data});
}

class CoursFailed extends CoursState {
  final ERROR;

  CoursFailed({this.ERROR});
}

class CoursError extends CoursState {}
