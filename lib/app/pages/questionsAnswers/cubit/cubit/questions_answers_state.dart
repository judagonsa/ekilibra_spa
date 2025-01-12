part of 'questions_answers_cubit.dart';

class QuestionsAnswersState {
  final QuestionsAnswersModel? data;

  const QuestionsAnswersState(this.data);
}

final class QuestionAnswersInitial extends QuestionsAnswersState {
  const QuestionAnswersInitial(super.data);
}

final class CreateQuestionAnswers extends QuestionsAnswersState {
  const CreateQuestionAnswers(super.data);
}

final class ErrorSaveQuestionAnswers extends QuestionsAnswersState {
  const ErrorSaveQuestionAnswers(super.data, this.error);

  final String error;
}

final class GetQuestionAnswers extends QuestionsAnswersState {
  const GetQuestionAnswers(super.data);
}
