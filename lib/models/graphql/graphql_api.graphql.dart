// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class WineDetailed$Query$Catalog$Items$Suggestions$Shop with EquatableMixin {
  WineDetailed$Query$Catalog$Items$Suggestions$Shop();

  factory WineDetailed$Query$Catalog$Items$Suggestions$Shop.fromJson(
          Map<String, dynamic> json) =>
      _$WineDetailed$Query$Catalog$Items$Suggestions$ShopFromJson(json);

  @JsonKey(name: 'Name')
  String name;

  @override
  List<Object> get props => [name];
  Map<String, dynamic> toJson() =>
      _$WineDetailed$Query$Catalog$Items$Suggestions$ShopToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WineDetailed$Query$Catalog$Items$Suggestions with EquatableMixin {
  WineDetailed$Query$Catalog$Items$Suggestions();

  factory WineDetailed$Query$Catalog$Items$Suggestions.fromJson(
          Map<String, dynamic> json) =>
      _$WineDetailed$Query$Catalog$Items$SuggestionsFromJson(json);

  @JsonKey(name: 'URL')
  String url;

  @JsonKey(name: 'Price')
  int price;

  @JsonKey(name: 'Shop')
  WineDetailed$Query$Catalog$Items$Suggestions$Shop shop;

  @override
  List<Object> get props => [url, price, shop];
  Map<String, dynamic> toJson() =>
      _$WineDetailed$Query$Catalog$Items$SuggestionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WineDetailed$Query$Catalog$Items with EquatableMixin {
  WineDetailed$Query$Catalog$Items();

  factory WineDetailed$Query$Catalog$Items.fromJson(
          Map<String, dynamic> json) =>
      _$WineDetailed$Query$Catalog$ItemsFromJson(json);

  @JsonKey(name: 'UID')
  String uid;

  @JsonKey(name: 'Name')
  String name;

  @JsonKey(name: 'Colour', unknownEnumValue: Colour.artemisUnknown)
  Colour colour;

  @JsonKey(name: 'LowestPrice')
  int lowestPrice;

  @JsonKey(name: 'ImageURL')
  String imageURL;

  @JsonKey(name: 'Suggestions')
  List<WineDetailed$Query$Catalog$Items$Suggestions> suggestions;

  @override
  List<Object> get props =>
      [uid, name, colour, lowestPrice, imageURL, suggestions];
  Map<String, dynamic> toJson() =>
      _$WineDetailed$Query$Catalog$ItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WineDetailed$Query$Catalog with EquatableMixin {
  WineDetailed$Query$Catalog();

  factory WineDetailed$Query$Catalog.fromJson(Map<String, dynamic> json) =>
      _$WineDetailed$Query$CatalogFromJson(json);

  @JsonKey(name: 'Items')
  List<WineDetailed$Query$Catalog$Items> items;

  @override
  List<Object> get props => [items];
  Map<String, dynamic> toJson() => _$WineDetailed$Query$CatalogToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WineDetailed$Query with EquatableMixin {
  WineDetailed$Query();

  factory WineDetailed$Query.fromJson(Map<String, dynamic> json) =>
      _$WineDetailed$QueryFromJson(json);

  @JsonKey(name: 'Catalog')
  WineDetailed$Query$Catalog catalog;

  @override
  List<Object> get props => [catalog];
  Map<String, dynamic> toJson() => _$WineDetailed$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CatalogPaginated$Query$Catalog$Items with EquatableMixin {
  CatalogPaginated$Query$Catalog$Items();

  factory CatalogPaginated$Query$Catalog$Items.fromJson(
          Map<String, dynamic> json) =>
      _$CatalogPaginated$Query$Catalog$ItemsFromJson(json);

  @JsonKey(name: 'UID')
  String uid;

  @JsonKey(name: 'Name')
  String name;

  @JsonKey(name: 'Colour', unknownEnumValue: Colour.artemisUnknown)
  Colour colour;

  @JsonKey(name: 'Type', unknownEnumValue: Type.artemisUnknown)
  Type type;

  @JsonKey(name: 'LowestPrice')
  int lowestPrice;

  @JsonKey(name: 'ImageURL')
  String imageURL;

  @override
  List<Object> get props => [uid, name, colour, type, lowestPrice, imageURL];
  Map<String, dynamic> toJson() =>
      _$CatalogPaginated$Query$Catalog$ItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CatalogPaginated$Query$Catalog with EquatableMixin {
  CatalogPaginated$Query$Catalog();

  factory CatalogPaginated$Query$Catalog.fromJson(Map<String, dynamic> json) =>
      _$CatalogPaginated$Query$CatalogFromJson(json);

  @JsonKey(name: 'Items')
  List<CatalogPaginated$Query$Catalog$Items> items;

  @JsonKey(name: 'TotalItems')
  int totalItems;

  @override
  List<Object> get props => [items, totalItems];
  Map<String, dynamic> toJson() => _$CatalogPaginated$Query$CatalogToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CatalogPaginated$Query with EquatableMixin {
  CatalogPaginated$Query();

  factory CatalogPaginated$Query.fromJson(Map<String, dynamic> json) =>
      _$CatalogPaginated$QueryFromJson(json);

  @JsonKey(name: 'Catalog')
  CatalogPaginated$Query$Catalog catalog;

  @override
  List<Object> get props => [catalog];
  Map<String, dynamic> toJson() => _$CatalogPaginated$QueryToJson(this);
}

enum Colour {
  @JsonValue('Orange')
  orange,
  @JsonValue('Pink')
  pink,
  @JsonValue('Red')
  red,
  @JsonValue('White')
  white,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum Type {
  @JsonValue('Dry')
  dry,
  @JsonValue('SemiDry')
  semiDry,
  @JsonValue('SemiSweet')
  semiSweet,
  @JsonValue('Sweet')
  sweet,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class WineDetailedArguments extends JsonSerializable with EquatableMixin {
  WineDetailedArguments({@required this.uid});

  @override
  factory WineDetailedArguments.fromJson(Map<String, dynamic> json) =>
      _$WineDetailedArgumentsFromJson(json);

  final String uid;

  @override
  List<Object> get props => [uid];
  @override
  Map<String, dynamic> toJson() => _$WineDetailedArgumentsToJson(this);
}

class WineDetailedQuery
    extends GraphQLQuery<WineDetailed$Query, WineDetailedArguments> {
  WineDetailedQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'WineDetailed'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'uid')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'Catalog'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'filter'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'UID'),
                          value: VariableNode(name: NameNode(value: 'uid'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'Page'),
                          value: IntValueNode(value: '1')),
                      ObjectFieldNode(
                          name: NameNode(value: 'Limit'),
                          value: IntValueNode(value: '1'))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'Items'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'UID'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'Name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'Colour'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'LowestPrice'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'ImageURL'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'Suggestions'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'URL'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'Price'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'Shop'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'Name'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ]))
                          ]))
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'WineDetailed';

  @override
  final WineDetailedArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  WineDetailed$Query parse(Map<String, dynamic> json) =>
      WineDetailed$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CatalogPaginatedArguments extends JsonSerializable with EquatableMixin {
  CatalogPaginatedArguments(
      {@required this.page, @required this.limit, this.query});

  @override
  factory CatalogPaginatedArguments.fromJson(Map<String, dynamic> json) =>
      _$CatalogPaginatedArgumentsFromJson(json);

  final int page;

  final int limit;

  final String query;

  @override
  List<Object> get props => [page, limit, query];
  @override
  Map<String, dynamic> toJson() => _$CatalogPaginatedArgumentsToJson(this);
}

class CatalogPaginatedQuery
    extends GraphQLQuery<CatalogPaginated$Query, CatalogPaginatedArguments> {
  CatalogPaginatedQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'CatalogPaginated'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'page')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'limit')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'query')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'Catalog'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'filter'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'Page'),
                          value: VariableNode(name: NameNode(value: 'page'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'Limit'),
                          value: VariableNode(name: NameNode(value: 'limit'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'Query'),
                          value: VariableNode(name: NameNode(value: 'query')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'Items'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'UID'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'Name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'Colour'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'Type'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'LowestPrice'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'ImageURL'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ])),
                FieldNode(
                    name: NameNode(value: 'TotalItems'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'CatalogPaginated';

  @override
  final CatalogPaginatedArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CatalogPaginated$Query parse(Map<String, dynamic> json) =>
      CatalogPaginated$Query.fromJson(json);
}
