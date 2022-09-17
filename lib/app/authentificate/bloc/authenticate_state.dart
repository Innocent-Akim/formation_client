part of 'authenticate_bloc.dart';

@immutable
abstract class AuthenticateState {}

class AuthenticateInitial extends AuthenticateState {}

class AuthenticateLoading extends AuthenticateState {}

class AuthenticateLoaded extends AuthenticateState {}

class AuthenticateProgress extends AuthenticateState {}

class AuthenticateSucces extends AuthenticateState {
  final body;
  AuthenticateSucces({this.body});
}

class AuthenticateFailed extends AuthenticateState {
  final body;
  AuthenticateFailed({this.body});
}
