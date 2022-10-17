import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:formation_client/app/datasource/Api_source.dart';
import 'package:meta/meta.dart';

part 'participant_event.dart';
part 'participant_state.dart';

class ParticipantBloc extends Bloc<ParticipantEvent, ParticipantState> {
  ParticipantBloc() : super(ParticipantInitial()) {
    on<ParticipantEvent>((event, emit) {
      addParticipant(event, emit);
    });
  }

  Future<void> addParticipant(
      ParticipantAdd event, Emitter<ParticipantState> emit) async {
    try {
      emit(ParticipantInitial());
      var response = await ApiSource.getInstance.addParticipant(event.body);
      var result = await jsonDecode(response.body);
      if (result.status == 200) {
        emit(ParticipantSucces(message: result['msg']));
      } else {
        emit(ParticipantFailed());
      }
    } catch (e) {
      emit(ParticipantError());
    }
  }
}
