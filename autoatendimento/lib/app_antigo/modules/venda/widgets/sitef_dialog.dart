// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:autoatendimento/app/modules/venda/widgets/select_option_dialog/select_option.dart';
//
// class SitefDialog extends StatefulWidget {
//   static late _SitefDialogState instance;
//
//   final Function onCancelar;
//
//   SitefDialog({required this.onCancelar});
//
//   @override
//   _SitefDialogState createState() => instance = _SitefDialogState();
// }
//
// class _SitefDialogState extends State<SitefDialog> {
//   String? _title;
//   Widget? _dialog;
//   Widget? _content;
//   String? _message;
//   List<Widget>? _actions;
//   SelectOption? _selected;
//   List<Widget>? _contentList;
//   Function(dynamic)? _onConfirm;
//   TextEditingController? _inputController;
//
//   dynamic shape = RoundedRectangleBorder(
//     side: BorderSide(),
//     borderRadius: BorderRadius.all(Radius.circular(8)),
//   );
//
//   _SitefDialogState() {
//     _inputController = TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_dialog == null) _dialog = _defaultDialog();
//     return _dialog!;
//   }
//
//   Widget _defaultDialog() {
//     return AlertDialog(
//       shape: shape,
//       title: _title != null
//           ? Text(
//               _title!,
//               style: TextStyle(fontSize: 20),
//               textAlign: TextAlign.center,
//             )
//           : null,
//       content: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: _content,
//       ),
//       actions: _actions,
//     );
//   }
//
//   Widget _optionsDialog() {
//     return SimpleDialog(
//       shape: shape,
//       title: Text(
//         _title!,
//         style: TextStyle(fontSize: 20),
//         textAlign: TextAlign.center,
//       ),
//       children: _contentList,
//     );
//   }
//
//   Widget _statusWidget(String status) {
//     return Text(
//       status,
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//     );
//   }
//
//   Widget _inputWidget(
//       TextInputType keyboardType, List<TextInputFormatter>? inputFormatters) {
//     return TextField(
//       autofocus: true,
//       controller: _inputController,
//       keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//       inputFormatters: inputFormatters,
//     );
//   }
//
//   List<Widget> _optionsWidget(List<SelectOption> selectOptions) {
//     List<Widget> content = [];
//
//     content.addAll(selectOptions
//         .map((option) => ListTile(
//               title: Text(
//                 option.text,
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//               selected: _selected != null && option.value == _selected!.value,
//               onTap: () {
//                 _selected = option;
//                 setOptions(_title!, selectOptions, _onConfirm!);
//               },
//             ))
//         .toList());
//
//     content.add(Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: _actions!,
//     ));
//
//     return content;
//   }
//
//   Widget _montaQrCode(String qrCodeString) {
//     final bodyHeight = MediaQuery.of(context).size.height -
//         MediaQuery.of(context).viewInsets.bottom;
//
//     return Container(
//       height: bodyHeight * 0.3,
//       width: bodyHeight * 0.8,
//       child: Center(
//         child: RepaintBoundary(
//           child: QrImage(
//             version: 15,
//             // version <15 == erro: Failed assertion: boolean expression must not be null
//             backgroundColor: Colors.white,
//             data: qrCodeString,
//           ),
//         ),
//       ),
//     );
//   }
//
//   void setStatus(String status) {
//     setState(() {
//       _title = null;
//       _content = _statusWidget(status);
//       _actions = status.toUpperCase() == "RETIRE O CARTAO DA LEITORA"
//           ? []
//           : [_btnCancelar()];
//       _dialog = _defaultDialog();
//     });
//   }
//
//   void setOptions(
//     String title,
//     List<SelectOption> selectOptions,
//     Function(dynamic) onConfirm,
//   ) {
//     setState(() {
//       _title = title;
//       _onConfirm = onConfirm;
//       _actions = [_btnCancelar(), _btnConfirmar(onConfirm, fromOptions: true)];
//       _contentList = _optionsWidget(selectOptions);
//       _dialog = _optionsDialog();
//     });
//   }
//
//   void setQrCode(String title, String content) {
//     setState(() {
//       _actions = [_btnCancelar()];
//       _title = title;
//       _content = _montaQrCode(content);
//       _dialog = _defaultDialog();
//     });
//   }
//
//   void setError(error) {
//     setState(() {
//       _title = null;
//       _content = _statusWidget(error.toString());
//       _actions = [
//         _btnCancelar(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             txt: "OK")
//       ];
//       _dialog = _defaultDialog();
//     });
//   }
//
//   void setInput(
//       {required String message,
//       required TextInputType keyboardType,
//       required Function(dynamic) onConfirm,
//       List<TextInputFormatter>? inputFormatters}) {
//     setState(() {
//       _title = message;
//       _content = _inputWidget(keyboardType, inputFormatters);
//       _actions = [_btnCancelar(), _btnConfirmar(onConfirm, fromInput: true)];
//       _dialog = _defaultDialog();
//     });
//   }
//
//   void setInformation(
//       {required String information, required Function(dynamic) onConfirm}) {
//     setState(() {
//       _title = null;
//       _content = _statusWidget(information);
//       _actions = [_btnConfirmar(onConfirm, txt: "OK")];
//       _dialog = _defaultDialog();
//     });
//   }
//
//   Widget _btnCancelar({Function? onPressed, String txt = "Cancelar"}) {
//     var width = MediaQuery.of(context).size.width;
//
//     return Container(
//       width: width * 0.70 / 2,
//       child: InkWell(
//         onTap: () {
//           onPressed != null ? onPressed.call() : widget.onCancelar.call();
//         },
//         child: Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: Icon(
//                   Icons.cancel,
//                   color: Colors.red,
//                 ),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//               Flexible(
//                 child: FittedBox(
//                   child: Text(
//                     txt,
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _btnConfirmar(Function(dynamic) onConfirm,
//       {bool fromInput = false,
//       bool fromOptions = false,
//       String txt = "Confirmar"}) {
//     var width = MediaQuery.of(context).size.width;
//
//     return Container(
//       width: width * 0.70 / 2,
//       child: InkWell(
//         onTap: () {
//           if (fromInput) {
//             onConfirm(_inputController!.text);
//             _inputController!.text = "";
//           } else if (fromOptions) {
//             onConfirm(_selected!.value);
//             _selected = null;
//           } else {
//             onConfirm(null);
//           }
//         },
//         child: Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: Icon(
//                   Icons.check_circle,
//                   color: Colors.green,
//                 ),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//               Flexible(
//                 child: FittedBox(
//                   child: Text(
//                     txt,
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   TextEditingController get inputController => _inputController!;
// }
