class NumberUtils {
  static String valorPorExtenso(double vlr) {
    if (vlr == 0) return "zero";

    int inteiro = vlr.abs().toInt();
    double resto = (vlr - inteiro);
    String vlrS = inteiro.toString();

    if (vlrS.length > 15) return "Erro: valor superior a 999 trilhões.";

    String s = "";
    String saux;
    String vlrP;
    String centavos = (resto * 100).round().toString();
    List<String> unidade = [
      "",
      "um",
      "dois",
      "três",
      "quatro",
      "cinco",
      "seis",
      "sete",
      "oito",
      "nove",
      "dez",
      "onze",
      "doze",
      "treze",
      "quatorze",
      "quinze",
      "dezesseis",
      "dezessete",
      "dezoito",
      "dezenove"
    ];
    List<String> centena = [
      "",
      "cento",
      "duzentos",
      "trezentos",
      "quatrocentos",
      "quinhentos",
      "seiscentos",
      "setecentos",
      "oitocentos",
      "novecentos"
    ];
    List<String> dezena = [
      "",
      "",
      "vinte",
      "trinta",
      "quarenta",
      "cinquenta",
      "sessenta",
      "setenta",
      "oitenta",
      "noventa"
    ];
    List<String> qualificaS = ["", "mil", "milhão", "bilhão", "trilhão"];
    List<String> qualificaP = ["", "mil", "milhões", "bilhões", "trilhões"];
    int? n;
    int unid;
    int dez;
    int cent;
    int tam;
    int i = 0;
    bool umReal = false;
    bool tem = false;
    while (!(vlrS == "0")) {
      tam = vlrS.length;
      if (tam > 3) {
        vlrP = vlrS.substring(tam - 3, tam);
        vlrS = vlrS.substring(0, tam - 3);
      } else {
        vlrP = vlrS;
        vlrS = "0";
      }
      if (!(vlrP == "000")) {
        saux = "";
        if (vlrP == "100") {
          saux = "cem";
        } else {
          n = int.tryParse(vlrP, radix: 10);
          cent = (n! ~/ 100);
          dez = ((n % 100) ~/ 10);
          unid = ((n % 100) % 10);
          if (cent != 0) {
            saux = centena[cent];
          }
          if ((n % 100) <= 19) {
            if (saux.length != 0) {
              saux = ((saux + " e ") + unidade[n % 100]);
            } else {
              saux = unidade[n % 100];
            }
          } else {
            if (saux.length != 0) {
              saux = ((saux + " e ") + dezena[dez]);
            } else {
              saux = dezena[dez];
            }
            if (unid != 0) {
              if (saux.length != 0) {
                saux = ((saux + " e ") + unidade[unid]);
              } else {
                saux = unidade[unid];
              }
            }
          }
        }
        if ((vlrP == "1") || (vlrP == "001")) {
          if (i == 0) {
            umReal = true;
          } else {
            saux = ((saux + " ") + qualificaS[i]);
          }
        } else {
          if (i != 0) {
            saux = ((saux + " ") + qualificaP[i]);
          }
        }
        if (s.length != 0) {
          s = ((saux + ", ") + s);
        } else {
          s = saux;
        }
      }
      if (((i == 0) || (i == 1)) && (s.length != 0)) {
        tem = true;
      }
      i = (i + 1);
    }
    if (s.length != 0) {
      if (umReal) {
        s = (s + " real");
      } else {
        if (tem) {
          s = (s + " reais");
        } else {
          s = (s + " de reais");
        }
      }
    }
    if (!(centavos == "0")) {
      if (s.length != 0) {
        s = (s + " e ");
      }
      if (centavos == "1") {
        s = (s + "um centavo");
      } else {
        n = int.tryParse(centavos, radix: 10);
        if (n! <= 19) {
          s = (s + unidade[n]);
        } else {
          unid = (n % 10);
          dez = (n ~/ 10);
          s = (s + dezena[dez]);
          if (unid != 0) {
            s = ((s + " e ") + unidade[unid]);
          }
        }
        s = (s + " centavos");
      }
    }
    return s;
  }
}
