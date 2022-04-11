import 'package:autopesagem/config/app_config.dart';
import 'package:autopesagem/utils/auto_pesagem_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/estacao_trabalho_requester.dart';
import 'package:requester/requester/servico_auto_pesagem_requester.dart';
import 'package:requester/response/response_pws.dart';

class DialogConfigEstacao extends StatefulWidget {
  @override
  _DialogConfigEstacaoState createState() => _DialogConfigEstacaoState();
}

class _DialogConfigEstacaoState extends State<DialogConfigEstacao> {
  String modeloBalanca = "";
  String baudRate = "";
  String porta = "";
  String tipoImpressora = "";
  String marcaImpressora = "";

  String labelInfo = "";
  EstacaoTrabalhoDTO dto = EstacaoTrabalhoDTO();

  TextEditingController txtImpressoraController = TextEditingController();
  TextStyle style = const TextStyle(color: Colors.white);

  @override
  void initState() {
    setState(() {
      modeloBalanca = (listModelobalancas
          .contains(AppConfig.estacaoTrabalho.balanca!.modelo)
          ? AppConfig.estacaoTrabalho.balanca!.modelo
          : listModelobalancas.first)!;
      baudRate = listBaudRates
          .contains(AppConfig.estacaoTrabalho.balanca!.baudrate.toString())
          ? AppConfig.estacaoTrabalho.balanca!.baudrate.toString()
          : listBaudRates.first;
      porta = listPorts.contains(
          AppConfig.estacaoTrabalho.balanca!.portaSerial.toString())
          ? AppConfig.estacaoTrabalho.balanca!.portaSerial.toString()
          : listPorts.first;
      tipoImpressora = (listImpressoras
          .contains(AppConfig.impressoraPadrao.impressora?.tipoDispositivo)
          ? AppConfig.impressoraPadrao.impressora!.tipoDispositivo
          : listImpressoras.first)!;
      marcaImpressora = (listMarcasImpressora
          .contains(AppConfig.impressoraPadrao.impressora?.driver?.marca)
          ? AppConfig.impressoraPadrao.impressora!.driver!.marca
          : listMarcasImpressora.first)!;

      switch (AppConfig.impressoraPadrao.impressora?.tipoDispositivo) {
        case "IMPRESSORA":
          txtImpressoraController.text =
          AppConfig.impressoraPadrao.impressora!.path!;
          break;
        case "IMPRESSORA_TCP_IP":
          txtImpressoraController.text =
          AppConfig.impressoraPadrao.impressora!.ipAddress!;
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(43, 49, 53, 1),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      title: Text(
        "Configuração",
        style: style,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              configBalanca(),
              if (AppConfig.servicoAutoPesagem.imprimirPeso) ...[
                const SizedBox(width: 100),
                configImpressora(),
              ],
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          rowInfo(),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: onTestarbalanca,
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.green,
                  size: 28,
                )),
            Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: salvarDados,
                  child: const Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget configBalanca() {
    return Expanded(
        flex: 50,
        child: Column(
          children: [
            Text(
              "Balança",
              style: style,
            ),
            dropDownButtonModelo(),
            dropDownButtonBaudRate(),
            dropDownButtonporta(),
          ],
        ));
  }

  Widget configImpressora() {
    return Expanded(
        flex: 50,
        child: Column(
          children: [
            Text(
              "Impressora",
              style: style,
            ),
            dropDownButtonMarca(),
            dropDownButtonTipoImpressora(),
            txtDadosImpressora(),
          ],
        ));
  }

  Widget rowInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          labelInfo,
          style: style,
        ),
      ],
    );
  }

  Widget dropDownButtonModelo() {
    return DropdownButtonFormField(
      dropdownColor: const Color.fromRGBO(43, 49, 53, 1),
      items: listModelobalancas
          .map((value) =>
          DropdownMenuItem(
            child: Text(
              value,
              style: style,
            ),
            value: value,
          ))
          .toList(),
      isExpanded: true,
      value: modeloBalanca,
      decoration: InputDecoration(labelText: "Modelo", labelStyle: style),
      onChanged: (value) {
        modeloBalanca = value.toString();
      },
    );
  }

  Widget dropDownButtonBaudRate() {
    return DropdownButtonFormField(
      dropdownColor: const Color.fromRGBO(43, 49, 53, 1),
      items: listBaudRates
          .map((value) =>
          DropdownMenuItem(
            child: Text(
              value,
              style: style,
            ),
            value: value,
          ))
          .toList(),
      isExpanded: true,
      value: baudRate,
      decoration: InputDecoration(labelText: "Baud Rate", labelStyle: style),
      onChanged: (value) {
        baudRate = value.toString();
      },
    );
  }

  Widget dropDownButtonporta() {
    return DropdownButtonFormField(
      dropdownColor: const Color.fromRGBO(43, 49, 53, 1),
      items: listPorts
          .map((value) =>
          DropdownMenuItem(
            child: Text(
              value,
              style: style,
            ),
            value: value,
          ))
          .toList(),
      isExpanded: true,
      value: porta,
      decoration: InputDecoration(labelText: "Porta", labelStyle: style),
      onChanged: (value) {
        porta = value.toString();
      },
    );
  }

  Widget dropDownButtonMarca() {
    return DropdownButtonFormField(
      dropdownColor: Color.fromRGBO(43, 49, 53, 1),
      items: listMarcasImpressora
          .map((value) =>
          DropdownMenuItem(
            child: Text(
              value,
              style: style,
            ),
            value: value,
          ))
          .toList(),
      isExpanded: true,
      value: marcaImpressora,
      decoration: InputDecoration(labelText: "Marca", labelStyle: style),
      onChanged: (value) {
        marcaImpressora = value.toString();
      },
    );
  }

  Widget dropDownButtonTipoImpressora() {
    return DropdownButtonFormField(
        dropdownColor: const Color.fromRGBO(43, 49, 53, 1),
        items: listImpressoras
            .map((value) =>
            DropdownMenuItem(
              child: Text(
                value.replaceAll("_", " "),
                style: style,
              ),
              value: value,
            ))
            .toList(),
        isExpanded: true,
        value: tipoImpressora,
        decoration: InputDecoration(labelText: "Tipo", labelStyle: style),
        onChanged: (value) {
          setState(() {
            tipoImpressora = value.toString();
          });
        });
  }

  Widget txtDadosImpressora() {
    return TextFormField(
      style: style,
      controller: txtImpressoraController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(15),
      ],
      decoration: InputDecoration(
        labelText: tipoImpressora == "IMPRESSORA_TCP_IP"
            ? "Informe o ip:"
            : "Informe o nome:",
        labelStyle: style,
      ),
    );
  }

  Future<void> onTestarbalanca() async {
    setState(() {
      labelInfo = "Conectando balança ...";
    });

    try {
      ResponsePws lerPeso = await ServicoAutoPesagemRequester.lerPeso(
        AppConfig.pwsUtils,
        porta,
        baudRate,
        modeloBalanca,
      );

      if (lerPeso.isSuccess) {
        setState(() {
          labelInfo = lerPeso.content.toString() + " Kg";
        });
      } else {
        setState(() {
          labelInfo = "Sem conexão.";
        });
      }
    } catch (e) {
      setState(() {
        labelInfo = "Ocorreu um erro ao conectar com a balança.";
      });
    }
  }

  void atualizaObjects() {
    //Balança
    dto.estacaoBalanca = EstacaoBalanca();
    dto.impressoraGeral = EquipamentoImpressao();
    dto.impressoraGeral!.driver = DriverImpressora();
    dto.estacaoBalanca!.modelo = modeloBalanca;
    dto.estacaoBalanca!.baudrate = int.parse(baudRate);
    dto.estacaoBalanca!.portaSerial = porta;

    //Impressora
    dto.impressoraGeral!.id = AppConfig.impressoraPadrao.id != null
        ? AppConfig.impressoraPadrao.impressora!.id
        : null;
    dto.impressoraGeral!.descricao = "Auto Pesagem";
    dto.impressoraGeral!.tipoDispositivo = tipoImpressora;
    switch (tipoImpressora) {
      case "IMPRESSORA":
        dto.impressoraGeral!.path = txtImpressoraController.text;
        dto.impressoraGeral!.ipAddress = "";
        break;
      case "IMPRESSORA_TCP_IP":
        dto.impressoraGeral!.ipAddress = txtImpressoraController.text;
        dto.impressoraGeral!.path = "";
        break;
    }
    dto.impressoraGeral!.idEmpresa = AppConfig.empresa.id;
    dto.impressoraGeral!.driver = AppConfig.driversImpressora
        .firstWhere((d) => d.marca == marcaImpressora, orElse: null);
  }

  void salvarDados() {
    atualizaObjects();

    AutoPesagemUtils.showProgress(context);

    EstacaoTrabalhoRequester.atualizarEstacao(AppConfig.application.pwsConfig,
        AppConfig.token, dto, AppConfig.estacaoTrabalho.id!)
        .then((response) {
      if (response.status == 204) {
        AppConfig.impressoraPadrao.impressora = EquipamentoImpressao();
        AppConfig.impressoraPadrao.impressora!.driver = DriverImpressora();
        AppConfig.impressoraPadrao.impressora!.driver!.marca =
            dto.impressoraGeral!.driver!.marca;
        AppConfig.impressoraPadrao.impressora!.tipoDispositivo =
            dto.impressoraGeral!.tipoDispositivo;
        AppConfig.impressoraPadrao.impressora!.tipoDispositivo =
            dto.impressoraGeral!.tipoDispositivo;

        switch (dto.impressoraGeral!.tipoDispositivo) {
          case "IMPRESSORA":
            AppConfig.impressoraPadrao.impressora!.path =
                dto.impressoraGeral!.path;
            break;
          case "IMPRESSORA_TCP_IP":
            AppConfig.impressoraPadrao.impressora!.ipAddress =
                dto.impressoraGeral!.ipAddress;
            break;
        }

        AppConfig.estacaoTrabalho.balanca = dto.estacaoBalanca;
        AppConfig.estacaoTrabalho.impressoras.clear();
        AppConfig.estacaoTrabalho.impressoras.add(EstacaoImpressora()
          ..relatorio = 'TICKET_VENDA'
          ..impressora = dto.impressoraGeral);

        AutoPesagemUtils.closeProgress(context);

        Navigator.pop(context, true);
      } else {
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      throw e;
    });
  }

  List<String> listModelobalancas = [
    "NENHUM",
    "FILIZOLA_BP",
    "FILIZOLA_MF",
    "FILIZOLA_E",
    "FILIZOLA_CS",
    "TOLEDO_PRIX_III",
    "TOLEDO_9094",
    "TOLEDO_8217",
    "TOLEDO_2096",
    "TOLEDO_PRIMA",
    "TOLEDO_PRIX_IV",
    "TOLEDO_PRIX_V",
    "TOLEDO_PRIX_VI",
    "MAGNA_TORREY_III"
  ];

  List<String> listBaudRates = [
    "300",
    "1200",
    "2400",
    "4800",
    "9600",
    "14400",
    "19200",
    "28800",
    "38400",
    "57600",
    "115200"
  ];

  List<String> listPorts = [
    "COM1",
    "COM2",
    "COM3",
    "COM4",
    "COM5",
    "COM6",
    "COM7",
    "COM8",
    "COM9",
    "COM10",
    "COM11",
    "COM12",
  ];

  List<String> listImpressoras = ["IMPRESSORA", "IMPRESSORA_TCP_IP"];

  List<String> listMarcasImpressora = [
    "NENHUMA",
    "BEMATECH",
    "DARUMA",
    "ELGIN",
    "EPSON",
    "TANCA",
    "JETWAY",
    "GERTEC",
    "CONTROL_ID",
    "SWEDA",
    "DIEBOLD",
  ];
}
