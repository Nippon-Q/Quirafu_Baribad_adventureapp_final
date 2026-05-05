import 'package:flutter/material.dart';
import 'story_brain.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryBrain storyBrain = StoryBrain();

  void chooseOption(int index) {
    setState(() {
      storyBrain.nextScene(index);
    });

    //  SHOW END SCREEN
    if (storyBrain.isGameOver()) {
      Future.delayed(Duration.zero, showEndingDialog);
    }
  }

  void showEndingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text(storyBrain.getEndingTitle()),
          content: Text(storyBrain.getStoryText()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  storyBrain.restart();
                });
              },
              child: const Text("Restart"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final choices = storyBrain.getChoices();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Path to Immortality"),
        backgroundColor: const Color(0xFF1B140A),
      ),
      backgroundColor: const Color(0xFF1B140A),
      body: SafeArea(
        child: Column(
          children: [
            //  IMAGE
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: const Color.fromRGBO(243, 231, 201, 0.95),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      storyBrain.getImagePath(),
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            //  STORY TEXT
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: const Color.fromRGBO(243, 231, 201, 0.95),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        storyBrain.getStoryText(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.4,
                          color: Color(0xFF2F1E12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //  CHOICES
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: choices.asMap().entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => chooseOption(entry.key),
                          child: Text(entry.value),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
