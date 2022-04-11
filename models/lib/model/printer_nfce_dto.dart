part of openapi.api;

@JsonSerializable()
class PrinterNFCeDTO {
  String? xml = "";
  String? senha = "";
  String? mensagemRodape = "";
  EquipamentoImpressao? equipamentoImpressao;
  bool? cancelamento = false;

  PrinterNFCeDTO();

  factory PrinterNFCeDTO.fromJson(Map<String, dynamic> json) =>
      _$PrinterNFCeDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PrinterNFCeDTOToJson(this);
}