import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/responsive.dart';

class PlanoPage extends StatelessWidget {
  const PlanoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//------------ VARIAVEIS------------
    Size _size = MediaQuery.of(context).size;
//------------ EstruturaPrincipal
    return Scaffold(
      body: Responsive(
        mobile: Container(
          height: 200,
          width: 200,
          color: Colors.amber,
        ),
        desktop:
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Assinaturas',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w400,
                    fontSize: 46,
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 36,
            ),
            Row(
              children: [
                Text('Tipo de Faturamento'),
                // _tipodeFaturamento(),
                // _buildPanel,


              ],
            ),


            // ListView(
            //     padding: const EdgeInsets.all(16),
            //     children: [
            //       _tipodeFaturamento(),
            //     ]
            // ),
          ],
        ),
      ),
    );
  }
}







//
// enum SingingCharacter { cartaocredito, boleto }
//
// Widget _tipodeFaturamento() {
//   SingingCharacter? _character = SingingCharacter.cartaocredito;
//   return Column(
//     children: <Widget>[
//       Container(
//         height: Get.height / 2,
//         width: Get.width / 2,
//         child: Column(
//           children: [
//             ListTile(
//               title: const Text('Cartão de Crédito'),
//               leading: Radio<SingingCharacter>(
//                 value: SingingCharacter.cartaocredito,
//                 groupValue: _character,
//                 onChanged: (SingingCharacter? value) {   },
//               ),
//             ),
//             ListTile(
//               title: const Text('Boleto'),
//               leading: Radio<SingingCharacter>(
//                 value: SingingCharacter.boleto,
//                 groupValue: _character,
//                 onChanged: (SingingCharacter? value) {
//                   // setState(() {
//                   //   _character = value;
//                   // });
//                 },
//               ),
//             ),
//           ],
//         ),
//
//
//       ),
//
//     ],
//   );
// }
