extension JsonExtension on Map<String, dynamic> {
  bool isValidKey(String key) => containsKey(key) && this[key] != null;

  int getInt(String key) =>
      !isValidKey(key) ? -1 : int.tryParse(this[key].toString()) ?? -1;

  num getNum(String key) =>
      !isValidKey(key) ? -1 : num.tryParse(this[key].toString()) ?? -1;

  double getDouble(String key) =>
      !isValidKey(key) ? -1 : (double.tryParse(this[key].toString()) ?? -1.0);

  String getString(String key, [String? defaultValue]) =>
      !isValidKey(key) ? defaultValue ?? '' : this[key];

  bool getBool(String key) => isValidKey(key) ? this[key] : false;
}
