part of openapi.api;

@JsonSerializable()
class WizardBuscarEmpresaDTO {

  EmpresaDTO? empresaDTO;
  String? emailMaster;
  bool? usaConcentrador;

  WizardBuscarEmpresaDTO();

  factory WizardBuscarEmpresaDTO.fromJson(Map<String, dynamic> json) =>
      _$WizardBuscarEmpresaDTOFromJson(json);

  Map<String, dynamic> toJson() => _$WizardBuscarEmpresaDTOToJson(this);


}

