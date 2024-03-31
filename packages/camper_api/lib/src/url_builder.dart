class UrlBuilder {
  final String _baseUrl;
  UrlBuilder({String? baseUrl})
      : _baseUrl = baseUrl ?? 'http://192.168.105.1:5000';
  String builldLoginUrl() => '$_baseUrl/api/v1/auth/login';
  String builldLogoutUrl() => '$_baseUrl/logout';
  String buildRegisterUrl() => '$_baseUrl/register';
  String buildForgotPasswordUrl() => '$_baseUrl/forgot-password';
  String buildResetPasswordUrl() => '$_baseUrl/reset-password';
  String buildProfileUrl() => '$_baseUrl/api/v1/auth/me';
  String buildUpdateProfileUrl() => '$_baseUrl/update-profile';
  String buildChangePasswordUrl() => '$_baseUrl/change-password';
  String buildDeleteAccountUrl() => '$_baseUrl/delete-account';
  String buildBootcampListUrl() => '$_baseUrl/api/v1/bootcamps';
}
