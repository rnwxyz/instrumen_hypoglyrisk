part of 'history_bloc.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

class LoadingHistory extends HistoryState {}

class ErrorHistory extends HistoryState {
  final String message;

  ErrorHistory(this.message);
}

final class Success extends HistoryState {
  final HistoryModel history;

  Success(this.history);
}

final class SuccessGetAll extends HistoryState {
  final List<HistoryModel> histories;

  SuccessGetAll(this.histories);
}

final class SuccessDelete extends HistoryState {}
