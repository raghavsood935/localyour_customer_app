import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMoreServices extends StatefulWidget {
  @override
  State<AddMoreServices> createState() => _AddMoreServicesState();
}

class _AddMoreServicesState extends State<AddMoreServices> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily
    ),
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
       child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             height: 85,
             width: 500,
             child: Center(
               child: Row(
                 children: [
                   SizedBox(width:5,),
                   IconButton(
                     onPressed: () {
                     },
                     icon: Icon(Icons.arrow_back,color: Colors.white,),
                   ),
                   SizedBox(width: 20,),
                   Text(
                   "Weather Coat Anti Dirt Paint",
                   style: TextStyle(
                     fontFamily: GoogleFonts.poppins().fontFamily,
                     fontSize: 19,
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ],
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
           SizedBox(
             height: 10,
           ),
           Padding(
             padding: EdgeInsets.only(
                 left: 5,
                 right: 5
             ),
             child: Card(
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
                                       color: Color(0xffC0242D),
                                       fontSize: 16
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
                       onTap: (){},
                       child: Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Color(0xffC0242D)),
                         height: 35,
                         width: 65,
                         child:Center(child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 15),)),
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ),
           Padding(
             padding: EdgeInsets.only(
                 left: 5,
                 right: 5
             ),
             child: Card(
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
                                       color: Color(0xffC0242D),
                                       fontSize: 16
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
                       onTap: (){},
                       child: Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Color(0xffC0242D)),
                         height: 35,
                         width: 65,
                         child:Center(child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 15),)),
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ),
           Padding(
             padding: EdgeInsets.only(
                 left: 5,
                 right: 5
             ),
             child: Card(
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
                                       color: Color(0xffC0242D),
                                       fontSize: 16
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
                       onTap: (){},
                       child: Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Color(0xffC0242D)),
                         height: 35,
                         width: 65,
                         child:Center(child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 15),)),
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ),
           Padding(
             padding: EdgeInsets.only(
                 left: 5,
                 right: 5
             ),
             child: Card(
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
                                       color: Color(0xffC0242D),
                                       fontSize: 16
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
                       onTap: (){},
                       child: Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Color(0xffC0242D)),
                         height: 35,
                         width: 65,
                         child:Center(child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 15),)),
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ),
           Padding(
             padding: EdgeInsets.only(
                 left: 10,
                 right: 10,
               top: 10,
             ),
                   child: InkWell(
                     onTap: (){},
                     child: Container(
                       width: 500,
                       height: 45,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.white,
                       ),
                         child: Center(
                             child: Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   "Add More Services",
                                 style: TextStyle(
                                   color: Colors.pinkAccent.shade700,
                                   fontFamily: GoogleFonts.poppins().fontFamily,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 15
                                 ),
                               ),
                                 SizedBox(
                                   width: 8,
                                 ),
                                 Icon(
                                   Icons.add_circle,
                                   size: 20,
                                   color: Colors.pinkAccent.shade700,
                                 ),
                              ],
                             ),
                         ),
                       ),
                     ),
                   ),
               ],
           )
         )
       )
    );
  }
}
