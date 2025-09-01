import 'package:equatable/equatable.dart';

enum OnboardingPage { welcome, summary, information }

class OnboardingState extends Equatable {
  final int currentPage;
  final OnboardingPage page;

  const OnboardingState({
    this.currentPage = 0,
    this.page = OnboardingPage.welcome,
  });

  OnboardingState copyWith({
    int? currentPage,
    OnboardingPage? page,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [currentPage, page];
}