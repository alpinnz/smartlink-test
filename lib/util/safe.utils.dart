class SafeUtils {
  static String enumName(String enumToString) {
    List<String> paths = enumToString.split(".");
    return paths[paths.length - 1];
  }

  static int parseInt(Map<String, dynamic> data, String key) {
    int defaultValue = -1;
    try {
      Object value = data[key];
      if (value == null) return defaultValue;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is bool) return value ? 1 : 0;
      if (value is String) {
        var temp = int.tryParse(value);
        if (temp == null) return defaultValue;
        return temp;
      }
      return defaultValue;
    } catch (error) {
      return defaultValue;
    }
  }

  static double parseDouble(Map<String, dynamic> data, String key) {
    double defaultValue = 0.0;
    try {
      Object value = data[key];
      if (value == null) return defaultValue;
      if (value is int) return value.toDouble();
      if (value is double) return value;
      if (value is bool) return value ? 1 : 0;
      if (value is String) {
        var temp = double.tryParse(value);
        if (temp == null) return defaultValue;
        return temp;
      }
      return defaultValue;
    } catch (error) {
      return defaultValue;
    }
  }

  static bool parseBool(Map<String, dynamic> data, String key) {
    bool defaultValue = false;
    try {
      Object value = data[key];
      if (value == null) return defaultValue;
      if (value is int) return value == 1 ? true : false;
      if (value is double) return value.toInt() == 1 ? true : false;
      if (value is bool) return value;
      if (value is String) {
        var temp = int.tryParse(value);
        if (temp == null) return defaultValue;
        if (temp == 1) return true;
        if (temp == 0) return false;
        if (value == 'true') return true;
        if (value == 'false') return false;
        return defaultValue;
      }
      return defaultValue;
    } catch (error) {
      return defaultValue;
    }
  }
}
