import '../models/puzzle_model.dart';

List<PuzzleModel> puzzleListSound = [
  PuzzleModel(
      "What animal is this ?",
      {
        "Dog": true,
        "Cat": false,
        "Fish": false,
        "Camel": false,
      },
      "dog_barking.mp3",
      "image"),
  PuzzleModel(
      "What sound is this ?",
      {
        "Cat": false,
        "Fish": false,
        "Bird": true,
        "Dog": false,
      },
      "birds_chirping.mp3",
      "image"),
  PuzzleModel(
      "What Animal is this ?",
      {
        "Cat": true,
        "Fish": false,
        "Bird": false,
        "Dog": false,
      },
      "cat_meow.mp3",
      "image"),

  // PuzzleModel(
  //     "What is this fruit",
  //     {
  //       "Banana": true,
  //       "Coconut": false,
  //       "Pineapple": false,
  //       "Apple": false,
  //     },
  //     "assets/images/banana.jpg",
  //     "image"),
  // QuizModel("votre vous etes deja fait anarque ?", {
  //   "oui": true,
  //   "non": false,
  // }),
];
