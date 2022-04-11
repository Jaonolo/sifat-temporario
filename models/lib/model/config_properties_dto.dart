part of openapi.api;

@JsonSerializable()
class ConfigPropertiesDTO {
  String? cnpj;
  String? clientSecret;
  String? host;

  ConfigPropertiesDTO();

  factory ConfigPropertiesDTO.fromJson(Map<String, dynamic> json) =>
      _$ConfigPropertiesDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigPropertiesDTOToJson(this);
}
