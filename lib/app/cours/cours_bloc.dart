import 'package:bloc/bloc.dart';
import 'package:formation_client/app/datasource/Api_source.dart';
import 'package:meta/meta.dart';
part 'cours_event.dart';
part 'cours_state.dart';

class CoursBloc extends Bloc<CoursEvent, CoursState> {
  CoursBloc() : super(CoursInitial());
  @override
  Stream<CoursState> mapEventToState(
    CoursEvent event,
  ) async* {
    if (event is CoursFind) {
      try {
        yield CoursProgress();
        var resultat = await ApiSource.getInstance.findCours();
        if (resultat.contents.length > 0) {
          yield CoursSucces(data: resultat);
        } else {
          yield CoursEmpty();
        }
      } catch (e) {
        print("${e.toString()}");
        yield CoursFailed(ERROR: e);
      }
    }
  }
}
