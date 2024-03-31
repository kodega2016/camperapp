import 'package:camper_api/camper_api.dart';
import 'package:domain_models/domain_models.dart';

extension RemoteBootcampListToDomain on List<BootcampRM> {
  List<Bootcamp> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}

extension RemoteBootcampToDomain on BootcampRM {
  Bootcamp toDomain() {
    return Bootcamp(
      id: id,
      name: name,
      description: description,
    );
  }
}
