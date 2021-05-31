import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_toolchain/models/graphql/graphql_api.graphql.dart';
import 'package:url_launcher/url_launcher.dart';

class WineDetailScreen extends StatelessWidget {
  static const routeName = '/wine';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final wineUID = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple example'),
      ),
      body: Query(
        options: QueryOptions(
          variables: {
            'uid': wineUID,
          },
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          document: WineDetailedQuery().document,
        ),
        builder: (
          QueryResult result, {
          Future<QueryResult> Function() refetch,
          FetchMore fetchMore,
        }) {
          print(result.source);
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final wine =
              WineDetailed$Query.fromJson(result.data).catalog.items[0];
          final suggestions = wine.suggestions;

          return Container(
            margin: EdgeInsets.all(25.0),
            child: Column(
              children: [
                Image.network(
                  wine.imageURL,
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  wine.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF005288),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Доступные варианты:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF005288),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.centerLeft,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 12),
                            Text(
                              "Название магазина",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Text(
                              suggestions[index].shop.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Цена",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Text(
                              suggestions[index].price.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            InkWell(
                                child: new Text('Перейти в магазин'),
                                onTap: () async {
                                  String url = suggestions[index].url;

                                  if (await canLaunch(url)) {
                                    await launch(url, forceSafariVC: false);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: suggestions.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}