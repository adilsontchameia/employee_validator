class InvalidToken implements Exception {}

class NotFound implements Exception {
  final String? message;

  NotFound({this.message});
}
