//extensions on string

extension StringExtention on String {
  /// ls: leading string. This method
  /// add "/" in the start of string
  String get ls => '/$this';

  //toIntOrNull
  int? get toIntOrNull => int.tryParse(this);

  //toDoubleOrNull
  double? get toDoubleOrNull => double.tryParse(this);

  // formated

  //toBoolOrNull
  bool? get toBoolOrNull {
    switch (this) {
      case 'true':
        return true;
      case 'false':
        return false;
      default:
        return null;
    }
  }

  String toFirstLetterUpperCase() {
    if (isEmpty) return '';
    return this[0].toString().toUpperCase() + substring(1);
  }

  String toCapAndSpace() {
    if (isEmpty) return '';
    return this[0].toString().toUpperCase() +
        substring(1)
            .replaceAllMapped(RegExp(r'([A-Z])'), (Match m) => ' ${m[0]}');
  }

  bool get isNullOrEmpty => isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
