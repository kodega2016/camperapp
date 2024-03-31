import 'package:camper_api/camper_api.dart';
import 'package:domain_models/domain_models.dart';
import 'package:rxdart/subjects.dart';
import 'package:user_repository/src/mappers/remote_to_domain.dart';
import 'package:user_repository/src/user_secure_storage.dart';

class UserRepository {
  final UserSecureStorage _userSecureStorage;
  final CamperApi camperApi;

  UserRepository({
    required this.camperApi,
    UserSecureStorage? userSecureStorage,
  }) : _userSecureStorage = userSecureStorage ?? UserSecureStorage();

  final BehaviorSubject<User?> _userSubject = BehaviorSubject<User?>();
  User? get user => _userSubject.value;
  Stream<User?> get userStream => _userSubject.stream;

  Future<void> signUp(String name, String email, String password) async {
    final token = await camperApi.signUp(name, email, password);
    await _userSecureStorage.upsertUser(name: name, email: email, token: token);
    final user = await getProfile();
    _userSecureStorage.upsertUser(email: user.email,token: token,name: user.name);
    _userSubject.add(user);
  }

  Future<void> login(String email, String password) async {
    final token = await camperApi.login(email, password);
    await _userSecureStorage.upsertUser(email: email, token: token);
    final user = await getProfile();
     _userSecureStorage.upsertUser(email: user.email,token: token,name: user.name);
    _userSubject.add(user);
  }

  Future<void> logout() async {
    await _userSecureStorage.deleteUser();
    _userSubject.add(null);
  }

  Future<User> getProfile() async {
    final remoteUser = await camperApi.getProfile();
    return remoteUser.toDomain();
  }

  Future<String?> getUserToken() {
    return _userSecureStorage.getToken();
  }
  

  Future<bool>checkUserAndSetUser()async{
    if (!_userSubject.hasValue) {
      final userInfo = await Future.wait([
        _userSecureStorage.getEmail(),
        _userSecureStorage.getName(),
      ]);

      final email = userInfo[0];
      final username = userInfo[1];

      if (email != null && username != null) {
        _userSubject.add(
          User(
            email: email,
            name: username
          ),
        );
      } else {
        _userSubject.add(
          null
        );
      }
    }
    return _userSubject.value != null;
  }

  
}
