import 'package:camper_api/camper_api.dart';
import 'package:domain_models/domain_models.dart';

extension UserRMToDomain on UserRM {
  User toDomain() {
    return User(name: name, email: email);
  }
}
