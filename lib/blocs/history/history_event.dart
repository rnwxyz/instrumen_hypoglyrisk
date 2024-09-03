part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent {}

class SubmitAnswer extends HistoryEvent {
  final HistoryModel history;

  SubmitAnswer(
    this.history,
  );
}

class EditScoreB extends HistoryEvent {
  final int id;
  final int scoreB;

  EditScoreB(
    this.id,
    this.scoreB,
  );
}

class GetHistory extends HistoryEvent {}

class DeleteHistory extends HistoryEvent {
  final int id;

  DeleteHistory(
    this.id,
  );
}

class DeleteAllHistory extends HistoryEvent {}
