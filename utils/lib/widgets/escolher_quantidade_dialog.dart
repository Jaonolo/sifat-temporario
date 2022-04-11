import 'package:flutter/material.dart';
import 'package:models/model/models.dart';

//ignore: must_be_immutable
class EscolherQuantidadeDialog extends StatefulWidget {
  final String? title;
  final String? message;
  final Function(BigDecimal)? onConfirm;
  final Function? onCancel;
  BigDecimal quantidadeMaxima = BigDecimal.ZERO();
  BigDecimal quantidade = BigDecimal.ZERO();

  EscolherQuantidadeDialog({required this.title,
    required this.message,
    required this.quantidadeMaxima,
    required this.onConfirm,
    required this.onCancel});

  @override
  _EscolherQuantidadeDialogState createState() =>
      _EscolherQuantidadeDialogState();
}

class _EscolherQuantidadeDialogState extends State<EscolherQuantidadeDialog> {
  late BuildContext context;

  @override
  Widget build(BuildContext c) {
    context = c;
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: widget.title != null ? Text(widget.title!) : null,
      content: SingleChildScrollView(
        child: Column(
          children: [
            widget.message != null ? Text(widget.message!) : const SizedBox(),
            const SizedBox(
              height: 10,
            ),
            body(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _btnCancel(context)),
                Expanded(child: _btnconfirmation(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _btnMaisMenos(Icons.remove, Colors.red, remove),
          Expanded(
              child: Text(
                widget.quantidade.toStringAsFixed(0),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              )),
          _btnMaisMenos(Icons.add, Colors.green, add),
        ],
      ),
    );
  }

  void remove() {
    setState(() {
      if (widget.quantidade.compareTo(BigDecimal.ONE()) > 0) {
        widget.quantidade = widget.quantidade.subtrair(BigDecimal.ONE());
      }
    });
  }

  void add() {
    setState(() {
      if (widget.quantidade.compareTo(widget.quantidadeMaxima) < 0) {
        widget.quantidade =
            widget.quantidade = widget.quantidade.somar(BigDecimal.ONE());
      }
    });
  }

  Widget _btnMaisMenos(IconData icon, Color cor, Function onPressed) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
        child: Icon(
          icon,
          size: 35,
          color: cor,
        ),
        onPressed: onPressed as void Function()?,
      ),
    );
  }

  Widget _btnCancel(BuildContext context) {
    return InkWell(
      onTap: () {
        close(context);
        if (widget.onCancel != null) widget.onCancel!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Icon(
              Icons.cancel,
              color: Colors.red,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Flexible(
            child: FittedBox(
              child: Text(
                "Cancelar",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnconfirmation(BuildContext context) {
    return InkWell(
      onTap: () {
        close(context);
        if (widget.onConfirm != null) widget.onConfirm!(widget.quantidade);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Flexible(
            child: FittedBox(
              child: Text(
                "Confirmar",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void close(BuildContext context) => Navigator.pop(context);
}
