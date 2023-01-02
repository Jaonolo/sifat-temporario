import 'package:erp/config/application.dart';
import 'package:erp/pages/plataforma/empresas/plataforma_empresa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:erp/pages/plataforma/plataforma_page_controller.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/botao_padrao.dart';
import '../../../widgets/responsive.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../../widgets/selecao_de_imagem.dart';
import '../../routes/app_pages.dart';
// import '../../widgets/selecao_de_imagem.dart';
// import '../../organizar/routes/app_pages.dart';

class PlataformaEmpresaPage extends GetView<PlataformaEmpresaController> {
//   PlataformaPage({Key? key}) : super(key: key);
// String token;
// {
//
// class PlataformaEmpresaPage extends StatelessWidget {
   PlataformaEmpresaPage( {Key? key}) : super(key: key);

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
        desktop: ListView(
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
            const Divider(thickness: 2,),
            const SizedBox(height: 36,),
            Wrap(
              alignment: WrapAlignment.center,
              // direction: Axis.horizontal,
              spacing: 51,
              runSpacing: 25,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: SelecaoDeImagem(nome: 'Plano',
                    acao: () {
                      // Get.offAndToNamed(Routes.PLATAFORMA_EMPRESA_PLANO);
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SelecaoDeImagem(
                    nome: 'Extras',
                    acao: () {
                      // Get.offAndToNamed(Routes.PLATAFORMA_EMPRESA_EXTRA);
                    },
                    imagem: Image.asset('assets/images/extras.png'),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SelecaoDeImagem(
                    nome: 'Comissão',
                    acao: () {
                      // Get.offAndToNamed(Routes.PLATAFORMA_EMPRESA_COMISSAO);
                    },
                    imagem: Image.asset('assets/images/comissao.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//----------- WIDGETS
  Widget _btnSalvar() {
    return BotaoPadrao(
      corIcone: AppTheme.salvar,
      corTexto: Colors.white,
      texto: 'Salvar',
      icone: Icons.save,
      acao: () {
        //TODO: AÇÃO SALVAR
      },
    );
  }

  Widget _btnAdicionar() {
    return BotaoPadrao(
      corIcone: AppTheme.adicionar,
      corTexto: Colors.white,
      texto: 'Adicionar',
      icone: Icons.add_circle,
      acao: () {
        //TODO: AÇÃO SALVAR
      },
    );
  }


}
