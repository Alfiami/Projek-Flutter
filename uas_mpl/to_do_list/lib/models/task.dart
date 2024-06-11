class Task {
  String name;
  bool isDone;
  bool isFavorite;

  Task({required this.name, this.isDone = false, this.isFavorite = false});

  void toggleDone() {
    isDone = !isDone;
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
