part of 'screening_bloc.dart';

@immutable
sealed class ScreeningEvent {}

class GetQuestionsA extends ScreeningEvent {}

class GetQuestionsB extends ScreeningEvent {}

class SetAnswer extends ScreeningEvent {
  final int index;
  final int answer;
  final String cat;

  SetAnswer(this.index, this.answer, this.cat);
}

class ResetAnswer extends ScreeningEvent {}

class ResetAnswerA extends ScreeningEvent {}

class ResetAnswerB extends ScreeningEvent {}
