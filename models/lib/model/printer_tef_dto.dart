part of openapi.api;

@JsonSerializable()
class PrinterTefDTO {

   String viaCliente = "";
   String viaCaixa = "";
   EquipamentoImpressao? equipamentoImpressao;
   ServicoAutoAtendimento? servicoAutoAtendimento;

   PrinterTefDTO();

  factory PrinterTefDTO.fromJson(Map<String, dynamic> json) =>
      _$PrinterTefDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PrinterTefDTOToJson(this);
}