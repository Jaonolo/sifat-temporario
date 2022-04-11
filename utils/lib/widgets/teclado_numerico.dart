import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TecladoNumerico extends StatefulWidget {
  final bool erase;
  final String title;
  final String subTitle;
  final bool withHeader;
  final double sizeButtons;
  final double? width;
  final Color? colorLeftAction;
  final Widget childLeftAction;
  final Color? colorRigthAction;
  final Widget childRightAction;
  final Widget? leftHeaderAction;
  final Widget? rightHeaderAction;
  final Color? numberButtonsColor;
  final double buttonsBorderRadius;
  final bool real;
  final bool percentual;
  final bool enabled;
  final EdgeInsets paddingTxtValor;
  final Function(dynamic value)? onRightAction;
  final Function(dynamic value)? onLeftAction;
  final Function(dynamic value)? onSaved;

  String typedValue = "";

  //sempre formatada em real
  String typedValueInRealAndPercentual = "";

  TecladoNumerico({
    this.buttonsBorderRadius = 8,
    this.numberButtonsColor,
    this.colorRigthAction,
    this.colorLeftAction,
    this.onRightAction,
    this.onLeftAction,
    this.withHeader = false,
    this.title = "",
    this.subTitle = "",
    this.rightHeaderAction,
    this.leftHeaderAction,
    this.sizeButtons = 20,
    this.width,
    this.erase = true,
    this.onSaved,
    this.real = false,
    this.percentual = false,
    this.enabled = false,
    this.paddingTxtValor = const EdgeInsets.all(22),
    this.childLeftAction = const Icon(Icons.close),
    this.childRightAction = const Icon(Icons.check),
  });

  @override
  _TecladoNumericoState createState() => _TecladoNumericoState();
}

class _TecladoNumericoState extends State<TecladoNumerico> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _content(),
        if (widget.enabled) ...[Container(color: Colors.transparent,)]
      ],
    );
  }

  Widget _content() {
    return SingleChildScrollView(
      child: Container(
        width: widget.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            widget.withHeader ? _cabecalho() : Container(),
            _txtValue(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _card(1),
                _card(2),
                _card(3),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _card(4),
                _card(5),
                _card(6),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _card(7),
                _card(8),
                _card(9),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _cardLeftAction(),
                _card(0),
                _cardRightAction(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cabecalho() {
    return ListTile(
      leading: widget.leftHeaderAction,
      trailing: widget.rightHeaderAction,
      title: Text(
        widget.title,
        textAlign:
        widget.leftHeaderAction != null && widget.rightHeaderAction != null
            ? TextAlign.center
            : widget.leftHeaderAction != null ||
            widget.rightHeaderAction != null
            ? null
            : TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: widget.subTitle != ""
          ? Text(
        widget.subTitle,
        textAlign: widget.leftHeaderAction != null &&
            widget.rightHeaderAction != null
            ? TextAlign.center
            : widget.leftHeaderAction != null ||
            widget.rightHeaderAction != null
            ? null
            : TextAlign.center,
      )
          : null,
    );
  }

  Widget _txtValue() {
    String text;
    if (widget.typedValueInRealAndPercentual != "" && widget.typedValue != "") {
      text = widget.typedValueInRealAndPercentual;
    } else {
      text = widget.typedValue;
    }
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      textAlign: TextAlign.center,
    );
  }

  Widget _card(dynamic value) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.buttonsBorderRadius),
            )),
        color: widget.numberButtonsColor,
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.buttonsBorderRadius),
          ),
          onTap: () {
            //caso seja real coloca uma mascara
            if (widget.real) {
              var formatter = new NumberFormat("#,##0.00");
              double valor = double.parse(("${widget.typedValue}$value"));
              widget.typedValueInRealAndPercentual =
                  formatter.format(valor / 100);
            }
            //caso seja percentual coloca uma mascara
            if (widget.percentual) {
              var formatter = new NumberFormat("#.00");
              double valor = double.parse(("${widget.typedValue}$value"));
              widget.typedValueInRealAndPercentual =
                  formatter.format(valor / 100);
            }
            setState(() {
              //caso seja porcentagem limita em 4 casas
              if (widget.percentual && widget.typedValue.length < 3) {
                widget.typedValue = "${widget.typedValue}$value";
              }
              //trava para limitar numero de caracteres digitados, para nao ocoorer erro na api
              else if (!widget.percentual && widget.typedValue.length < 9) {
                widget.typedValue = "${widget.typedValue}$value";
              } else {
                return;
              }
            });
            if (widget.onSaved != null) {
              widget.onSaved!(widget.typedValueInRealAndPercentual != ""
                  ? widget.typedValueInRealAndPercentual
                  : widget.typedValue);
            }
          },
          child: Padding(
            padding: EdgeInsets.all(widget.sizeButtons),
            child: Text(
              "$value",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardRightAction() {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.buttonsBorderRadius),
            )),
        color: widget.colorRigthAction,
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.buttonsBorderRadius),
          ),
          onTap: () {
            if (widget.onSaved != null) {
              widget.onSaved!(widget.typedValueInRealAndPercentual != ""
                  ? widget.typedValueInRealAndPercentual
                  : widget.typedValue);
            }
            if (widget.onRightAction != null) {
              widget.onRightAction!(widget.typedValue);
              if (widget.erase)
                setState(() {
                  widget.typedValue = "";
                });
            }
          },
          child: Padding(
            padding: EdgeInsets.all(widget.sizeButtons),
            child: widget.childRightAction,
          ),
        ),
      ),
    );
  }

  Widget _cardLeftAction() {
    return Expanded(
      child: GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.buttonsBorderRadius),
              )),
          color: widget.colorLeftAction,
          child: InkWell(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.buttonsBorderRadius),
            ),
            onTap: () {
              if (widget.onLeftAction != null)
                widget.onLeftAction!(widget.typedValue);
              if (widget.erase)
                setState(() {
                  widget.typedValue = "";
                });
              if (widget.onSaved != null) {
                widget.onSaved!(widget.typedValueInRealAndPercentual != ""
                    ? widget.typedValueInRealAndPercentual
                    : widget.typedValue);
              }
            },
            child: Padding(
              padding: EdgeInsets.all(widget.sizeButtons),
              child: widget.childLeftAction,
            ),
          ),
        ),
      ),
    );
  }
}
