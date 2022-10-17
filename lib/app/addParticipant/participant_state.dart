part of 'participant_bloc.dart';

@immutable
abstract class ParticipantState {}

class ParticipantInitial extends ParticipantState {}

class ParticipantLoading extends ParticipantState {}

class ParticipantLoaded extends ParticipantState {}

class ParticipantSucces extends ParticipantState {
  final message;
  ParticipantSucces({this.message});
  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [message];
}

class ParticipantError extends ParticipantState {}

class ParticipantFailed extends ParticipantState {}

class ParticipantExist extends ParticipantState {}
