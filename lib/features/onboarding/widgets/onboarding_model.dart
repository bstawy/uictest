class OnboardingModel {
  final int id;
  final String titleLocaleKey;
  final String descriptionTitleLocaleKey;
  final String descriptionBodyLocaleKey;
  final String imagePath;
  final String darkImagePath;
  final int currentStep;

  OnboardingModel({
    required this.id,
    required this.titleLocaleKey,
    required this.descriptionTitleLocaleKey,
    required this.descriptionBodyLocaleKey,
    required this.imagePath,
    required this.darkImagePath,
    required this.currentStep,
  });
}
