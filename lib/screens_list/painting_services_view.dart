import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../router.dart';

class PaintingServicesView extends StatefulWidget {
  const PaintingServicesView({Key? key}) : super(key: key);

  @override
  _PaintingServicesViewState createState() => _PaintingServicesViewState();
}

class _PaintingServicesViewState extends State<PaintingServicesView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: Scaffold(
        backgroundColor: Color(0xffDEDCE1),
        appBar: AppBar(
          backgroundColor: Color(0xffC0242D),
          leading: IconButton(icon: Icon(Icons.arrow_back,size: 25,)
            ,
            onPressed: (){
            Navigator.pop(context);
            },),
          centerTitle: true,
          title: Text(
            'Painting Services',
            style: TextStyle(
              color: Color(0xffFFFFFF),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          children: [
            SizedBox(height: 5),
            Text('Exterior Paint',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(height: 5,),
           Container(
             height: 280,
             child: Stack(
               children: [
                 Container(
                   height: 180,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('assets/images/Rectangle 97.png'),fit: BoxFit.fill
                   ),
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                   color: Colors.white
                 ),
                 ),
                 Positioned(
                   left: 0,
                   right: 0,
                   top: 150,
                   child: Container(
                     padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Weather Coat Anti Dirt Paint',style: TextStyle(
                                   fontWeight: FontWeight.w500,fontSize: 17,color: Colors.grey.shade600),),
                          RichText(
                            text: TextSpan(
                            text: 'Rs.',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Colors.grey.shade600,
                              fontSize: 13
                            ),
                              children: [
                                TextSpan(
                                text: '900',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    color: Colors.red,
                                    fontSize: 16
                                ),
                                ) ,
                            TextSpan(
                                text: '/sft.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    color: Colors.grey.shade600,
                                    fontSize: 13
                                ),
                            )]
                          ),
                          )
                             ],
                           ),
                           GestureDetector(
                             onTap: (){
                              setState(() {
                                Navigator.pushNamed(context, AppRoutes.checkoutView);
                              });
                             },
                             child: Container(
                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffC0242D)),
                               height: 35,
                               width: 65,
                               child:Center(child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 14),)),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 10,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           RichText(
                             text: TextSpan(
                                 text: 'Subtotal : ',
                                 style: TextStyle(
                                     fontWeight: FontWeight.w600,
                                     fontFamily: GoogleFonts.poppins().fontFamily,
                                     color: Colors.black,
                                     fontSize: 15
                                 ),
                                 children: [
                                   TextSpan(
                                     text: 'Rs',
                                     style: TextStyle(
                                         fontWeight: FontWeight.w300,
                                         fontFamily: GoogleFonts.poppins().fontFamily,
                                         color: Colors.grey.shade600,
                                         fontSize: 15
                                     ),
                                   ),
                                   TextSpan(
                                     text: ' 900',
                                     style: TextStyle(
                                         fontWeight: FontWeight.w600,
                                         color: Colors.red,
                                         fontSize: 15
                                     ),
                                   ) ,
                                   ]
                             ),
                           ),
                          Container(
                            width: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color(0xffC0242D)),
                                  height: 30,
                                  width: 23,
                                  child:Center(
                                      child:
                                      Icon(Icons.remove,size: 15,color: Colors.white,)),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.shade200,
                                  border: Border.all(color: Colors.grey.shade600
                                  )),
                                  height: 35,
                                  width: 60,
                                  child:Center(
                                      child: Text(
                                        '100/sft',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                      ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color(0xffC0242D)),
                                  height: 30,
                                  width: 23,
                                  child:Center(child:
                                  Icon(Icons.add,size: 15,color: Colors.white,)),
                                )
                              ],
                            ),
                          )
                         ],
                       )
                     ],
                   )
                 ),

                 )
               ],
             ),
           ),
            SizedBox(height: 5,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Weather Coat Anti Dirt Paint',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,fontSize: 16,
                              color: Colors.grey.shade600),
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Rs.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: Colors.grey.shade600,
                                  fontSize: 15
                              ),
                              children: [
                                TextSpan(
                                  text: '900.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      color: Colors.red,
                                      fontSize: 15
                                  ),
                                ) ,
                                TextSpan(
                                  text: '/sft.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      color: Colors.grey.shade600,
                                      fontSize: 15
                                  ),
                                )]
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, AppRoutes.checkoutView);
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffC0242D)),
                        height: 35,
                        width: 65,
                        child:Center(child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 15),)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text('Interior Paint',
              style: TextStyle(fontSize: 17,
                  fontWeight: FontWeight.w600,color: Colors.black),
            ),
            SizedBox(height: 5,),
            Container(
              height: 280,
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Rectangle 98.png'),fit: BoxFit.fill
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        color: Colors.white
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 150,
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 25,horizontal: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Weather Coat Anti Dirt Paint',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey.shade600),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: 'Rs.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: GoogleFonts.poppins().fontFamily,
                                              color: Colors.grey.shade600,
                                              fontSize: 13
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '900.',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                                  color: Colors.red,
                                                  fontSize: 15
                                              ),
                                            ) ,
                                            TextSpan(
                                              text: '/sft.',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                                  color: Colors.grey.shade600,
                                                  fontSize: 14
                                              ),
                                            )]
                                      ),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      Navigator.pushNamed(context, AppRoutes.checkoutView);
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffC0242D)),
                                    height: 35,
                                    width: 65,
                                    child:Center(child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 14),)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: 'Subtotal : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: GoogleFonts.poppins().fontFamily,
                                          color: Colors.black,
                                          fontSize: 15
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Rs',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey.shade600,
                                              fontSize: 15,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' 900.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                              fontSize: 15
                                          ),
                                        ) ,
                                      ]
                                  ),
                                ),
                                Container(
                                  width: 110,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color(0xffC0242D)),
                                        height: 30,
                                        width: 23,
                                        child:Center(
                                            child:
                                            Icon(Icons.remove,size: 15,color: Colors.white,)),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.grey.shade200,
                                            border: Border.all(
                                              color: Colors.grey.shade600,
                                            ),
                                        ),
                                        height: 35,
                                        width: 60,
                                        child:Center(
                                          child: Text(
                                            '100/sft',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color(0xffC0242D)),
                                        height: 30,
                                        width: 23,
                                        child:Center(child:
                                        Icon(Icons.add,size: 15,color: Colors.white,)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                    ),

                  )
                ],
              ),
            ),
            SizedBox(height: 5,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Weather Coat Anti Dirt Paint',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 16,
                              color: Colors.grey.shade600),
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Rs.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: Colors.black,
                                  fontSize: 14
                              ),
                              children: [
                                TextSpan(
                                  text: '900.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      color: Colors.red,
                                      fontSize: 15
                                  ),
                                ) ,
                                TextSpan(
                                  text: '/sft.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      color: Colors.black,
                                      fontSize: 14
                                  ),
                                ),
                              ]
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            Navigator.pushNamed(context, AppRoutes.checkoutView);
                          });
                        },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffC0242D)),
                        height: 35,
                        width: 65,
                        child:Center(child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 14),)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

