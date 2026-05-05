import 'scene.dart';

class StoryBrain {
  int _currentScene = 0;
  int getCurrentSceneIndex() => _currentScene;

  bool _helpedElder = false;
  bool _askedElderIdentity = false;
  bool _observedSect = false;
  bool _searchedSpiritMine = false;

  final List<Scene> _scenes = [
    Scene(
      storyText:
          "Mist rolls over the Testing Grounds as young disciples gather in silence. At the center stands an ancient stone platform covered in glowing runes. Today, your spiritual element will finally be revealed.",
      choices: ["Step onto the platform", "Look around first"],
      nextScenes: [1, 1],
      imagePath: "assets/images/testing_ground.png",
    ),
    Scene(
      storyText:
          "The closer you get, the heavier the air becomes. Some disciples whisper behind you, while the elders watch with unreadable expressions. Something about this test feels different.",
      choices: ["Place your hand on the tablet", "Take a deep breath"],
      nextScenes: [2, 2],
      imagePath: "assets/images/testing_ground.png",
    ),
    Scene(
      storyText:
          "The tablet erupts with light. Your origin and element awaken violently, sending spiritual energy through your body like a storm. The elders step back in shock.",
      choices: ["Accept your fate", "Question your fate"],
      nextScenes: [3, 3],
      imagePath: "assets/images/element_reveal.png",
    ),
    Scene(
      storyText:
          "The elders exchange quiet words. You only catch fragments: rare, unstable, dangerous, potential. From this moment on, you are no longer an ordinary youth.",
      choices: ["Ignore their whispers", "Listen carefully"],
      nextScenes: [4, 4],
      imagePath: "assets/images/element_reveal.png",
    ),
    Scene(
      storyText:
          "That night, sleep refuses to come. Your awakened energy stirs inside you, restless and unfamiliar. Tomorrow, you must leave home and walk the path of cultivation.",
      choices: ["Embrace the future", "Fear what lies ahead"],
      nextScenes: [5, 5],
      imagePath: "assets/images/farewell.png",
    ),
    Scene(
      storyText:
          "Before sunrise, you bid goodbye to your family. Their words are few, but their eyes say enough. Many who chase immortality never return, yet your heart refuses to turn back.",
      choices: ["Leave peacefully", "Leave silently"],
      nextScenes: [6, 6],
      imagePath: "assets/images/farewell.png",
    ),
    Scene(
      storyText:
          "On a lonely forest road, you hear blades clash. A wounded elder shields a terrified child while two rogue cultivators close in. You are weak, but doing nothing feels wrong.",
      choices: ["Help the elder", "Run away"],
      nextScenes: [7, 9],
      imagePath: "assets/images/elder_attack.png",
    ),
    Scene(
      storyText:
          "You rush forward with trembling hands and a reckless heart. Your attack barely pushes the rogues back, but it buys enough time for the elder to recover.",
      choices: ["Keep fighting", "Protect the child"],
      nextScenes: [8, 8],
      imagePath: "assets/images/elder_saved.png",
    ),
    Scene(
      storyText:
          "After the battle, the elder studies you closely. 'You stepped into danger despite knowing you might die. Tell me, child, why?'",
      choices: ["Because it was right", "Ask who they are"],
      nextScenes: [12, 12],
      imagePath: "assets/images/elder_saved.png",
    ),
    Scene(
      storyText:
          "You run until your lungs burn. You survive, but the child's frightened face follows you even in silence. The path of cultivation has already tested your heart.",
      choices: ["Continue your journey", "Rest at a tavern"],
      nextScenes: [10, 13],
      imagePath: "assets/images/run_away.png",
    ),
    Scene(
      storyText:
          "Near a small village, you meet an old sectless cultivator teaching children about elemental advantage. His robes are torn, but his wisdom feels genuine.",
      choices: ["Ask about nearby sects", "Quietly pass by"],
      nextScenes: [11, 13],
      imagePath: "assets/images/old_cultivator.png",
    ),
    Scene(
      storyText:
          "You are offered entry into an ordinary sect nearby. It lacks glory and powerful treasures, but it offers safety, training, and a place to begin.",
      choices: ["Join the sect", "Keep wandering"],
      nextScenes: [14, 13],
      imagePath: "assets/images/random_sect.png",
    ),
    Scene(
      storyText:
          "The elder reveals his origin: the Chaos Sect . Its disciples are feared, respected, and often misunderstood. Still, they offer you a place among them.",
      choices: ["Enter the Chaotic Sect", "Refuse the offer"],
      nextScenes: [14, 11],
      imagePath: "assets/images/chaotic_sect.png",
    ),
    Scene(
      storyText:
          "You stay in a tavern and avoid every risk. Years pass quietly. You live peacefully, but your dream of immortality fades into regret.",
      choices: [],
      nextScenes: [],
      imagePath: "assets/images/tavern.png",
      endingTitle: "Bad Ending: The Coward's Peace",
    ),
    Scene(
      storyText:
          "Sect life begins. Disciples train from dawn until night, and every courtyard echoes with clashing weapons and spiritual techniques. Here, weakness is quickly noticed.",
      choices: ["Train immediately", "Observe others first"],
      nextScenes: [15, 15],
      imagePath: "assets/images/sect_life.png",
    ),
    Scene(
      storyText:
          "Days become weeks. Your body aches, your meridians burn, and your pride is crushed more than once. But slowly, your spiritual energy begins to obey you.",
      choices: ["Challenge a senior disciple", "Focus on fundamentals"],
      nextScenes: [16, 16],
      imagePath: "assets/images/sect_life.png",
    ),
    Scene(
      storyText:
          "Soon, you face a serious problem: you are out of spirit crystals. Without them, your cultivation will slow. Then the mission board opens, offering rewards to disciples willing to risk their lives.",
      choices: ["Accept a sect mission", "Avoid the danger"],
      nextScenes: [17, 13],
      imagePath: "assets/images/sect_life.png",
    ),
    Scene(
      storyText:
          "Your first real mission sends you beyond the sect walls. A nearby forest has been overrun by spirit beasts, and outer disciples are ordered to clear the path for merchants.",
      choices: ["Travel with the group", "Scout ahead alone"],
      nextScenes: [18, 18],
      imagePath: "assets/images/sect_mission.png",
    ),
    Scene(
      storyText:
          "The forest is thick with hostile energy. Spirit beasts move between the trees, their eyes glowing in the dark. This is no training ground. Every mistake here can cost a life.",
      choices: ["Fight carefully", "Take risks for more rewards"],
      nextScenes: [19, 19],
      imagePath: "assets/images/spirit_forest.png",
    ),
    Scene(
      storyText:
          "While gathering resources, you encounter disciples from a rival sect. Their robes are marked with silver flame patterns, and their leader smiles as if your group has already lost.",
      choices: ["Stand your ground", "Avoid conflict"],
      nextScenes: [20, 20],
      imagePath: "assets/images/rival_sect.png",
    ),
    Scene(
      storyText:
          "The encounter leaves tension in the air. Whether by pride or caution, both sides now remember each other. What started as a simple mission may have sparked a larger conflict.",
      choices: ["Report back to the sect", "Keep investigating alone"],
      nextScenes: [21, 22],
      imagePath: "assets/images/sect_tension.png",
    ),
    Scene(
      storyText:
          "Back at the sect, news of the rival disciples spreads quickly. To regain face and gather resources, the elders announce a tournament. Victory will earn spirit crystals and recognition.",
      choices: ["Join the tournament", "Ignore the rumors"],
      nextScenes: [23, 24],
      imagePath: "assets/images/tournament.png",
    ),
    Scene(
      storyText:
          "You follow the trail deeper into the mountains and discover a hidden spirit mine beneath a broken cliff. The crystals pulse with power, but something darker also sleeps below the stone.",
      choices: ["Return to the sect", "Continue alone"],
      nextScenes: [23, 24],
      imagePath: "assets/images/spirit_mine.png",
    ),
    Scene(
      storyText:
          "As the tournament draws all eyes, unseen hands move in the dark. Demonic path cultivators sow discord across the martial world, manipulating sects into conflict. By the time anyone realizes the truth, blood has already been spilled—and war can no longer be avoided.",
      choices: ["Stand your ground", "Second guess your resolve"],
      nextScenes: [26, 24],
      imagePath: "assets/images/sect_war.png",
    ),
    Scene(
      storyText:
          "You survive, but avoid the greatest battle. Free from sect duties, you wander the world alone. Your name is forgotten, but your path remains your own.",
      choices: [],
      nextScenes: [],
      imagePath: "assets/images/wanderer.png",
      endingTitle: "Neutral Ending: Wandering Immortal",
    ),
    Scene(
      storyText:
          "Deep inside the mine, you follow the strange dark aura. Behind ancient chains, you discover a forbidden inheritance left behind by a forgotten demonic immortal.",
      choices: ["Accept the inheritance", "Seal the chamber"],
      nextScenes: [27, 23],
      imagePath: "assets/images/spirit_mine.png",
    ),
    Scene(
      storyText:
          "The Demonic Cult and rival sect attack together, but you stand with your sect. Through blood, fire, and fear, you protect those who once protected you. By dawn, your name becomes legend.",
      choices: [],
      nextScenes: [],
      imagePath: "assets/images/sect_war.png",
      endingTitle: "Good Ending: Guardian of the Sect",
    ),
    Scene(
      storyText:
          "You accept the forbidden inheritance. Darkness floods your meridians, but instead of consuming you, it bows. You vanish from the world, reborn as the heir of a forbidden Dao.",
      choices: [],
      nextScenes: [],
      imagePath: "assets/images/spirit_mine.png",
      endingTitle: "Secret Ending: Heir of the Forbidden Dao",
    ),
  ];

  String getStoryText() => _scenes[_currentScene].storyText;

  List<String> getChoices() {
    final scene = _scenes[_currentScene];

    if (_currentScene == 22 &&
        _helpedElder &&
        _askedElderIdentity &&
        _observedSect &&
        _searchedSpiritMine) {
      return [...scene.choices, "Follow the strange dark aura"];
    }

    return scene.choices;
  }

  String getImagePath() => _scenes[_currentScene].imagePath;

  bool isGameOver() => _scenes[_currentScene].isEnding;

  String getEndingTitle() => _scenes[_currentScene].endingTitle ?? "Ending";

  void nextScene(int choiceIndex) {
    if (isGameOver()) return;

    if (_currentScene == 6 && choiceIndex == 0) {
      _helpedElder = true;
    }

    if (_currentScene == 8 && choiceIndex == 1) {
      _askedElderIdentity = true;
    }

    if (_currentScene == 14 && choiceIndex == 1) {
      _observedSect = true;
    }

    if (_currentScene == 20 && choiceIndex == 1) {
      _searchedSpiritMine = true;
    }

    if (_currentScene == 22 &&
        choiceIndex == 2 &&
        _helpedElder &&
        _askedElderIdentity &&
        _observedSect &&
        _searchedSpiritMine) {
      _currentScene = 25;
      return;
    }

    _currentScene = _scenes[_currentScene].nextScenes[choiceIndex];
  }

  void restart() {
    _currentScene = 0;
    _helpedElder = false;
    _askedElderIdentity = false;
    _observedSect = false;
    _searchedSpiritMine = false;
  }
}
