import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestDeals extends StatefulWidget {

  @override
  State<BestDeals> createState() => _BestDealsState();
}

class _BestDealsState extends State<BestDeals> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
         appBar: AppBar(
           centerTitle: true,
           backgroundColor: Color(
             0xffC0242D,
           ),
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.clear
            ),
            onPressed: () {},
          ),
          title:
                  Text(
                    "Best Deals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 22,
                      color: Colors.white,
                    ),
            ),
          ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade500
                    )
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/renovation.png"),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                          "Renovation Service",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.poppins().fontFamily,

                        ),
                      ),
                    ],
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Container(
                    height: 80,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.grey.shade500
                        )
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/renovation.png"),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Renovation Service",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 80,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.grey.shade500
                        )
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/renovation.png"),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Renovation Service",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.poppins().fontFamily,

                          ),
                        ),
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Container(
                    height: 80,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.grey.shade500
                        )
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/renovation.png"),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Renovation Service",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.poppins().fontFamily,

                          ),
                        ),
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 80,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.grey.shade500
                        )
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/renovation.png"),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Renovation Service",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Container(
                    height: 80,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.grey.shade500
                        )
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/renovation.png"),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Renovation Service",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ],
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10,left: 6,right: 6),
                child: Container(
                  width: 500,
                  height: 150,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Can't Find The Service You Want ?",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 210,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "CLICK HERE",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.phone_fill,
                              color: Colors.white,
                              size: 28,
                            ),
                            Text(
                              "  003  800  456  789",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 193, 36, 45),
                  ),
                ),
              ),
            ],
          )

        ),
         ),
    );
  }
}
