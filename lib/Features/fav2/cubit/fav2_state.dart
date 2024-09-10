abstract class Fav2State {}

final class Fav2Initial extends Fav2State {}

final class Fav2Success extends Fav2State {}

final class Fav2Loading extends Fav2State {}

final class Fav2Failure extends Fav2State {
  final String message;
  Fav2Failure({required this.message});
}

final class Fav2Empty extends Fav2State {
  final String message;
  Fav2Empty({required this.message});
}
