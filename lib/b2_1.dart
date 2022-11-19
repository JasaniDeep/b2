import 'package:b2/b2_get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class b2_1 extends StatefulWidget {
  const b2_1({Key? key}) : super(key: key);
  @override
  State<b2_1> createState() => _b2_1State();
}

class _b2_1State extends State<b2_1> {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("b2_1"),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Select Category",style: TextStyle(fontSize: 20),),
          ),
          Container(
            // padding: const EdgeInsets.only(top: 5),
            width: 300,
            margin: EdgeInsets.fromLTRB(10, 10,10, 0),
            decoration: BoxDecoration(
                color: Colors.grey,
              border: Border.all(
                  color: Colors.white10,
                  width: 1,
                  style: BorderStyle.solid
              ),
                // borderRadius: BorderRadius.circular(30)
              ),
            child: DropdownButton(
              isExpanded: true,
              underline: DropdownButtonHideUnderline(child: SizedBox()),
              // Initial Value
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("NAME",style: TextStyle(fontSize: 20),),
          ),
          TextField(
            controller: t1,
            decoration: InputDecoration(
              focusColor: Colors.grey,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("MRP",style: TextStyle(fontSize: 20),),
          ),
          TextField(
            controller: t2,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
            ),
            keyboardType: TextInputType.number,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Description",style: TextStyle(fontSize: 20),),
          ),
          TextField(
            controller: t3,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
            ),
          ),
          ElevatedButton(onPressed: () async {
            String item=dropdownvalue;
            String name=t1.text;
            String description=t3.text;
            String mrp=t2.text;
            var url = Uri.parse('https://jdflutter.000webhostapp.com/b2_insert.php?cat_type=$item&prod_name=$name&cat_description=$description&cat_mrp=$mrp');
            var response = await http.get(url);
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');
            setState((){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
               return b2_get();
              },));
            });
          }, child: Text("submit"))
        ],
      ),
    );
  }
}
