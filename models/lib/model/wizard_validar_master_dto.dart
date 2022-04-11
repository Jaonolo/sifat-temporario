part of openapi.api;

@JsonSerializable()
class WizardValidarMasterDTO {

  Usuario? user;
  String? clientSecret;

  WizardValidarMasterDTO();

  factory WizardValidarMasterDTO.fromJson(Map<String, dynamic> json) =>
      _$WizardValidarMasterDTOFromJson(json);

  Map<String, dynamic> toJson() => _$WizardValidarMasterDTOToJson(this);

}

