import 'package:intl/intl.dart';

class UtilsServices {

  // Formatação de moedas
  priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: "pt_BR");
    return numberFormat.format(price);
  }

}