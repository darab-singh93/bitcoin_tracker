import 'package:bitcoin_tracker/services/api_service.dart';
import 'package:bitcoin_tracker/services/http_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'http_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('HttpService', () {
    late HttpService httpService;
    late http.Client httpClient;

    setUp(() {
      httpClient = MockClient();
      httpService = HttpService(httpClient: httpClient);
    });

    test('callBitcoinDetails returns response body on success', () async {
      // Mock json to test
      String mockJsonStr = '{"time":{"updated":"Jul 15, 2023 11:01:00 UTC","updatedISO":"2023-07-15T11:01:00+00:00","updateduk":"Jul 15, 2023 at 12:01 BST"},"disclaimer":"This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org","chartName":"Bitcoin","bpi":{"USD":{"code":"USD","symbol":"&#36;","rate":"30,343.3176","description":"United States Dollar","rate_float":30343.3176},"GBP":{"code":"GBP","symbol":"&pound;","rate":"25,354.6334","description":"British Pound Sterling","rate_float":25354.6334},"EUR":{"code":"EUR","symbol":"&euro;","rate":"29,558.8215","description":"Euro","rate_float":29558.8215}}}';
      when(httpClient.get(Uri.parse(APIService.currentPrice)))
          .thenAnswer((_) async => http.Response(mockJsonStr, 200));
      // Act
      final result = await httpService.callBitcoinDetails();
      // Assert
      // Test when get response is in String
      expect(result, isA<String>());
    });
  });
}
