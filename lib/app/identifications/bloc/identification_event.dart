part of 'identification_bloc.dart';

@immutable
abstract class IdentificationEvent {}

class IdentificationSave extends IdentificationEvent {
  final body;

  IdentificationSave({this.body});
}
