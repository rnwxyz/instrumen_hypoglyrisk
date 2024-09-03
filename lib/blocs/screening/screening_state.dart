part of 'screening_bloc.dart';

@immutable
sealed class ScreeningState {}

final class ScreeningInitial extends ScreeningState {}

class InitialState extends ScreeningState {
  final List<QuestionModel> questionA;
  final List<QuestionModel> questionB;

  InitialState(this.questionA, this.questionB);
}

class LoadedA extends ScreeningState {
  final List<QuestionModel> questionA;

  LoadedA(this.questionA);
}

class LoadedB extends ScreeningState {
  final List<QuestionModel> questionB;

  LoadedB(this.questionB);
}

class Loading extends ScreeningState {}

class Error extends ScreeningState {
  final String message;

  Error(this.message);
}
