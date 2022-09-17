part of 'authenticate_bloc.dart';

@immutable
abstract class AuthenticateEvent {}

class AuthenticateLogin extends AuthenticateEvent {
  final body;
  AuthenticateLogin({this.body});
}
