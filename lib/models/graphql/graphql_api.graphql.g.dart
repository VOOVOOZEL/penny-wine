// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WineDetailed$Query$Catalog$Items$Suggestions$Shop
    _$WineDetailed$Query$Catalog$Items$Suggestions$ShopFromJson(
        Map<String, dynamic> json) {
  return WineDetailed$Query$Catalog$Items$Suggestions$Shop()
    ..name = json['Name'] as String;
}

Map<String, dynamic> _$WineDetailed$Query$Catalog$Items$Suggestions$ShopToJson(
        WineDetailed$Query$Catalog$Items$Suggestions$Shop instance) =>
    <String, dynamic>{
      'Name': instance.name,
    };

WineDetailed$Query$Catalog$Items$Suggestions
    _$WineDetailed$Query$Catalog$Items$SuggestionsFromJson(
        Map<String, dynamic> json) {
  return WineDetailed$Query$Catalog$Items$Suggestions()
    ..url = json['URL'] as String
    ..price = json['Price'] as int
    ..shop = json['Shop'] == null
        ? null
        : WineDetailed$Query$Catalog$Items$Suggestions$Shop.fromJson(
            json['Shop'] as Map<String, dynamic>);
}

Map<String, dynamic> _$WineDetailed$Query$Catalog$Items$SuggestionsToJson(
        WineDetailed$Query$Catalog$Items$Suggestions instance) =>
    <String, dynamic>{
      'URL': instance.url,
      'Price': instance.price,
      'Shop': instance.shop?.toJson(),
    };

WineDetailed$Query$Catalog$Items _$WineDetailed$Query$Catalog$ItemsFromJson(
    Map<String, dynamic> json) {
  return WineDetailed$Query$Catalog$Items()
    ..uid = json['UID'] as String
    ..name = json['Name'] as String
    ..colour = _$enumDecodeNullable(_$ColourEnumMap, json['Colour'],
        unknownValue: Colour.artemisUnknown)
    ..lowestPrice = json['LowestPrice'] as int
    ..imageURL = json['ImageURL'] as String
    ..suggestions = (json['Suggestions'] as List)
        ?.map((e) => e == null
            ? null
            : WineDetailed$Query$Catalog$Items$Suggestions.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$WineDetailed$Query$Catalog$ItemsToJson(
        WineDetailed$Query$Catalog$Items instance) =>
    <String, dynamic>{
      'UID': instance.uid,
      'Name': instance.name,
      'Colour': _$ColourEnumMap[instance.colour],
      'LowestPrice': instance.lowestPrice,
      'ImageURL': instance.imageURL,
      'Suggestions': instance.suggestions?.map((e) => e?.toJson())?.toList(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ColourEnumMap = {
  Colour.orange: 'Orange',
  Colour.pink: 'Pink',
  Colour.red: 'Red',
  Colour.white: 'White',
  Colour.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

WineDetailed$Query$Catalog _$WineDetailed$Query$CatalogFromJson(
    Map<String, dynamic> json) {
  return WineDetailed$Query$Catalog()
    ..items = (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : WineDetailed$Query$Catalog$Items.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$WineDetailed$Query$CatalogToJson(
        WineDetailed$Query$Catalog instance) =>
    <String, dynamic>{
      'Items': instance.items?.map((e) => e?.toJson())?.toList(),
    };

WineDetailed$Query _$WineDetailed$QueryFromJson(Map<String, dynamic> json) {
  return WineDetailed$Query()
    ..catalog = json['Catalog'] == null
        ? null
        : WineDetailed$Query$Catalog.fromJson(
            json['Catalog'] as Map<String, dynamic>);
}

Map<String, dynamic> _$WineDetailed$QueryToJson(WineDetailed$Query instance) =>
    <String, dynamic>{
      'Catalog': instance.catalog?.toJson(),
    };

CatalogPaginated$Query$Catalog$Items
    _$CatalogPaginated$Query$Catalog$ItemsFromJson(Map<String, dynamic> json) {
  return CatalogPaginated$Query$Catalog$Items()
    ..uid = json['UID'] as String
    ..name = json['Name'] as String
    ..colour = _$enumDecodeNullable(_$ColourEnumMap, json['Colour'],
        unknownValue: Colour.artemisUnknown)
    ..type = _$enumDecodeNullable(_$TypeEnumMap, json['Type'],
        unknownValue: Type.artemisUnknown)
    ..lowestPrice = json['LowestPrice'] as int
    ..imageURL = json['ImageURL'] as String;
}

Map<String, dynamic> _$CatalogPaginated$Query$Catalog$ItemsToJson(
        CatalogPaginated$Query$Catalog$Items instance) =>
    <String, dynamic>{
      'UID': instance.uid,
      'Name': instance.name,
      'Colour': _$ColourEnumMap[instance.colour],
      'Type': _$TypeEnumMap[instance.type],
      'LowestPrice': instance.lowestPrice,
      'ImageURL': instance.imageURL,
    };

const _$TypeEnumMap = {
  Type.dry: 'Dry',
  Type.semiDry: 'SemiDry',
  Type.semiSweet: 'SemiSweet',
  Type.sweet: 'Sweet',
  Type.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

CatalogPaginated$Query$Catalog _$CatalogPaginated$Query$CatalogFromJson(
    Map<String, dynamic> json) {
  return CatalogPaginated$Query$Catalog()
    ..items = (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : CatalogPaginated$Query$Catalog$Items.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..totalItems = json['TotalItems'] as int;
}

Map<String, dynamic> _$CatalogPaginated$Query$CatalogToJson(
        CatalogPaginated$Query$Catalog instance) =>
    <String, dynamic>{
      'Items': instance.items?.map((e) => e?.toJson())?.toList(),
      'TotalItems': instance.totalItems,
    };

CatalogPaginated$Query _$CatalogPaginated$QueryFromJson(
    Map<String, dynamic> json) {
  return CatalogPaginated$Query()
    ..catalog = json['Catalog'] == null
        ? null
        : CatalogPaginated$Query$Catalog.fromJson(
            json['Catalog'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CatalogPaginated$QueryToJson(
        CatalogPaginated$Query instance) =>
    <String, dynamic>{
      'Catalog': instance.catalog?.toJson(),
    };

WineDetailedArguments _$WineDetailedArgumentsFromJson(
    Map<String, dynamic> json) {
  return WineDetailedArguments(
    uid: json['uid'] as String,
  );
}

Map<String, dynamic> _$WineDetailedArgumentsToJson(
        WineDetailedArguments instance) =>
    <String, dynamic>{
      'uid': instance.uid,
    };

CatalogPaginatedArguments _$CatalogPaginatedArgumentsFromJson(
    Map<String, dynamic> json) {
  return CatalogPaginatedArguments(
    page: json['page'] as int,
    limit: json['limit'] as int,
    query: json['query'] as String,
  );
}

Map<String, dynamic> _$CatalogPaginatedArgumentsToJson(
        CatalogPaginatedArguments instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'query': instance.query,
    };
