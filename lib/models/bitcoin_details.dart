import 'dart:convert';

BitcoinDetails bitcoinDetailsFromJson(String str) => BitcoinDetails.fromJson(json.decode(str));

String bitcoinDetailsToJson(BitcoinDetails data) => json.encode(data.toJson());

class BitcoinDetails {
  final Time time;
  final String disclaimer;
  final String chartName;
  final Bpi bpi;

  BitcoinDetails({
    required this.time,
    required this.disclaimer,
    required this.chartName,
    required this.bpi,
  });

  factory BitcoinDetails.fromJson(Map<String, dynamic> json) => BitcoinDetails(
    time: Time.fromJson(json["time"]),
    disclaimer: json["disclaimer"],
    chartName: json["chartName"],
    bpi: Bpi.fromJson(json["bpi"]),
  );

  Map<String, dynamic> toJson() => {
    "time": time.toJson(),
    "disclaimer": disclaimer,
    "chartName": chartName,
    "bpi": bpi.toJson(),
  };
}

class Bpi {
  final Currency usd;
  final Currency gbp;
  final Currency eur;

  Bpi({
    required this.usd,
    required this.gbp,
    required this.eur,
  });

  factory Bpi.fromJson(Map<String, dynamic> json) => Bpi(
    usd: Currency.fromJson(json["USD"]),
    gbp: Currency.fromJson(json["GBP"]),
    eur: Currency.fromJson(json["EUR"]),
  );

  Map<String, dynamic> toJson() => {
    "USD": usd.toJson(),
    "GBP": gbp.toJson(),
    "EUR": eur.toJson(),
  };
}

class Currency {
  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rateFloat;

  Currency({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    code: json["code"],
    symbol: json["symbol"],
    rate: json["rate"],
    description: json["description"],
    rateFloat: json["rate_float"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "symbol": symbol,
    "rate": rate,
    "description": description,
    "rate_float": rateFloat,
  };
}

class Time {
  final String updated;
  final DateTime updatedIso;
  final String updatedUk;

  Time({
    required this.updated,
    required this.updatedIso,
    required this.updatedUk,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    updated: json["updated"],
    updatedIso: DateTime.parse(json["updatedISO"]),
    updatedUk: json["updateduk"],
  );

  Map<String, dynamic> toJson() => {
    "updated": updated,
    "updatedISO": updatedIso.toIso8601String(),
    "updateduk": updatedUk,
  };
}
