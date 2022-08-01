part of '../utils.imports.dart';

class JsonParser<T> {
  loadJsonData(
      {required String filePath,
      required ReturnType returnType,
      required Function(Map<String, dynamic> data) fromJsonFunc,
      Function(dynamic data)? dataKeyFun}) {
    try {
      final file = File(filePath);
      final json = jsonDecode(file.readAsStringSync());
      return _returnDataFromType(json, returnType, fromJsonFunc, dataKeyFun ?? (data) => data);
    } catch (e) {
      rethrow;
    }
  }

  dynamic _returnDataFromType(
    dynamic data,
    ReturnType returnType,
    Function(Map<String, dynamic> data) fromJsonFunc,
    Function(dynamic data)? dataKeyFun,
  ) {
    switch (returnType) {
      case ReturnType.Type:
        return dataKeyFun == null ? data : Function.apply(dataKeyFun, [data]);
      case ReturnType.Model:
        return Function.apply(fromJsonFunc, [
          dataKeyFun == null ? data : Function.apply(dataKeyFun, [data])
        ]);

      case ReturnType.List:
        return List<T>.from(
          dataKeyFun == null
              ? data
              : Function.apply(dataKeyFun, [data]).map(
                  (e) => Function.apply(fromJsonFunc, [e]),
                ),
        );
    }
  }
}
