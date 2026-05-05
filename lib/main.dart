import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'story_brain.dart';

void main() {
  runApp(const CultivationAdventureApp());
}

class CultivationAdventureApp extends StatelessWidget {
  const CultivationAdventureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cultivation Adventure',
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryBrain storyBrain = StoryBrain();
  final AudioPlayer _audioPlayer = AudioPlayer();

  int _lastSceneIndex = -1;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playClickSound() async {
    await _audioPlayer.play(AssetSource('audios/nextscene.mp3'));
  }

  Future<void> playEndingSound() async {
    final ending = storyBrain.getEndingTitle();

    await _audioPlayer.stop();
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);

    if (ending.contains("Good")) {
      await _audioPlayer.play(AssetSource('audios/endingsong.mp3'));
    } else if (ending.contains("Bad")) {
      await _audioPlayer.play(AssetSource('audios/badending.mp3'));
    }
  }

  void checkEndingSound() {
    final currentIndex = storyBrain.getCurrentSceneIndex();

    if (_lastSceneIndex != currentIndex) {
      _lastSceneIndex = currentIndex;

      if (storyBrain.isGameOver()) {
        playEndingSound();
      }
    }
  }

  void handleChoice(int index) async {
    await playClickSound();

    setState(() {
      storyBrain.nextScene(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    checkEndingSound();
    final choices = storyBrain.getChoices();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 25, 18, 1),
      appBar: AppBar(
        title: const Text("Path of the Immortal"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              storyBrain.getImagePath(),
              height: 230,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            if (storyBrain.isGameOver())
              Text(
                storyBrain.getEndingTitle(),
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

            const SizedBox(height: 12),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(243, 231, 201, 0.95),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    storyBrain.getStoryText(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            if (!storyBrain.isGameOver())
              ...List.generate(
                choices.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ElevatedButton(
                    onPressed: () => handleChoice(index),
                    child: Text(choices[index]),
                  ),
                ),
              )
            else
              ElevatedButton(
                onPressed: () async {
                  await _audioPlayer.stop();
                  await _audioPlayer.release(); // frees resources (optional)

                  setState(() {
                    storyBrain.restart();
                    _lastSceneIndex = -1;
                  });
                },
                child: const Text("Restart"),
              ),
          ],
        ),
      ),
    );
  }
}
