import 'package:bitcoin_tracker/models/bitcoin_details.dart';
import 'package:bitcoin_tracker/services/http_service.dart';
import 'package:bitcoin_tracker/utils/string_utils.dart';
import 'package:flutter/material.dart';

class BitcoinDetailsProvider with ChangeNotifier {
  final HttpService _httpService = HttpService();
  List<String> currencyArr = ["EUR", "GBP", "USD"];
  List<Currency> currencyList = [];
  String price = StringUtils.price;
  BitcoinDetails? bitcoinDetails;
  bool loading = false;

  // Get bitcoin price details to provider
  Future<BitcoinDetails?> getBitcoinDetails() async {
    currencyList.clear();
    loading = true;
    Future.delayed(const Duration(milliseconds: 200), () async {
      final res = await _httpService.callBitcoinDetails();
      bitcoinDetails = bitcoinDetailsFromJson(res);
      currencyList.addAll([
        bitcoinDetails!.bpi.eur,
        bitcoinDetails!.bpi.gbp,
        bitcoinDetails!.bpi.usd,
      ]);
      updatePriceValue(0);
      loading = false;
      notifyListeners();
    });
    notifyListeners();
    return bitcoinDetails;
  }

  // Update the price value when currency is changed
  updatePriceValue(int index) {
    price = currencyList[index].rateFloat.toString();
    notifyListeners();
  }
}
