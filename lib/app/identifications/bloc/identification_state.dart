part of 'identification_bloc.dart';

@immutable
abstract class IdentificationState {}

class IdentificationInitial extends IdentificationState {}

class IdentificationLoading extends IdentificationState {}

class IdentificationLoaded extends IdentificationState {}

class IdentificationProgress extends IdentificationState {}

class IdentificationSucces extends IdentificationState {
  final contents;

  IdentificationSucces({this.contents});
}

class IdentificationEmpty extends IdentificationState {}

class IdentificationFailed extends IdentificationState {
  final contents;
  IdentificationFailed({this.contents});
}
