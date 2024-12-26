import 'package:story/brain.dart';

class Mainbrin {
  int currentStoryIndex = 0;

  final List<Storybrain> _stories = [
    Storybrain(
      'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
      'I love Elton John! Hand him the cassette tape.',
      'It\'s him or me! You take the knife and stab him.',
    ),
    Storybrain(
      'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
      'Restart',
      '',
    ),
    Storybrain(
      'As you smash through the guardrail and careen towards the jagged rocks below, you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
      'Restart',
      '',
    ),
  ];

  // Get the current story
  String getStory() {
    return _stories[currentStoryIndex].Story;
  }

  // Get the first choice text
  String getChoice1() {
    return _stories[currentStoryIndex].Choice1;
  }

  // Get the second choice text
  String getChoice2() {
    return _stories[currentStoryIndex].Choice2;
  }

  // Navigate to the next story based on the choice
 

  // Reset the story index
  void reset() {
    currentStoryIndex = 0;
  }

  getlength(){
    return _stories.length;
  }
}
