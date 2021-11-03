import 'package:flutter/material.dart';

import '../Models/story.dart';
import '../Store/data.dart';

class StoryProvider extends ChangeNotifier{
  List<Story> _stories = Data.dataStories;

  int get storySize => _stories.length;
  List<Story> get stories => _stories;

  void addStory(Story story){
    _stories.insert(0, story);
    notifyListeners();
  }
}