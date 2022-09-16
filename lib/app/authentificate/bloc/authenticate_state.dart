part of 'authenticate_bloc.dart';

@immutable
abstract class AuthenticateState {}

class AuthenticateInitial extends AuthenticateState {}

class AuthenticateLoading extends AuthenticateState {}

class AuthenticateLoaded extends AuthenticateState {}

class AuthenticateProgress extends AuthenticateState {}

class AuthenticateSucces extends AuthenticateState {}

class AuthenticateFailed extends AuthenticateState {
  
}
