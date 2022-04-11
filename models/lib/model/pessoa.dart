part of openapi.api;

@JsonSerializable()
class Pessoa {
  int? id;

  int? idEmpresa;

  int? codigo;

  String? nome;

  String? apelido;

  String? inscricaoFederal;

  String? inscricaoEstadual;

  String? email;

  String? site;

  String? tipoPessoa;

  //enum tipoPessoaEnum {  FISICA,  JURIDICA,  };{

  @JsonKey(defaultValue: [])
  List<Endereco> todosEnderecos = [];

  @JsonKey(defaultValue: [])
  List<Telefone> telefones = [];

  PessoaJuridica? pessoaJuridica = PessoaJuridica();

  PessoaFisica? pessoaFisica = PessoaFisica();

  int? idConcentrador;

  int? versao;

  @JsonKey(defaultValue: [])
  List<PessoaDadosIntegracao> dadosIntegracao = [];

  Telefone? get getTelefonePadrao =>
      this.telefones.firstWhere((t) => t.principal!);

  Endereco? get getEnderecoPadrao =>
      this.todosEnderecos.firstWhere((e) => e.principal);

  List<Endereco> get getEnderecoAtivos =>
      this.todosEnderecos.where((e) => e.ativo) as List<Endereco>;

  Pessoa();

  @override
  String toString() {
    return 'Pessoa{id: $id, idEmpresa: $idEmpresa, codigo: $codigo, nome: $nome, apelido: $apelido, inscricaoFederal: $inscricaoFederal, inscricaoEstadual: $inscricaoEstadual, email: $email, site: $site, tipoPessoa: $tipoPessoa, todosEnderecos: $todosEnderecos, telefones: $telefones, pessoaJuridica: $pessoaJuridica, pessoaFisica: $pessoaFisica, idConcentrador: $idConcentrador, versao: $versao, dadosIntegracao: $dadosIntegracao}';
  }

  factory Pessoa.fromJson(Map<String, dynamic> json) => _$PessoaFromJson(json);

  Map<String, dynamic> toJson() => _$PessoaToJson(this);

  static List<Pessoa> listFromJson(List<dynamic> json) {
    return json.map((value) => Pessoa.fromJson(value)).toList();
  }

  static Map<String, Pessoa> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Pessoa>();
    if (json.isNotEmpty) {
      json.forEach(
              (String key, dynamic value) => map[key] = Pessoa.fromJson(value));
    }
    return map;
  }

  adicionarTelefone(Telefone telefone) {
    // se ja contém remove para evitar duplicados
    // remove ira usar o equals do obj endereco
    telefones.remove(telefone);

    telefone.idPessoa = this.id;
    telefones.add(telefone);
    if (telefone.principal!) trocarTelefonePrincipal(telefone);

    if (getTelefonePadrao == null) {
      telefone.principal = true;
      trocarTelefonePrincipal(telefone);
    }
  }

  void trocarTelefonePrincipal(Telefone telefone) {
    if (!telefones.contains(telefone)) throw Exception();

    telefones.forEach((element) {
      element.principal = (element == telefone);
    });
  }

  void adicionarAtualizarEndereco(Endereco endereco) {
    // remove endereco para evitar duplicados
    //noinspection RedundantCollectionOperation
    if (todosEnderecos.contains(endereco)) todosEnderecos.remove(endereco);

    endereco.idPessoa = this.id;
    todosEnderecos.add(endereco);
    if (endereco.principal) trocarEnderecoPrincipal(endereco);

    if (getEnderecoPadrao == null) {
      if (todosEnderecos.isNotEmpty) {
        todosEnderecos[0].principal = true;
        trocarEnderecoPrincipal(todosEnderecos[0]);
      }
    }
  }

  void trocarEnderecoPrincipal(Endereco endereco) {
    if (!todosEnderecos.contains(endereco)) throw Exception();

    todosEnderecos.forEach((element) {
      element.principal = (element == endereco);
    });
  }
}
