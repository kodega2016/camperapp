import 'package:bootcamp_repository/src/mappers/mappers.dart';
import 'package:camper_api/camper_api.dart';
import 'package:domain_models/domain_models.dart';

class BootCampRepository {
  final CamperApi _api;
  BootCampRepository({
    required CamperApi api,
  }) : _api = api;

  Future<List<Bootcamp>> getBootCamps() async {
    final bootCamps = await _api.getBootcamps();
    return bootCamps.bootcamps.toDomain();
  }
}
