import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_toolchain/bloc/wines_paginated_bloc.dart';
import 'package:graphql_toolchain/bloc/graphql/event.dart';
import 'package:graphql_toolchain/bloc/graphql/state.dart';
import 'package:graphql_toolchain/graphql_provider.dart';
import 'package:graphql_toolchain/models/graphql/graphql_api.graphql.dart';
import 'package:graphql_toolchain/screens/wine.page.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  Completer<void> _refreshCompleter;
  WinesPaginatedBloc bloc;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    bloc = WinesPaginatedBloc(client: client);
  }

  Future _handleRefreshStart(WinesPaginatedBloc bloc) {
    bloc.add(GraphqlRefetchEvent<CatalogPaginated$Query>());
    return _refreshCompleter.future;
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  void _handleRefreshEnd() {
    _refreshCompleter?.complete();
    _refreshCompleter = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Каталог вин'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => _handleRefreshStart(bloc),
        child: BlocBuilder<WinesPaginatedBloc,
                GraphqlState<CatalogPaginated$Query>>(
            bloc: bloc,
            builder: (_, state) {
              Widget child = Container();

              if (state is GraphqlLoading) {
                child = Center(child: CircularProgressIndicator());
              }

              if (state is GraphqlErrorState<CatalogPaginated$Query>) {
                _handleRefreshEnd();
                child = ListView(children: [
                  Text(
                    parseOperationException(state.error),
                    style: TextStyle(color: Theme.of(context).errorColor),
                  )
                ]);
              }

              if (state is GraphqlLoaded || state is GraphqlFetchMoreState) {
                _handleRefreshEnd();
                final itemCount = state.data.catalog.items.length;
                String inputQuery;

                if (itemCount == 0) {
                  child = ListView(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.inbox),
                        SizedBox(width: 8),
                        Text('No data'),
                      ],
                    )
                  ]);
                } else {
                  child = Column(children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a search term'),
                      onChanged: (text) => {
                        if (text.isEmpty)
                          {bloc.getBaseRequest()}
                        else
                          {bloc.getByName(page: 1, limit: 20, query: text)},
                        inputQuery = text,
                      },
                    ),
                    Expanded(
                        child: ListView.separated(
                      separatorBuilder: (_, __) => SizedBox(
                        height: 8.0,
                      ),
                      key: PageStorageKey('reports'),
                      itemCount: itemCount,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == itemCount - 1 &&
                            state is GraphqlLoaded &&
                            inputQuery.isEmpty) {
                          bloc.fetchMore(
                              limit: 20, page: (itemCount / 20).round() + 1);
                        }

                        final wine = state.data.catalog.items[index];

                        Widget tile = Stack(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                WineDetailScreen.routeName,
                                arguments: wine.uid,
                              ),
                              child: _buildRow(wine),
                            )
                          ],
                        );

                        if (state is GraphqlFetchMoreState &&
                            index == itemCount - 1) {
                          tile = Column(
                            children: [
                              tile,
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: CircularProgressIndicator(),
                              ),
                            ],
                          );
                        }

                        return tile;
                      },
                    ))
                  ]);
                }
              }

              return AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: child,
              );
            }),
      ),
    );
  }
}

String parseOperationException(OperationException error) {
  if (error.graphqlErrors != null && error.graphqlErrors.isNotEmpty) {
    final errors = error.graphqlErrors;

    return errors.first.message;
  }

  return 'Unknown error';
}

Container _buildRow(CatalogPaginated$Query$Catalog$Items wine) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 10),
          color: Colors.grey.shade300,
          blurRadius: 30,
        ),
      ],
    ),
    padding: const EdgeInsets.all(20),
    child: Row(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: 100,
                width: 120,
                child: Image.network(wine.imageURL,
                    errorBuilder: (context, url, error) =>
                        new Icon(Icons.error),
                    fit: BoxFit.contain),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  wine.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF005288),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Лучшая цена",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                wine.lowestPrice.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Цвет",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                wine.colour.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Сахар",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                wine.type.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
