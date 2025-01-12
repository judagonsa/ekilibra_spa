import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ekilibra_spa/app/pages/questionsAnswers/Model/questions_answers_model.dart';

part 'questions_answers_state.dart';

class QuestionsAnswersCubit extends Cubit<QuestionsAnswersState> {
  QuestionsAnswersCubit()
      : super(const QuestionAnswersInitial(QuestionsAnswersModel()));
}
