import 'dart:developer';
import 'package:bitcoin_tracker/utils/http_log.dart';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class HttpService {
  final http.Client? httpClient;

  HttpService({this.httpClient});

  // Function to get bitcoin pricing details
  Future<String> callBitcoinDetails() async {
    try {
      final res = await http.get(
        Uri.parse(APIService.currentPrice),
      );
      HttpLog.displayResponse(res: res, requestType: "GET",);
      return res.body;
    } catch (e) {
      log('Exception Occurred: $e');
      throw e.toString();
    }
  }
}
