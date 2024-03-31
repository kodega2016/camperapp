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
      website: website,
      phone: phone,
      email: email,
      createdAt: createdAt,
      slug: slug,
      photo: photo,
      housing: housing,
      jobAssistance: jobAssistance,
      jobGuarantee: jobGuarantee,
      acceptGi: acceptGi,
      careers: careers,
      location: location.toDomain(),
    );
  }
}

extension RemoteLocationToDomain on LocationRM {
  Location toDomain() {
    return Location(
      city: city,
      country: country,
      coordinates: coordinates,
      formattedAddress: formattedAddress,
      street: street,
      zipcode: zipcode,
    );
  }
}
