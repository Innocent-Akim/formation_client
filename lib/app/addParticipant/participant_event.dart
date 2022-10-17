part of 'participant_bloc.dart';

@immutable
abstract class ParticipantEvent {}

class ParticipantAdd extends ParticipantEvent {
  final body;
  ParticipantAdd({this.body});
}
