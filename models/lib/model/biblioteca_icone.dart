part of openapi.api;

@JsonSerializable()
class BibliotecaIcone {
  int? id;
  String? nome;
  String? urlPng;
  String? pathSvg;
  int? alturaSvg;
  int? larguraSvg;

  BibliotecaIcone();

  factory BibliotecaIcone.fromJson(Map<String, dynamic> json) =>
      _$BibliotecaIconeFromJson(json);

  Map<String, dynamic> toJson() => _$BibliotecaIconeToJson(this);
}