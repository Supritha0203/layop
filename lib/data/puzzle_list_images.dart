import '../models/puzzle_model.dart';

List<PuzzleModel> puzzleListImage = [
  PuzzleModel(
      "What is this animal ?",
      {
        "Dog": true,
        "Cat": false,
        "Fish": false,
        "Camel": false,
      },
      "assets/images/dog.jpg",
      "image"),
  PuzzleModel(
      "What is this vehicle?",
      {
        "Car": false,
        "Truck": true,
        "Motorcycle": false,
        "Bicycle": false,
      },
      "assets/images/lorry.jpeg",
      "image"),
  PuzzleModel(
      "What is this shape ?",
      {
        "Square": false,
        "Triangle": false,
        "Regtangle": false,
        "Circle": true,
      },
      "assets/images/circle.png",
      "image"),
  PuzzleModel(
      "What is this fruit",
      {
        "Banana": true,
        "Coconut": false,
        "Pineapple": false,
        "Apple": false,
      },
      "assets/images/banana.jpg",
      "image"),
  // QuizModel("votre vous etes deja fait anarque ?", {
  //   "oui": true,
  //   "non": false,
  // }),
];
