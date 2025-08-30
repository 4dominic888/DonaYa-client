import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  void setPage(int index) {
    final page = OnboardingPage.values[index];
    emit(
      state.copyWith(currentPage: index, page: page)
    );
  }
}
