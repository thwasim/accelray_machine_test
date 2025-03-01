import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());

  int index = 0;

  updateIndex(int currentIndex) {
    index = currentIndex + 1;
    emit(QuestionsInitial());
  }
}
