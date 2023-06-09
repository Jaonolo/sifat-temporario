part of openapi.api;

@JsonSerializable()
class PrinterVendaDTO {
  DtoNota? dtoNota;
  String? senha = "";
  String? mensagemRodape = "";
  EquipamentoImpressao? equipamentoImpressao;
  bool? cancelamento = false;
  ClientAutoAtendimento? clientAutoAtendimento;

  PrinterVendaDTO();

  factory PrinterVendaDTO.fromJson(Map<String, dynamic> json) =>
      _$PrinterVendaDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PrinterVendaDTOToJson(this);
}