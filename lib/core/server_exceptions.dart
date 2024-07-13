class ServerExceptions implements Exception {
  final String message;

  ServerExceptions({this.message = "Server error occured"});
}
