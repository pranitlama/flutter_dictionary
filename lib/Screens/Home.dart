import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({super.key});

  Future<dynamic> getname() async {
    var url = Uri.https('api.dictionaryapi.dev', '/api/v2/entries/en/human');
    var res = await http.get(url);

    if (res.statusCode == 200) {
      var data = convert.jsonDecode(res.body);
      // print(data[0]['phonetic']);
      return (data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getname(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      snapshot.data[0]['word'],
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data[0]['meanings'][0]['partOfSpeech'],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    Text(
                      snapshot.data[0]['phonetic'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Text(
                    snapshot.data[0]['meanings'][0]['definitions'][0]['definition'],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.black, // Border color
                        width: 3, // Border width
                      ),
                    ),
                  ),
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    snapshot.data[0]['meanings'][0]['definitions'][0]['example'],
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: 10),
                Align(

                alignment: Alignment.centerLeft,
              child:  Text(

                  snapshot.data[0]['meanings'][1]['partOfSpeech'],
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Text(
                    snapshot.data[0]['meanings'][1]['definitions'][0]['definition'],
                  ),
                ),
                SizedBox(height: 10),
                Align(

                alignment: Alignment.centerLeft,
                child:Text(
                  snapshot.data[0]['meanings'][2]['partOfSpeech'],
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Text(
                    snapshot.data[0]['meanings'][2]['definitions'][0]['definition'],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

