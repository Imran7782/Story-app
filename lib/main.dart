import 'package:flutter/material.dart';
import 'package:story/MainBrin.dart';

void main() {
  runApp(const Story());
}

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: App(),
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Mainbrin brain = Mainbrin();

  
 void nextStory(int choice) {
    if (brain.currentStoryIndex == 0 && choice == 1) {
      setState(() {
        brain.currentStoryIndex = 1; 
      });// Navigate to Story 1
    } else if (brain.currentStoryIndex == 0 && choice == 2) {
    setState(() {
        brain.currentStoryIndex = 2; 
    });// Navigate to Story 2
    } else if (brain.currentStoryIndex > 0) {
    setState(() {
      brain.reset();
    });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1575108921207-e6fca0c7dcf5?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Story Text
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                brain.getStory(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                 
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Choice 1 Button
          buildChoiceButton(
            text: brain.getChoice1(),
            color: Colors.red,
            onPressed: () => nextStory(1),
          ),

          // Choice 2 Button
          buildChoiceButton(
            text: brain.getChoice2(),
            color: Colors.indigo,
            onPressed: () => nextStory(2)
          ),
        ],
      ),
    );
  }

  // Helper Method for Buttons
  Widget buildChoiceButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color),
          shape: WidgetStateProperty.all(
            ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
