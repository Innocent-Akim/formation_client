import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:formation_client/app/datasource/Api_source.dart';
import 'package:meta/meta.dart';

part 'participant_event.dart';
part 'participant_state.dart';

class ParticipantBloc extends Bloc<ParticipantEvent, ParticipantState> {
  ParticipantBloc() : super(ParticipantInitial()) {
    on<ParticipantAdd>(addParticipant);
  }

  Future<void> addParticipant(
      ParticipantAdd event, Emitter<ParticipantState> emit) async {
    try {
      emit(ParticipantInitial());
      var response = await ApiSource.getInstance.addParticipant(event.body);
      var result = await jsonDecode(response.body);
      print(result['msg']);
      if (result['token'] == "OK") {
        emit(ParticipantSucces(message: result['msg']));
      } else {
        emit(ParticipantFailed());
      }
    } catch (e) {
      emit(ParticipantError());
    }
  }
}
