import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurantapp/home_screen.dart';
import 'dart:ui' as ui;
import 'AppInfo.dart';
import 'Profile.dart';
import 'SearchNotFound.dart';
import 'searchResults.dart';
import 'package:dio/dio.dart';

class SearchForm extends StatefulWidget {
  SearchForm({required this.onSearch});

  final void Function(String search) onSearch;
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();
  var _autoValidate = AutovalidateMode.disabled;
  var _search;
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidate,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Enter Search",
                border: OutlineInputBorder(),
                filled: true,
                errorStyle: TextStyle(fontSize: 15),
              ),
              onChanged: (value) {
                _search = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a search term";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    widget.onSearch(_search);
                  } else {
                    setState(() {
                      _autoValidate = AutovalidateMode.always;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Text Color
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
