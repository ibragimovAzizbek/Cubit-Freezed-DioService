import 'package:dio/dio.dart';
import 'package:servicediowithcubit/core/config/dio_config.dart';

class GetUserService {
  static final GetUserService _inherentce = GetUserService._init();

  static GetUserService get inherentce => _inherentce;

  GetUserService._init();

  Future<dynamic> getUser() async {
    try {
      Response res = await DioConfig.inherentce
          .createRequest()
          .get('https://jsonplaceholder.typicode.com/users');
      if (res.statusCode == 200) {
        return res;
      } else {
        return "${res.statusMessage} ${res.statusCode}";
      }
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
          return "Connect Time Out.";

        case DioErrorType.receiveTimeout:
          return "Receive Time Out";

        case DioErrorType.sendTimeout:
          return "Send Time Out";

        case DioErrorType.other:
          return "Internet connection error";

        default:
          return "Unknown error in dio";
      }
    }
  }
}
