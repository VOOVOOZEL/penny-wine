import 'package:graphql_toolchain/bloc/graphql/bloc.dart';
import 'package:graphql_toolchain/bloc/graphql/event.dart';
import 'package:graphql_toolchain/models/graphql/graphql_api.dart';
import 'package:meta/meta.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class WinesPaginatedBloc extends GraphqlBloc<CatalogPaginated$Query> {
  WinesPaginatedBloc(
      {@required GraphQLClient client, WatchQueryOptions options})
      : super(
          client: client,
          options: options ??
              WatchQueryOptions(
                document: CatalogPaginatedQuery().document,
                variables: CatalogPaginatedArguments(
                  page: 1,
                  limit: 20,
                ).toJson(),
              ),
        );

  @override
  CatalogPaginated$Query parseData(Map<String, dynamic> data) {
    return CatalogPaginated$Query.fromJson(data);
  }

  void fetchMore({@required int page, @required int limit, String query}) {
    add(GraphqlFetchMoreEvent(
        options: FetchMoreOptions(
      variables: CatalogPaginatedArguments(
        page: page,
        limit: limit,
        query: query,
      ).toJson(),
      updateQuery: (dynamic previousResultData, dynamic fetchMoreResultData) {
        final List<dynamic> repos = <dynamic>[
          ...previousResultData['Catalog']['Items'] as List<dynamic>,
          ...fetchMoreResultData['Catalog']['Items'] as List<dynamic>
        ];

        fetchMoreResultData['Catalog']['Items'] = repos;

        return fetchMoreResultData;
      },
    )));
  }

  void getByName({@required int page, @required int limit, String query}) {
    add(GraphqlFetchMoreEvent(
        options: FetchMoreOptions(
          variables: CatalogPaginatedArguments(
            page: page,
            limit: limit,
            query: query,
          ).toJson(),
          updateQuery: (dynamic previousResultData, dynamic fetchMoreResultData) {
            final List<dynamic> repos = <dynamic>[
              ...fetchMoreResultData['Catalog']['Items'] as List<dynamic>
            ];

            fetchMoreResultData['Catalog']['Items'] = repos;

            return fetchMoreResultData;
          },
        )));
  }

  void getBaseRequest() {
    add(GraphqlFetchMoreEvent(
        options: FetchMoreOptions(
          variables: CatalogPaginatedArguments(
            page: 1,
            limit: 20,
          ).toJson(),
          updateQuery: (dynamic previousResultData, dynamic fetchMoreResultData) {
            final List<dynamic> repos = <dynamic>[
              ...fetchMoreResultData['Catalog']['Items'] as List<dynamic>
            ];

            fetchMoreResultData['Catalog']['Items'] = repos;

            return fetchMoreResultData;
          },
        )));
  }
}
