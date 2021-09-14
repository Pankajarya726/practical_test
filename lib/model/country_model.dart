
import 'dart:convert';

class GetCountryResponse{

  GetCountryResponse({required this.countries});

  List<CountryModel> countries;

  factory GetCountryResponse.fromJson(String str) => GetCountryResponse.fromMap(json.decode(str));


  factory GetCountryResponse.fromMap(Map<String, dynamic> json) => GetCountryResponse(
  countries: json["data"] == null ? [] : List<CountryModel>.from(json["data"].map((x) => CountryModel.fromMap(x))),
  );



}

class CountryModel {
  CountryModel({
    required this.name,
    required this.topLevelDomain,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.callingCodes,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.population,
    required this.latlng,
    required this.demonym,
    required this.area,
    required this.gini,
    required this.timezones,
    required this.borders,
    required this.nativeName,
    required this.numericCode,
    required this.currencies,
    required this.languages,
    required this.translations,
    required this.flag,
    required this.regionalBlocs,
    required this.cioc,
  });

  String name;
  List<String> topLevelDomain;
  String alpha2Code;
  String alpha3Code;
  List<String> callingCodes;
  String capital;
  List<String> altSpellings;
  String region;
  String subregion;
  int population;
  List<double> latlng;
  String demonym;
  double area;
  double gini;
  List<String> timezones;
  List<String> borders;
  String nativeName;
  String numericCode;
  List<Currency> currencies;
  List<Language> languages;
  Translations? translations;
  String flag;
  List<RegionalBloc> regionalBlocs;
  String cioc;

  factory CountryModel.fromJson(String str) => CountryModel.fromMap(json.decode(str));


  factory CountryModel.fromMap(Map<String, dynamic> json) => CountryModel(
    name: json["name"] ?? "",
    topLevelDomain: json["topLevelDomain"] == null ? [] : List<String>.from(json["topLevelDomain"].map((x) => x)),
    alpha2Code: json["alpha2Code"] ?? "",
    alpha3Code: json["alpha3Code"] ?? "",
    callingCodes: json["callingCodes"] == null ? [] : List<String>.from(json["callingCodes"].map((x) => x)),
    capital: json["capital"] ?? "",
    altSpellings: json["altSpellings"] == null ? [] : List<String>.from(json["altSpellings"].map((x) => x)),
    region: json["region"]  ?? "",
    subregion: json["subregion"] ?? "",
    population: json["population"] ?? 0,
    latlng: json["latlng"] == null ? [] : List<double>.from(json["latlng"].map((x) => x.toDouble())),
    demonym: json["demonym"] ?? "",
    area: json["area"] == null ? 0.0 : json["area"].toDouble(),
    gini: json["gini"] == null ? 0.0 : json["gini"].toDouble(),
    timezones: json["timezones"] == null ? [] : List<String>.from(json["timezones"].map((x) => x)),
    borders: json["borders"] == null ? [] : List<String>.from(json["borders"].map((x) => x)),
    nativeName: json["nativeName"] ?? '',
    numericCode: json["numericCode"] ?? '',
    currencies: json["currencies"] == null ? [] : List<Currency>.from(json["currencies"].map((x) => Currency.fromMap(x))),
    languages: json["languages"] == null ? [] : List<Language>.from(json["languages"].map((x) => Language.fromMap(x))),
    translations: json["translations"] == null ? null : Translations.fromMap(json["translations"]),
    flag: json["flag"] ?? '',
    regionalBlocs: json["regionalBlocs"] == null ? [] : List<RegionalBloc>.from(json["regionalBlocs"].map((x) => RegionalBloc.fromMap(x))),
    cioc: json["cioc"] ?? '',
  );


}

class Currency {
  Currency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  String code;
  String name;
  String symbol;

  factory Currency.fromJson(String str) => Currency.fromMap(json.decode(str));


  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
    code: json["code"] ?? "",
    name: json["name"] ?? "",
    symbol: json["symbol"] ?? "",
  );

}

class Language {
  Language({
    required this.iso6391,
    required this.iso6392,
    required this.name,
    required this.nativeName,
  });

  String iso6391;
  String iso6392;
  String name;
  String nativeName;

  factory Language.fromJson(String str) => Language.fromMap(json.decode(str));


  factory Language.fromMap(Map<String, dynamic> json) => Language(
    iso6391: json["iso639_1"] ?? "",
    iso6392: json["iso639_2"] ?? "",
    name: json["name"] ?? "",
    nativeName: json["nativeName"] ?? "",
  );

}




class RegionalBloc {
  RegionalBloc({
    required this.acronym,
    required this.name,
    required this.otherAcronyms,
    required this.otherNames,
  });

  String acronym;
  String name;
  List<String> otherAcronyms;
  List<String> otherNames;

  factory RegionalBloc.fromJson(String str) => RegionalBloc.fromMap(json.decode(str));


  factory RegionalBloc.fromMap(Map<String, dynamic> json) => RegionalBloc(
    acronym: json["acronym"] ??"",
    name: json["name"] ??"",
    otherAcronyms: json["otherAcronyms"] == null ? [] : List<String>.from(json["otherAcronyms"].map((x) => x)),
    otherNames: json["otherNames"] == null ? [] : List<String>.from(json["otherNames"].map((x) => x)),
  );

}


class Translations {
  Translations({
    this.de,
    this.es,
    this.fr,
    this.ja,
    this.it,
    this.br,
    this.pt,
    this.nl,
    this.hr,
    this.fa,
  });

  String? de;
  String? es;
  String? fr;
  String? ja;
  String? it;
  String? br;
  String? pt;
  String? nl;
  String? hr;
  String? fa;

  factory Translations.fromJson(String str) => Translations.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Translations.fromMap(Map<String, dynamic> json) => Translations(
    de: json["de"] ?? "",
    es: json["es"] ?? "",
    fr: json["fr"] ?? "",
    ja: json["ja"] ?? "",
    it: json["it"] ?? "",
    br: json["br"] ?? "",
    pt: json["pt"] ?? "",
    nl: json["nl"] ?? "",
    hr: json["hr"] ?? "",
    fa: json["fa"] ?? "]",
  );

  Map<String, dynamic> toMap() => {
    "de": de ?? null,
    "es": es ?? null,
    "fr": fr ?? null,
    "ja": ja ?? null,
    "it": it ?? null,
    "br": br ?? null,
    "pt": pt ?? null,
    "nl": nl ?? null,
    "hr": hr ?? null,
    "fa": fa ?? null,
  };
}


