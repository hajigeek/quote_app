import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/api/quote.dart';
import 'package:http/http.dart';
import 'package:helloworld/ui/Quote_screen.dart';

class PracLoading extends StatefulWidget {
  _PracLoadingState createState() => _PracLoadingState();
}

class _PracLoadingState extends State<PracLoading> {
  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }

  void getData() async {
    Quotes quotes = Quotes();
    await quotes.getQuotes();
    List data = quotes.ReadQuotes();
    Navigator.push(context, MaterialPageRoute(builder: (context) => QuoteList(data: data)));
  }
}
