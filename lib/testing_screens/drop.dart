import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Drop extends StatefulWidget {
  const Drop({Key? key}) : super(key: key);

  @override
  _DropState createState() => _DropState();
}

class _DropState extends State<Drop> {

  Map? mapResponse;
  List? listResponse;

  Future _getServices() async{
    String url = "https://dev.localyour.com/customer/api/get-all-services?location_id=1";
    http.Response response;
    response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      setState(() {
        mapResponse = jsonDecode(response.body);
        listResponse = mapResponse!["data"];
      });
    }
    @override
    initState(){
      super.initState();
      this._getServices();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:    GridView.builder(
          shrinkWrap: true,
          itemCount: listResponse==null ? 0 : listResponse!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ), itemBuilder: (context , index)=>
          Container(
            height: 100,
          child: Column(
            children: [
              Image.network(listResponse![index]["service_image_url"])
            ],
          ),

          )
      ),
    );
  }
}


