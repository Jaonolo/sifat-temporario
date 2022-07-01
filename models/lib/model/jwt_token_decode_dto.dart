part of openapi.api;

@JsonSerializable()
class JwtTokenDecodeDTO {

   String? idUsuarioEmpresa;

   String? idEstacaoTrabalho;

   String? idEmpresa;

   String? client;

   String? idSessao;

   int? exp;

   int? iat;

  JwtTokenDecodeDTO();


   @override
   String toString() {
     return 'JwtTokenDecodeDTO{idUsuarioEmpresa: $idUsuarioEmpresa, idEstacaoTrabalho: $idEstacaoTrabalho, idEmpresa: $idEmpresa, client: $client, idSessao: $idSessao, exp: $exp, iat: $iat}';
   }

   factory JwtTokenDecodeDTO.fromJson(Map<String, dynamic> json) =>
      _$JwtTokenDecodeDTOFromJson(json);

  Map<String, dynamic> toJson() => _$JwtTokenDecodeDTOToJson(this);

  static List<JwtTokenDecodeDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => JwtTokenDecodeDTO.fromJson(value)).toList();
  }

}
