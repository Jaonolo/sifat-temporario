part of openapi.api;

@JsonSerializable()
class WizardBuscarEmpresaEnvelop {

  List<WizardBuscarEmpresaDTO>? buscarEmpresaDTOList;

  WizardBuscarEmpresaEnvelop();

  factory WizardBuscarEmpresaEnvelop.fromJson(Map<String, dynamic> json) =>
      _$WizardBuscarEmpresaEnvelopFromJson(json);

  Map<String, dynamic> toJson() => _$WizardBuscarEmpresaEnvelopToJson(this);

}

