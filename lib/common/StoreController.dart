import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zib/common/Sp.dart';
import 'package:zib/main.dart';
//保存一些用户信息，网络请求
class StoreController extends GetxController {
  String _token = '';
  String _clientid = '';

  Map<String, dynamic>? _user;

  String path = 'http://localhost:8080/';
  late Dio _dio;

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(BaseOptions(
      baseUrl: path,
    ));
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          // 在请求前添加验证字段
          options.headers['Authorization'] = 'Bearer $_token';
          options.headers['clientid'] = _clientid;
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // 在响应拦截器中处理响应数据
          if (response.statusCode == 401 || response.data['code'] == 401) {
            Get.toNamed('/login');
          }
          logger.i('Response: $response');
          // 继续传递响应数据，使其继续后续的处理
          return handler.next(response);
        },
        // onError: (DioException error, ErrorInterceptorHandler handler) {
      //   logger.e(error);
      // }
    ));
  }

  get user {
    try {
      _user ??= SP.getMap('userInfo').cast<String, dynamic>();
    } catch (e) {
      Get.toNamed('login');
    }
    return _user;
  }

  set user(value) {
    SP.setMap('userInfo', value);
    _user = value;
  }

  get dio => _dio;

  set dio(value) {
    _dio = value;
  }

  String get clientid => _clientid;

  set clientid(String value) {
    _clientid = value;
    SP.setString('clientid', value);
  }

  String get token => _token;

  set token(String value) {
    SP.setString('token', value);
    _token = value;
  }
}
