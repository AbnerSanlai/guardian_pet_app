abstract class RestClientErro {
  String getMessage();
}

class DioErrorWrapper implements RestClientErro {
  final String dioError;

  DioErrorWrapper(this.dioError);

  @override
  String getMessage() {
    return dioError.toString();
  }
}
