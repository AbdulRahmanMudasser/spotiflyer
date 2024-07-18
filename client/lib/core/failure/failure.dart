class Failure {
  final String failure;

  Failure([this.failure = "An Unexpected Error Occurred"]);

  @override
  String toString() {
    return "failure: $failure";
  }
}