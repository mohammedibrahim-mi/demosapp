
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AppLoggers extends Interceptor{

  final int maxCharacters = 5000;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    String responseAsString = response.data.toString();
    if (responseAsString.length > maxCharacters) {
      int iterations =
      (responseAsString.length / maxCharacters).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharacters + maxCharacters;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        Logger(printer: PrettyPrinter(colors: true, noBoxingByDefault: true)).i(responseAsString.substring(i * maxCharacters, endingIndex));
      }
    } else {
      Logger(printer: PrettyPrinter(colors: true, noBoxingByDefault: true)).i(response.data.toString());
    }
    super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    Logger(printer: PrettyPrinter(colors: true, noBoxingByDefault: true)).w('${options.baseUrl} ${options.path}');
    Logger(printer: PrettyPrinter(colors: true, noBoxingByDefault: true)).w('${options.headers}');
    Logger(printer: PrettyPrinter(colors: true, noBoxingByDefault: true)).w(options.method);
    Logger(printer: PrettyPrinter(colors: true, noBoxingByDefault: true)).w('${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    Logger(printer: PrettyPrinter(colors: true, noBoxingByDefault: true)).e(err.error);
    Logger(printer: PrettyPrinter(colors: true, noBoxingByDefault: true)).e(err.message);
    super.onError(err, handler);
  }
}