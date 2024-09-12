import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
final coinApiKey = dotenv.env['COIN_API_KEY'];

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    try {
      Map<String, String> cryptoPrices = {};
      for (String crypto in cryptoList) {
        String requestURL =
            '$coinAPIURL/$crypto/$selectedCurrency?apikey=$coinApiKey';

        final uriObject = Uri.parse(requestURL);

        http.Response response = await http.get(uriObject);

        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          double price = decodedData['rate'];
          cryptoPrices[crypto] = price.toStringAsFixed(0);
        } else {
          print(response.statusCode);
          throw 'Problem with the get request';
        }
      }
      return cryptoPrices;
    } catch (e) {
      rethrow;
    }
  }
}
