extension IntExtension on int {
  bool get isOk => this >= 200 && this < 300;

  bool get isUnauthorized => this == 400 || this == 401;
}
