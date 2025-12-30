class ResponseUtils {
  final dynamic data;
  ResponseUtils({this.data});

  T? getTypedData<T>(T? Function(Map? map) creator) {
    var map = data as Map<String, dynamic>?;
    if (map == null) {
      return null;
    }
    return creator(map);
  }

  List<T>? getTypedList<T>(T? Function(Map? map) creator) {
    List? list = data as List?;
    return toList(list, creator);
  }

  static List<T>? toList<T>(List? mapList, T? Function(Map? map) creator) {
    if (mapList == null) {
      return null;
    }
    List<T> ret = [];
    for (var m in mapList) {
      if (m == null) continue;
      var t = creator(m);
      if (t != null) {
        ret.add(t);
      }
    }
    return ret;
  }

  static int? toInt(dynamic data) {
    try {
      if (data == null) return null;
      if (data.runtimeType == int) return data;
      if (data.runtimeType == double) return (data as double).toInt();
      if (data.runtimeType == String) {
        String? string = (data as String?)?.trim();
        if (string == null || string.isEmpty) return null;
        return int.tryParse(string);
      }
    } catch (e, s) {
      print(e);
    }

    return null;
  }
}