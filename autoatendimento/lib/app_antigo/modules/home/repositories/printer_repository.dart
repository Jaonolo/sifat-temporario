import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/autoatendimento_requester.dart';

class PrinterRepository {
  static Future<void> printerNFCe(PWSConfig configLocal, String xml,
      EquipamentoImpressao equipamentoImpressao,
      {required String senha,
        required String mensagemRodape,
        bool? cancelamento}) async {
    PrinterNFCeDTO dto = PrinterNFCeDTO();
    dto.xml = xml;
    dto.senha = senha;
    dto.mensagemRodape = mensagemRodape;
    dto.equipamentoImpressao = equipamentoImpressao;
    dto.cancelamento = cancelamento ?? false;

    return await AutoatendimentoRequester.printNFCe(configLocal, dto)
        .then((response) {
      if (!response.isSuccess) {
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      print(e);
      print(s);
      throw e;
    });
  }

  static Future<void> printerVenda(PWSConfig configLocal,
      Nota nota,
      ClientAutoAtendimento clientAutoAtendimento,
      List<NotaItem> itens,
      EquipamentoImpressao equipamentoImpressao,
      {required String senha,
        required String mensagemRodape,
        bool? cancelamento}) async {
    PrinterVendaDTO dto = PrinterVendaDTO();
    dto.dtoNota = DtoNota();
    dto.dtoNota!.nota = nota;
    dto.dtoNota!.notaItemList = itens;
    dto.dtoNota!.notaFinalizadoraList = nota.finalizadoras;
    dto.clientAutoAtendimento = clientAutoAtendimento;
    dto.senha = senha;
    dto.mensagemRodape = mensagemRodape;
    dto.equipamentoImpressao = equipamentoImpressao;
    dto.cancelamento = cancelamento != null ? cancelamento : false;

    return await AutoatendimentoRequester.printVenda(configLocal, dto)
        .then((response) {
      if (!response.isSuccess) {
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      print(e);
      print(s);
      throw e;
    });
  }

  static Future<void> printerConsumo(PWSConfig configLocal,
      Nota nota,
      ClientAutoAtendimento clientAutoAtendimento,
      List<NotaItem> itens,
      EquipamentoImpressao equipamentoImpressao,
      {required String senha,
        required String mensagemRodape}) async {
    PrinterVendaDTO dto = PrinterVendaDTO();
    dto.dtoNota = DtoNota();
    dto.dtoNota!.nota = nota;
    dto.dtoNota!.notaItemList = itens;
    dto.dtoNota!.notaFinalizadoraList = nota.finalizadoras;
    dto.clientAutoAtendimento = clientAutoAtendimento;
    dto.senha = senha;
    dto.mensagemRodape = mensagemRodape;
    dto.equipamentoImpressao = equipamentoImpressao;

    return await AutoatendimentoRequester.printConsumo(configLocal, dto)
        .then((response) {
      if (!response.isSuccess) {
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      print(e);
      print(s);
      throw e;
    });
  }

  static Future<void> printerTefComprovante(PWSConfig configLocal,
      String viaCliente,
      String viaCaixa,
      ServicoAutoAtendimento servicoAutoAtendimento,
      EquipamentoImpressao equipamentoImpressao,) async {
    PrinterTefDTO dto = PrinterTefDTO();

    dto.equipamentoImpressao = equipamentoImpressao;
    dto.servicoAutoAtendimento= servicoAutoAtendimento;
    dto.viaCaixa = viaCaixa;
    dto.viaCliente = viaCliente;

    return await AutoatendimentoRequester.printTefComprovante(configLocal, dto)
        .then((response) {
      if (!response.isSuccess) {
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      print(e);
      print(s);
      throw e;
    });
  }
}
