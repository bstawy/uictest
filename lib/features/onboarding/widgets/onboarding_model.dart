class OnboardingModel {
  final String title;
  final String descriptionTitle;
  final String descriptionBody;
  final String imagePath;
  final int currentStep;

  OnboardingModel({
    required this.title,
    required this.descriptionTitle,
    required this.descriptionBody,
    required this.imagePath,
    required this.currentStep,
  });
}
