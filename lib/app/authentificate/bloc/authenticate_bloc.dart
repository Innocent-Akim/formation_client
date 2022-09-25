import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formation_client/app/datasource/Api_source.dart';
import 'package:formation_client/router/mypreferences.dart';
import 'package:meta/meta.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  AuthenticateBloc() : super(AuthenticateInitial());

  @override
  Stream<AuthenticateState> mapEventToState(
    AuthenticateEvent event,
  ) async* {
    if (event is AuthenticateLogin) {
      try {
        yield AuthenticateProgress();
        var resultat = await ApiSource.getInstance.login(event.body);
        if (resultat.msg == 'succes') { 
          await MyPreferences.getInstance.setToken(token: resultat.token);
          MyPreferences.TOKEN = "Bearer ${resultat.token}";
          MyPreferences.USER_CONNECTER = resultat.contents.username;
          MyPreferences.ID_USER_CONNECTER = resultat.contents.id;
          MyPreferences.REF_ENTREPRISE = resultat.contents.refEntreprise;
          yield AuthenticateSucces(body: resultat);
        } else {
          yield AuthenticateFailed(body: resultat);
        }
      } catch (e) {
        print("${e.toString()}");
        yield AuthenticateFailed(body: e);
      }
    }
  }
}
