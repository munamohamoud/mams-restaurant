import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'AppInfo.dart';
import 'Profile.dart';
import 'SearchNotFound.dart';
import 'searchResults.dart';
import 'package:dio/dio.dart';
import 'restaurant.dart';
import 'restList.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key, required this.title}) : super(key: key);

  final String title;
  final dio = Dio(BaseOptions(
    baseUrl:
        "https://cors-anywhere.herokuapp.com/https://api.yelp.com/v3/businesses/search",
    headers: {
      "accept": "application/json",
      "x-requested-with": "xmlhttprequest",
      "Access-Control-Allow-Origin": "*",
      'Authorization':
          //TODO hide api key!
          'Bearer OG2Uf3p1mYIEHzB_5eed5z0pSbPBxWfT8IJsKv9sxKNudokXhKzJIeVYUHpzeBJ0UtCunknNG714ewhZEC12jNWn9fl5E8X-0oFbi-QzyG7CgkqDTMwt43tZt2ZmYnYx',
    },
  ));

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List? _restaurants;
  void searchRestaurants(String query) async {
    final response = await widget.dio.get(
      '',
      queryParameters: {
        'term': 'restaurants',
        'radius': 10000,
        'limit': 10,
        'location': "Atlanta",
        'categories': query,
      },
    );
    setState(() {
      _restaurants = response.data['businesses'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchForm(
              onSearch: searchRestaurants,
            ),
            _restaurants == null
                ? Expanded(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.search,
                        color: Colors.black12,
                        size: 110,
                      ),
                      Text(
                        "No results to display",
                        style: TextStyle(
                          color: Colors.black12,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ))
                : Expanded(
                    child: ListView(
                      children: _restaurants!.map((businesses) {
                        return ListTile(
                          title: Text(businesses['name']),
                          subtitle: Text(businesses['location']['address1']),
                          trailing: Text('${businesses['rating']} stars, '
                              '${businesses['review_count']} reviews'),
                        );
                      }).toList(),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
