import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formation_client/app/datasource/Api_source.dart';
import 'package:meta/meta.dart';

part 'identification_event.dart';
part 'identification_state.dart';

class IdentificationBloc
    extends Bloc<IdentificationEvent, IdentificationState> {
  IdentificationBloc() : super(IdentificationInitial());

  @override
  Stream<IdentificationState> mapEventToState(
    IdentificationEvent event,
  ) async* {
    if (event is IdentificationSave) {
      try {
        yield IdentificationProgress();
        var response = await ApiSource.getInstance.addIdentity(event.body);
        if (response.token == "OK") {
          yield IdentificationSucces(contents: response);
        } else {
          yield IdentificationFailed(contents: response);
        }
      } catch (e) {
        yield IdentificationFailed(contents: e);
      }
    }
  }
}
