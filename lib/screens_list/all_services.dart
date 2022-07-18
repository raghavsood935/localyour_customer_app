import 'package:flutter/material.dart';

class AllServicesView extends StatefulWidget {
  @override
  _AllServicesViewState createState() => _AllServicesViewState();
}

class _AllServicesViewState extends State<AllServicesView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(
            0xffC0242D,
          ),
          centerTitle: false,
          leading: Icon(
            Icons.location_on_outlined,
            size: 25,
            color: Colors.white,
          ),
          title: Row(
            children: [
              Text(
                'Khardah,Rahara,Kolkata-700118',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              Spacer(),
              Text(
                'All  Services',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          actions: [],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            GridView.count(
              childAspectRatio: 1,
              crossAxisCount: 3,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/pest.png')),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Pest control service',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/renovation.png')),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Renovation service',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/plumbing.png')),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Plumbing service',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/masonary.png')),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Masonary service',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/pest.png')),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Pest control service',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/electrical.png')),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Electrical service',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/carpenter.png')),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Carpentary service',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/acservice.png')),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Ac service & repair',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Card(
              color: Color(0xffC0242D),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    children: [
                      Text(
                        'Cant find the service you want?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 30,
                        width: 200,
                        child: Center(
                          child: Text(
                            'Click Here',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 30,
                        width: 200,
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 25,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '033 800 456 789',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
