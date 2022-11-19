import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class b2_get extends StatefulWidget {
  const b2_get({Key? key}) : super(key: key);
  @override
  State<b2_get> createState() => _b2_getState();
}
class _b2_getState extends State<b2_get> {
  List data=[];
  @override
  void initState() {
    super.initState();
    get();
  }
  // String str = "";
  get() async {
    var url = Uri.parse('https://jdflutter.000webhostapp.com/b2_get.php');
    var response = await http.get(url);
    setState(() {
      data = jsonDecode(response.body);
    });
    print(data[1]["title"]);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return "Success!";
    // return v;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("b1_getdata"),
      ),
      body:  ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
              elevation: 5,
              shadowColor: Colors.black,
              margin: EdgeInsets.all(5),
              child:ExpansionTile(
                title:Text("Name : ${data[index]["name"]} "),
                leading: Text(data[index]["id"]),
                subtitle: Text("item : ${data[index]["item"]}  Mrp : ${data[index]["mrp"]}"),
                children: [
                  ListTile(
                    title:Text("description : ${data[index]["desctripton"]}"),
                  )
                ],
              )
          );
        },
      ),
    );
  }
}
