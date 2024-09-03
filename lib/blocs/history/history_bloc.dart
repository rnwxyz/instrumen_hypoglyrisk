import 'package:bloc/bloc.dart';
import 'package:instrumen_hypoglyrisk/models/history_model.dart';
import 'package:instrumen_hypoglyrisk/repositories/history_repository.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    final HistoryRepository historyRepository = HistoryRepository();

    on<SubmitAnswer>(
      (event, emit) async {
        try {
          emit(LoadingHistory());
          final id = await historyRepository.insert(event.history);
          final history = await historyRepository.getById(id);
          emit(Success(history));
        } catch (e) {
          emit(ErrorHistory(e.toString()));
        }
      },
    );

    on<EditScoreB>(
      (event, emit) async {
        try {
          emit(LoadingHistory());
          final history = await historyRepository.getById(event.id);
          history.scoreB = event.scoreB;
          await historyRepository.update(history);
          emit(Success(history));
        } catch (e) {
          emit(ErrorHistory(e.toString()));
        }
      },
    );

    on<GetHistory>(
      (event, emit) async {
        try {
          emit(LoadingHistory());
          final histories = await historyRepository.get();
          emit(SuccessGetAll(histories));
        } catch (e) {
          emit(ErrorHistory(e.toString()));
        }
      },
    );

    on<DeleteHistory>(
      (event, emit) async {
        try {
          emit(LoadingHistory());
          await historyRepository.delete(event.id);
          final histories = await historyRepository.get();
          emit(SuccessGetAll(histories));
        } catch (e) {
          emit(ErrorHistory(e.toString()));
        }
      },
    );
  }
}
