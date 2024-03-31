import 'package:camper_api/src/models/models.dart';
import 'package:camper_api/src/models/response/bootcamp_list.dart';
import 'package:camper_api/src/url_builder.dart';
import 'package:dio/dio.dart';

class CamperApi {
  final Dio _dio;
  final UrlBuilder _urlBuilder;
  final Future<String?> Function() getToken;

  CamperApi({
    Dio? dio,
    UrlBuilder? urlBuilder,
    required this.getToken,
  })  : _urlBuilder = urlBuilder ?? UrlBuilder(),
        _dio = dio ?? Dio() {
    _dio.interceptors.add(LogInterceptor());
    _dio.addAuthInterceptor(getToken: getToken);
  }

  Future<String> signUp(
    String name,
    String email,
    String password,
  ) async {
    final url = _urlBuilder.buildRegisterUrl();
    final requestData = SignUpRM(
      name: name,
      email: email,
      password: password,
    ).toJson();
    final response = await _dio.post(url, data: requestData);
    if (response.statusCode == 200) {
      return response.data['token'];
    } else {
      throw Exception('Failed to sign up');
    }
  }

  Future<String> login(String email, String password) async {
    final url = _urlBuilder.builldLoginUrl();
    final requestData = SignInRM(email: email, password: password).toJson();
    final response = await _dio.post(url, data: requestData);
    if (response.statusCode == 200) {
      return response.data['token'];
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<UserRM> getProfile() async {
    final url = _urlBuilder.buildProfileUrl();
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return UserRM.fromJson(response.data?['data']);
    } else {
      throw Exception('Failed to get profile');
    }
  }

  Future<BootcampList> getBootcamps() async {
    final url = _urlBuilder.buildBootcampListUrl();
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return BootcampList.fromJson(response.data);
    } else {
      throw Exception('Failed to get bootcamps');
    }
  }
}

extension on Dio {
  void addAuthInterceptor({
    required Future<String?> Function() getToken,
  }) {
    interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await getToken();
        if (token != null) {
          options.headers.addAll({
            'Authorization': 'Bearer $token',
          });
        }
        return handler.next(options);
      },
    ));
  }
}
