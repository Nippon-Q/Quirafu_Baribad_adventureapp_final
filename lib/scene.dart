class Scene {
  final String storyText;
  final List<String> choices;
  final List<int> nextScenes;
  final String imagePath;
  final String? endingTitle;
  final bool playSound;

  Scene({
    required this.storyText,
    required this.choices,
    required this.nextScenes,
    required this.imagePath,
    this.endingTitle,
    this.playSound = false,
  });

  bool get isEnding => choices.isEmpty;
}
