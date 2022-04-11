part of openapi.api;

@JsonSerializable()
class WizardBuscarPlanosEnvelop {

  List<ContratoConfiguracao>? contratoConfiguracaoList;


  WizardBuscarPlanosEnvelop();


  factory WizardBuscarPlanosEnvelop.fromJson(Map<String, dynamic> json) =>
      _$WizardBuscarPlanosEnvelopFromJson(json);

  Map<String, dynamic> toJson() => _$WizardBuscarPlanosEnvelopToJson(this);


}

