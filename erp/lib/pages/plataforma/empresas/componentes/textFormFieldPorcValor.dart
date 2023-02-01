import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class TextFormFieldPorcValor extends StatefulWidget {
  @override
  _TextFormFieldPorcValorState createState() => _TextFormFieldPorcValorState();
}

class _TextFormFieldPorcValorState extends State<TextFormFieldPorcValor> {
  bool _value = false;

  void _toggle() {
    setState(() {
      _value = !_value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            width: 292,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: Color.fromRGBO(66, 71, 78, 1),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Color.fromRGBO(66, 71, 78, 1),
                      ),
                      ),

                      labelText: _value ? 'Percentual' : 'Valor',
                      labelStyle: GoogleFonts.sourceSansPro(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.4,
                        color: Color.fromRGBO(66, 71, 78, 1),
                      ),
                      // hintText: _value ? 'Desconto' : 'Valor',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  // decoration: BoxDecoration(
                    // color: Color.fromRGBO(255, 237, 232, 1),
                  // ),
                  child: SizedBox(
                    width: 39,
                    child: ElevatedButton(


                      style: ElevatedButton.styleFrom(

                        elevation: 0,
                        padding: EdgeInsets.zero,
                        backgroundColor: Color.fromRGBO(255, 237, 232, 1),
                      ),
                      onPressed: _toggle,
                      child: Padding(
                        padding: const EdgeInsets.symmetric( vertical: 13.5),
                        child: Text('R\$',

                        style: GoogleFonts.sourceSansPro(

                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 0.25,
                          color: Color.fromRGBO(255, 87, 34, 1),
                        ),),
                      ),

                    ),
                  ),
                  // IconButton(
                  //   padding: EdgeInsets.zero,
                  //   icon: Icon(Icons.dollar,
                  //     color: Color.fromRGBO(255, 87, 34, 1),
                  //     size: 16.0,
                  //   ),
                  //   onPressed: _toggle,
                  // ),
                ),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(

                    color: Color.fromRGBO(255, 237, 232, 1),
                  ),

                  child: SizedBox(
                    width: 39,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        backgroundColor: Color.fromRGBO(255, 87, 34, 1),
                      ),
                      onPressed: _toggle,
                      child: Padding(
                        padding: const EdgeInsets.symmetric( vertical: 13.5),
                        child: Text('%',
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 0.25,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),

                    ),
                  ),
                  // IconButton(
                  //   padding: EdgeInsets.zero,
                  //   icon: Icon(Icons.dollar,
                  //     color: Color.fromRGBO(255, 87, 34, 1),
                  //     size: 16.0,
                  //   ),
                  //   onPressed: _toggle,
                  // ),
                ),
                // Container(
                //   margin: EdgeInsets.zero,
                //   decoration: BoxDecoration(
                //     color: Color.fromRGBO(255, 87, 34, 1),
                //   ),
                //
                //   child: IconButton(
                //     padding: EdgeInsets.zero,
                //
                //
                //     color: Color.fromRGBO(255, 237, 232, 1),
                //     icon: Icon(Icons.percent,
                //       color: Color.fromRGBO(255, 255, 255, 1),
                //       size: 16.0,
                //     ),
                //     onPressed: _toggle,
                //   ),
                // ),
                // IconButton(
                //   icon: Icon(
                //     _value
                //         ? Icons.percent
                //         : Icons.monetization_on_outlined,
                //     size: 18.0,
                //   ),
                //   onPressed: _toggle,
                // ),
                // IconButton(
                //   icon: Icon(
                //     _value
                //         ? Icons.percent
                //         : Icons.monetization_on_outlined,
                //     size: 18.0,
                //   ),
                //   onPressed: _toggle,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
