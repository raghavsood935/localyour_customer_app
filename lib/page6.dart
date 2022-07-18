import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page6 extends StatefulWidget {
  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 65,
                  width: 500,
                  child: Center(
                    child: Text(
                      "Refrigerator Repair",
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 193, 36, 45),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Container(
                    width: 500,
                    height: 160,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/Rectangle 53.png",
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Container(
                    width: 500,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(children: [
                            Image.asset(
                              "assets/images/Rectangle 131.png",
                              height: 75,
                              width: 75,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Single Door",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54),
                            )
                          ]),
                          SizedBox(
                            width: 7,
                          ),
                          Column(children: [
                            Image.asset(
                              "assets/images/Rectangle 64.png",
                              height: 75,
                              width: 75,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Double Door",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            )
                          ]),
                          SizedBox(
                            width: 7,
                          ),
                          Column(children: [
                            Image.asset(
                              "assets/images/Rectangle 132.png",
                              height: 75,
                              width: 75,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Side By Side",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54),
                            )
                          ]),
                          SizedBox(
                            width: 7,
                          ),
                          Column(children: [
                            Image.asset(
                              "assets/images/Rectangle 133.png",
                              height: 75,
                              width: 75,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Small Fridge",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54),
                            )
                          ]),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    width: 500,
                    height: 140,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Can't Find Your Service ?",
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
                Padding(
                  padding: EdgeInsets.only(
                    left: 7,
                    right: 7,
                    top: 2,
                  ),
                  child: Container(
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Service Overview",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "Do you seek professional assistance that is just a call away and repair your refrigerator as and when Required? If the answer is yes then LocalYour is the right place to approach.We ensure that the undertaken repairing work is completed properly and precisely.Economical and functional our provided solutions are best than other service providers.",
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            "Features",
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, right: 10),
                          child: Text(
                            "1) Expert Cleaner\n\n2) Usage Of Professional Cleaning Tools\n\n3) Reasonable Price\n\n4) Service Warranty\n\n5) Removal of deep",
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "How To Order",
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.home,
                                  size: 27,
                                  color: Color.fromARGB(255, 193, 36, 45),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Select\nService",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 14,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.arrow_forward_sharp),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 27,
                                  color: Color.fromARGB(255, 193, 36, 45),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Choose Your\n\t\t\tTime Slot",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 14,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.arrow_forward_sharp),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.call,
                                  size: 27,
                                  color: Color.fromARGB(255, 193, 36, 45),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Hassle Free\n\t\t\tService",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 14,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                              "FAQ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.poppins().fontFamily),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.grey.shade400),
                                  color: Colors.grey.shade100),
                              child: ExpansionTile(
                                title: Text(
                                  "Does My Refrigerator Need Maintenance Or Repair?",
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                                children: [
                                  Container(
                                    child: Text(
                                      "If You Face Any Problem Related To Your Refrigerator Then Book Our Technician Through Localyour Website Or Mobile Apps. One Of Our Technician Will Inspect And Inform You Weather Maintenance Is Required Or Not.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                ],
                                childrenPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade100),
                              child: ExpansionTile(
                                title: Text(
                                  "Can I Buy Refrigerator Materials/parts By Myself And Ask Your Technician To Use Them?",
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                                children: [
                                  Container(
                                    child: Text(
                                      "Certainly. You Can Buy Necessary Or Requirement Parts By Yourself. But Any Operational Dysfunctionality Won’t Be Held Responsible By Our Service Providers And Localyour Itself",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                ],
                                childrenPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade100),
                              child: ExpansionTile(
                                title: Text(
                                  "Do You Give Materials/ Parts Warranty?",
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                                children: [
                                  Container(
                                    child: Text(
                                      "We Provide Service Warranty For 7 Days But We Don’t Provide Warranty In Parts, But If The Manufacturer Company Of The Parts Gives The Warranty On That Parts Then It Will Apply.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                ],
                                childrenPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade100),
                              child: ExpansionTile(
                                title: Text(
                                  "Do I Have To Pay Advance Money Before Availing Your Service?",
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                                children: [
                                  Container(
                                    child: Text(
                                      "No. After Service Completion You Will Receive A Text On Your Mobile From Localyour Then You Have To Pay Through Online In Localyour App Or Cash On Delivery.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                ],
                                childrenPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade100),
                              child: ExpansionTile(
                                title: Text(
                                  "Do I Have To Pay Any Charge If I Don’t Take Any Service?",
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                                children: [
                                  Container(
                                    child: Text(
                                      "No, You Don't Need To Pay Any Charge For Visiting If You Cancel Your Order On The Spot.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                ],
                                childrenPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 8,
                  ),
                  child: Container(
                    width: 500,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Customers Also Booked Other Services",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(children: [
                                Image.asset(
                                  "assets/images/pest.png",
                                  height: 72,
                                  width: 72,
                                ),
                              ]),
                              SizedBox(
                                width: 7,
                              ),
                              Column(children: [
                                Image.asset(
                                  "assets/images/renovation.png",
                                  height: 72,
                                  width: 72,
                                ),
                              ]),
                              SizedBox(
                                width: 7,
                              ),
                              Column(children: [
                                Image.asset(
                                  "assets/images/plumbing.png",
                                  height: 72,
                                  width: 72,
                                ),
                              ]),
                              SizedBox(
                                width: 7,
                              ),
                              Column(children: [
                                Image.asset(
                                  "assets/images/masonary.png",
                                  height: 72,
                                  width: 72,
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
