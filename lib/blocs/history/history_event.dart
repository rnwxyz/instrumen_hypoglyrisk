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
  final int scoreB1;
  final int scoreB2;
  final int scoreB3;
  final int scoreB4;
  final int scoreB5;
  final int scoreB6;
  final int scoreB7;
  final int scoreB8;

  EditScoreB(
    this.id,
    this.scoreB,
    this.scoreB1,
    this.scoreB2,
    this.scoreB3,
    this.scoreB4,
    this.scoreB5,
    this.scoreB6,
    this.scoreB7,
    this.scoreB8,
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

class ExportHistory extends HistoryEvent {}
