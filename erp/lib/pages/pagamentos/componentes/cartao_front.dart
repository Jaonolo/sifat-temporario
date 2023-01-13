import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CartaoCreditoFront extends StatelessWidget {
  const CartaoCreditoFront ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *.9,
      height: 220,
      decoration: BoxDecoration(
        color: Color.fromRGBO(13, 13, 13, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Edmar de Paula',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      letterSpacing: 0.5,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.trashCan,
                  color: Color.fromRGBO(231, 74, 59, 1),
                  ),
              ),
            ],
          ),
          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
              'Valid \n thru',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  letterSpacing: 0.5,
                  color: Color.fromRGBO(255, 255, 255, 1),
              ),
              ),
              Text(
                '12/22',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  letterSpacing: 0.5,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),

          SizedBox(height: 20,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('**** **** **** **** 123',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.5,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),


          SizedBox(height: 8,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
             IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.ccMastercard,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Expanded(child: Container(),),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(229, 255, 229, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  )
                ),
                  
                  onPressed: (){},
                  child: Text(

                    'Cartão padrão',

                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      letterSpacing: 0.5,
                      color: Color(0xFF169C34),
                    ),
                  ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
