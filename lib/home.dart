import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double pre = 0.0;
  void fetchAlbum(double predt) {
    var url = "http://192.168.0.2:5000/gopal?value=$predt";
    http.get(Uri.parse(url)).then((value) {
      print(value.body);
      setState(() {
        pre = jsonDecode(value.body)["name"];
      });

      print(jsonDecode(value.body)["name"]);
    });
  }

  final control = TextEditingController();
  double predt = 0.0;
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: Form(
          key: key,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(pre.toString()),
                TextFormField(
                  onChanged: (val) {
                    if (val != null) {
                      predt = double.parse(val.toString());
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        key.currentState!.save();
                        fetchAlbum(predt);
                      }
                    },
                    child: Text("Predict"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
