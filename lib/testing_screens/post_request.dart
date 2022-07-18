import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'dart:async';


class PostREquest extends StatefulWidget {
  const PostREquest({Key? key}) : super(key: key);

  @override
  _PostREquestState createState() => _PostREquestState();
}

class _PostREquestState extends State<PostREquest> {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  postData() async{
    final String? url = "https://dev.localyour.com/customer/api/customer-profile";
    http.Response response = await http.post(Uri.parse(url!),
        body: {

        }
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC0242D),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginbackground.png'),
            fit: BoxFit.fill
          )
        ),
        padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Edit Profile',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 50,),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "email",
                    suffixIcon: Icon(Icons.email,size: 20,),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: phoneController,

                decoration: InputDecoration(
                    labelText: "Phone",
                    suffixIcon: Icon(Icons.phone,size: 20,),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              SizedBox(height: 50,),
             Container(
               height: 50,
               width: double.infinity,
               // decoration: BoxDecoration(
               //     borderRadius: BorderRadius.circular(20)
               // ),
               child: ElevatedButton(
                   onPressed: (){

                   },
                   style: ElevatedButton.styleFrom(
                     primary: Color(0xffC0242D)
                   ),
                   child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
             )

            ],
          )
      ),
    );
  }
}
