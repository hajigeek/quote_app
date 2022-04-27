import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import 'package:flutter_share/flutter_share.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/services.dart';

class QuoteList extends StatefulWidget {
  final List data;
  const QuoteList({key, this.data}) : super(key: key);
  _QuoteListState createState() => _QuoteListState(data);
}

class _QuoteListState extends State<QuoteList> {
  int index = Random().nextInt(1643) + 1;
  void getRandom() {
    index = Random().nextInt(1643) + 1;
  }

//randomize background color
  List colors = [
    Color(0xff8940FE),
    Color(0xffC00E49),
    Color(0xff562671)
  ];
  Random random = new Random();

  int indexColor = 0;

  void changeIndex() {
    setState(() => indexColor = random.nextInt(3));
    print(indexColor);
  }

  void showToast(BuildContext context) {
    CherryToast.success(autoDismiss: true, toastDuration: Duration(milliseconds: 1000), title: Text('Copied')).show(context);
  }

  int counter = 1;
  // Obtain shared preferences.

  final List data;

  _QuoteListState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors[indexColor],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 100),
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: colors[indexColor],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Flexible(
                          child: SelectableText(
                            data[index % data.length]['text'].toString(),
                            style: TextStyle(color: Colors.grey[200], fontSize: 23, fontFamily: 'Rakkas', letterSpacing: 1.5),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('- ${data[index % data.length]['author'].toString()}', style: TextStyle(letterSpacing: 1.5, color: Colors.grey[200], fontSize: 15)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: data[index]['text']));
                    showToast(context);
                  },
                  icon: Icon(
                    Icons.content_copy_outlined,
                    color: Colors.grey[200],
                    size: 50,
                  )),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: FlatButton.icon(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Icon(Icons.shortcut_rounded, color: Colors.grey[200]),
                  ),
                  onPressed: () {
                    setState(() {
                      getRandom();
                      changeIndex();
                    });
                  },
                  label: Padding(
                    padding: const EdgeInsets.only(right: 14.0, top: 10, bottom: 10),
                    child: Text('Random Quote', style: TextStyle(wordSpacing: 3, color: Colors.grey[200], fontSize: 20)),
                  ),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid), borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
          ],
        ));
  }
}
