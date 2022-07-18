

import 'dart:math';

import 'package:app/network_files/http.dart';
import 'package:app/network_files/view_model.dart';
import 'package:app/screens_list/order_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/network_files/models.dart';
import 'package:intl/intl.dart';

import '../router.dart';
import '../secure_storage.dart';

class OrdersViewArgs{
  dynamic? customerId;
  // int? locationId;
  OrdersViewArgs({this.customerId});
}

class OrdersView extends HookWidget {
  final OrdersViewArgs? args;
  const OrdersView({Key? key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productLoaded = useState(false);
    WidgetsBinding.instance!.addPostFrameCallback((_) async{
      if(!productLoaded.value){
        productLoaded.value = true;

        context.read(homeViewModelProvider).getOrders(args!.customerId);
      }
    });
    final isLoading = useProvider(homeViewModelProvider).isLoading;
    final order = useProvider(homeViewModelProvider).orders;
    final locations = useProvider(homeViewModelProvider).locations;
    // final Reader read;
    // final orderAddress =orders[0].orderAddress ?? [];
    // final orderItems = orders[0].orderItems ?? [];
    print('1 + ${order.length}');
    print(order);
    print('2 + ${locations.length}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC0242D),
        leading: IconButton(
          onPressed: ()=>Navigator.of(context).pop(),
          icon: Icon(CupertinoIcons.arrow_left_circle_fill,color: Colors.white,),
        ),
        centerTitle: false,
        title: Text(
          'My Orders',
          style: TextStyle(
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
      // backgroundColor: Color(0xffDEDCE1),
      // body:isLoading ? Center(child: CircleAvatar(radius: 50,backgroundColor: Colors.pink.shade50,child: CupertinoActivityIndicator(radius: 30,animating: true,)),) :
      // TabBar(
      //   controller: ,
      //   tabs: [
      //     ListView(
      //       children: [
      //         order.length!=0 ?
      //         Container(
      //           child: ListView.builder(
      //             itemCount: order.length,
      //             scrollDirection: Axis.vertical,
      //             shrinkWrap: true,
      //             physics: NeverScrollableScrollPhysics(),
      //             itemBuilder: (_,index1){
      //               return  Container(
      //                 // height: 130,
      //                   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      //                   margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      //                   decoration: BoxDecoration(
      //                       border: Border.all(color: Colors.pink.shade500),
      //                       color: Color(0xfff9f7f7),
      //                       borderRadius: BorderRadius.circular(4)
      //                   ),
      //                   child: Container(
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         ListView.builder(
      //                           itemCount: order[index1].orderItems?.length == null ? 0 : 1 ,
      //                           scrollDirection: Axis.vertical,
      //                           shrinkWrap: true,
      //                           physics: NeverScrollableScrollPhysics(),
      //                           itemBuilder: (_,index2){
      //                             return  Container(
      //                               // height: 130,
      //                                 padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      //                                 margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      //                                 decoration: BoxDecoration(
      //                                     border: Border.all(color: Colors.green.shade100),
      //                                     color: Colors.white,
      //                                     borderRadius: BorderRadius.circular(4)
      //                                 ),
      //                                 child: Column(
      //                                   crossAxisAlignment: CrossAxisAlignment.center,
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.start,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Text(
      //                                               '${order[index1].orderItems?[0].serviceName?.toUpperCase()}',
      //                                               style: TextStyle(
      //                                                   fontSize: 14,
      //                                                   fontWeight: FontWeight.w500
      //                                               ),
      //                                             ),
      //                                             Spacer(),
      //                                             Text(
      //                                               'Rs. ${order[index1].orderItems?[index2].servicePrice}',
      //                                               style: TextStyle(
      //                                                   fontSize: 14,
      //                                                   fontWeight: FontWeight.w500
      //                                               ),
      //                                             ),
      //                                           ],
      //                                         ),
      //                                         if(order[index1].orderItems!.length>1)
      //                                           Text(
      //                                             '+${(order[index1].orderItems?.length).toString()} Items more',
      //                                             style: TextStyle(
      //                                                 fontSize: 14,
      //                                                 fontWeight: FontWeight.w500,
      //                                                 color: Colors.red
      //                                             ),
      //                                           ),
      //                                         Row(
      //                                           mainAxisAlignment: MainAxisAlignment.end,
      //                                           children: [
      //                                             if(order[index1].orderItems!.length>1)
      //                                               TextButton(
      //                                                 onPressed: () async{
      //                                                   final userId = await context.read(secureStorageServiceProvider).getString('id');
      //                                                   await Navigator.pushNamed(context, AppRoutes.orderDetailsView,
      //                                                       arguments: OrderDetailsViewArgs(
      //                                                           customerId: int.parse('$userId'),
      //                                                           index1: index1
      //                                                       )
      //                                                   );
      //                                                 },
      //                                                 child: Text(
      //                                                   'View all',
      //                                                   style: TextStyle(
      //                                                       fontSize: 14,
      //                                                       fontWeight: FontWeight.w500,
      //                                                       color: Colors.red
      //                                                   ),
      //                                                 ),
      //                                               )
      //                                           ],
      //                                         ),
      //                                         Row(
      //                                           children: [
      //                                             Text(
      //                                               'Service Date',
      //                                               style: TextStyle(
      //                                                   fontSize: 14,
      //                                                   fontWeight: FontWeight.w500
      //                                               ),
      //                                             ),
      //                                             Spacer(),
      //                                             // Text(
      //                                             //   '${order[index1].orderItems?[index2].serviceDate}',
      //                                             //   style: TextStyle(
      //                                             //       fontSize: 14,
      //                                             //       fontWeight: FontWeight.w500
      //                                             //   ),
      //                                             // ),
      //                                             Text(
      //                                               '${DateFormat("EEE, d MMM yyyy ").format(DateTime.parse(order[index1].orderItems![index2].serviceDate!.substring(0,10) + ' ' + order[index1].orderItems![index2].serviceDate!.substring(11,23)))}',
      //                                               style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //
      //                                   ],
      //                                 )
      //                             );
      //                           },
      //                         ),
      //                         Row(
      //                           children: [
      //                             Text(
      //                               'OrderId:${order[index1].orderId}',
      //                               style: TextStyle(
      //                                   fontSize: 14,
      //                                   fontWeight: FontWeight.w500
      //                               ),
      //                             ),
      //                             Spacer(),
      //                             Text(
      //                               'Status: ${order[index1].orderItems?[0].status}',
      //                               style: TextStyle(
      //                                   fontSize: 14,
      //                                   fontWeight: FontWeight.w500
      //                               ),
      //                             ),
      //
      //                           ],
      //                         ),
      //                         Row(
      //                           children: [
      //                             Text(
      //                               'Payment Type',
      //                               style: TextStyle(
      //                                   fontSize: 14,
      //                                   fontWeight: FontWeight.w500
      //                               ),
      //                             ),
      //                             Spacer(),
      //                             Text(
      //                               '${order[index1].paymentType}',
      //                               style: TextStyle(
      //                                   fontSize: 14,
      //                                   fontWeight: FontWeight.w500
      //                               ),
      //                             ),
      //
      //                           ],
      //                         ),
      //                         // Row(
      //                         //   children: [
      //                         //     Text(
      //                         //       'Order Date',
      //                         //       style: TextStyle(
      //                         //           fontSize: 14,
      //                         //           fontWeight: FontWeight.w500
      //                         //       ),
      //                         //     ),
      //                         //     Spacer(),
      //                         //     Text(
      //                         //       '${order[index1].}',
      //                         //       style: TextStyle(
      //                         //           fontSize: 14,
      //                         //           fontWeight: FontWeight.w500
      //                         //       ),
      //                         //     ),
      //                         //
      //                         //   ],
      //                         // ),
      //                         // Text(
      //                         //   ' ${order[index1].orderItems?[0].serviceName?.toUpperCase()}',
      //                         //   style: TextStyle(
      //                         //       fontSize: 14,
      //                         //       fontWeight: FontWeight.w500
      //                         //   ),
      //                         // ),
      //                       ],
      //                     ),
      //                   )
      //               );
      //             },
      //           ),
      //         ) :
      //         Container(
      //           // height: 900,
      //
      //           child: Center(
      //             child: Column(
      //               children: [
      //                 SizedBox(height: 100,),
      //                 Container(
      //                   height: 200,
      //                   width: 200,
      //                   decoration: BoxDecoration(
      //                     // color: Colors.black,
      //                       image: DecorationImage(
      //                           image: AssetImage(
      //                               'assets/images/open-box (1).png'
      //                           ),
      //                           fit: BoxFit.fill
      //                       )
      //                   ),
      //                 ),
      //                 Text(
      //                   'you haven\'t ordered yet',
      //                   style: TextStyle(
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.w700,
      //                     // color: Colors.white
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     ListView(
      //       children: [
      //         order.length!=0 ?
      //         Container(
      //           child: ListView.builder(
      //             itemCount: order.length,
      //             scrollDirection: Axis.vertical,
      //             shrinkWrap: true,
      //             physics: NeverScrollableScrollPhysics(),
      //             itemBuilder: (_,index1){
      //               return  Container(
      //                 // height: 130,
      //                   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      //                   margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      //                   decoration: BoxDecoration(
      //                       border: Border.all(color: Colors.pink.shade500),
      //                       color: Color(0xfff9f7f7),
      //                       borderRadius: BorderRadius.circular(4)
      //                   ),
      //                   child: Container(
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         ListView.builder(
      //                           itemCount: order[index1].orderItems?.length == null ? 0 : 1 ,
      //                           scrollDirection: Axis.vertical,
      //                           shrinkWrap: true,
      //                           physics: NeverScrollableScrollPhysics(),
      //                           itemBuilder: (_,index2){
      //                             return  Container(
      //                               // height: 130,
      //                                 padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      //                                 margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      //                                 decoration: BoxDecoration(
      //                                     border: Border.all(color: Colors.green.shade100),
      //                                     color: Colors.white,
      //                                     borderRadius: BorderRadius.circular(4)
      //                                 ),
      //                                 child: Column(
      //                                   crossAxisAlignment: CrossAxisAlignment.center,
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.start,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Text(
      //                                               '${order[index1].orderItems?[0].serviceName?.toUpperCase()}',
      //                                               style: TextStyle(
      //                                                   fontSize: 14,
      //                                                   fontWeight: FontWeight.w500
      //                                               ),
      //                                             ),
      //                                             Spacer(),
      //                                             Text(
      //                                               'Rs. ${order[index1].orderItems?[index2].servicePrice}',
      //                                               style: TextStyle(
      //                                                   fontSize: 14,
      //                                                   fontWeight: FontWeight.w500
      //                                               ),
      //                                             ),
      //                                           ],
      //                                         ),
      //                                         if(order[index1].orderItems!.length>1)
      //                                           Text(
      //                                             '+${(order[index1].orderItems?.length).toString()} Items more',
      //                                             style: TextStyle(
      //                                                 fontSize: 14,
      //                                                 fontWeight: FontWeight.w500,
      //                                                 color: Colors.red
      //                                             ),
      //                                           ),
      //                                         Row(
      //                                           mainAxisAlignment: MainAxisAlignment.end,
      //                                           children: [
      //                                             if(order[index1].orderItems!.length>1)
      //                                               TextButton(
      //                                                 onPressed: () async{
      //                                                   final userId = await context.read(secureStorageServiceProvider).getString('id');
      //                                                   await Navigator.pushNamed(context, AppRoutes.orderDetailsView,
      //                                                       arguments: OrderDetailsViewArgs(
      //                                                           customerId: int.parse('$userId'),
      //                                                           index1: index1
      //                                                       )
      //                                                   );
      //                                                 },
      //                                                 child: Text(
      //                                                   'View all',
      //                                                   style: TextStyle(
      //                                                       fontSize: 14,
      //                                                       fontWeight: FontWeight.w500,
      //                                                       color: Colors.red
      //                                                   ),
      //                                                 ),
      //                                               )
      //                                           ],
      //                                         ),
      //                                         Row(
      //                                           children: [
      //                                             Text(
      //                                               'Service Date',
      //                                               style: TextStyle(
      //                                                   fontSize: 14,
      //                                                   fontWeight: FontWeight.w500
      //                                               ),
      //                                             ),
      //                                             Spacer(),
      //                                             // Text(
      //                                             //   '${order[index1].orderItems?[index2].serviceDate}',
      //                                             //   style: TextStyle(
      //                                             //       fontSize: 14,
      //                                             //       fontWeight: FontWeight.w500
      //                                             //   ),
      //                                             // ),
      //                                             Text(
      //                                               '${DateFormat("EEE, d MMM yyyy ").format(DateTime.parse(order[index1].orderItems![index2].serviceDate!.substring(0,10) + ' ' + order[index1].orderItems![index2].serviceDate!.substring(11,23)))}',
      //                                               style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //
      //                                   ],
      //                                 )
      //                             );
      //                           },
      //                         ),
      //                         Row(
      //                           children: [
      //                             Text(
      //                               'OrderId:${order[index1].orderId}',
      //                               style: TextStyle(
      //                                   fontSize: 14,
      //                                   fontWeight: FontWeight.w500
      //                               ),
      //                             ),
      //                             Spacer(),
      //                             Text(
      //                               'Status: ${order[index1].orderItems?[0].status}',
      //                               style: TextStyle(
      //                                   fontSize: 14,
      //                                   fontWeight: FontWeight.w500
      //                               ),
      //                             ),
      //
      //                           ],
      //                         ),
      //                         Row(
      //                           children: [
      //                             Text(
      //                               'Payment Type',
      //                               style: TextStyle(
      //                                   fontSize: 14,
      //                                   fontWeight: FontWeight.w500
      //                               ),
      //                             ),
      //                             Spacer(),
      //                             Text(
      //                               '${order[index1].paymentType}',
      //                               style: TextStyle(
      //                                   fontSize: 14,
      //                                   fontWeight: FontWeight.w500
      //                               ),
      //                             ),
      //
      //                           ],
      //                         ),
      //                         // Row(
      //                         //   children: [
      //                         //     Text(
      //                         //       'Order Date',
      //                         //       style: TextStyle(
      //                         //           fontSize: 14,
      //                         //           fontWeight: FontWeight.w500
      //                         //       ),
      //                         //     ),
      //                         //     Spacer(),
      //                         //     Text(
      //                         //       '${order[index1].}',
      //                         //       style: TextStyle(
      //                         //           fontSize: 14,
      //                         //           fontWeight: FontWeight.w500
      //                         //       ),
      //                         //     ),
      //                         //
      //                         //   ],
      //                         // ),
      //                         // Text(
      //                         //   ' ${order[index1].orderItems?[0].serviceName?.toUpperCase()}',
      //                         //   style: TextStyle(
      //                         //       fontSize: 14,
      //                         //       fontWeight: FontWeight.w500
      //                         //   ),
      //                         // ),
      //                       ],
      //                     ),
      //                   )
      //               );
      //             },
      //           ),
      //         ) :
      //         Container(
      //           // height: 900,
      //
      //           child: Center(
      //             child: Column(
      //               children: [
      //                 SizedBox(height: 100,),
      //                 Container(
      //                   height: 200,
      //                   width: 200,
      //                   decoration: BoxDecoration(
      //                     // color: Colors.black,
      //                       image: DecorationImage(
      //                           image: AssetImage(
      //                               'assets/images/open-box (1).png'
      //                           ),
      //                           fit: BoxFit.fill
      //                       )
      //                   ),
      //                 ),
      //                 Text(
      //                   'you haven\'t ordered yet',
      //                   style: TextStyle(
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.w700,
      //                     // color: Colors.white
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      body: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Builder(
            builder: (context) {
              // final TabController tabController =
              // DefaultTabController.of(context);
              // tabController.addListener(() {
              //   if (tabController.indexIsChanging) {
              //     setState(() {
              //       vehicles = getAllVehicles();
              //     });
              //   }
              // });
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white70,
                  title: TabBar(
                    labelColor: Colors.black,
                    labelPadding: EdgeInsets.zero,
                    indicatorColor: Color(0xffC0242D),
                    tabs: [
                   Text('Completed'),Text('Cancelled'),Text('Requested')
                    ],
                    indicatorPadding: EdgeInsets.zero,
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: TabBarView(
                    children: [
                      ListView(
                        children: [
                          order.length!=0 ?
                          Container(
                            child: ListView.builder(
                              itemCount: order.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (_,index1){
                                return  Container(
                                  // height: 130,
                                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.pink.shade500),
                                        color: Color(0xfff9f7f7),
                                        borderRadius: BorderRadius.circular(14)
                                    ),
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ListView.builder(
                                            itemCount: order[index1].orderItems?.length == null ? 0 : 1 ,
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemBuilder: (_,index2){
                                              return  Container(
                                                // height: 130,
                                                //   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                                //   margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      // border: Border.all(color: Colors.green.shade100),
                                                      // color: Colors.white,
                                                      borderRadius: BorderRadius.circular(4)
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        // mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '${order[index1].orderItems?[0].serviceName?.toUpperCase()}',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w500
                                                                ),
                                                              ),
                                                              Spacer(),
                                                              Text(
                                                                'Rs. ${order[index1].orderItems?[index2].servicePrice}',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w500
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          if(order[index1].orderItems!.length>1)
                                                            Text(
                                                              '+${(order[index1].orderItems?.length).toString()} Items more',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.red
                                                              ),
                                                            ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              if(order[index1].orderItems!.length>1)
                                                                TextButton(
                                                                  onPressed: () async{
                                                                    final userId = await context.read(secureStorageServiceProvider).getString('id');
                                                                    await Navigator.pushNamed(context, AppRoutes.orderDetailsView,
                                                                        arguments: OrderDetailsViewArgs(
                                                                            customerId: int.parse('$userId'),
                                                                            index1: index1
                                                                        )
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    'View all',
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.w500,
                                                                        color: Colors.red
                                                                    ),
                                                                  ),
                                                                )
                                                            ],
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Schedule:',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w500,
                                                                  color: Colors.red
                                                                ),
                                                              ),
                                                              Spacer(),
                                                              // Text(
                                                              //   '${order[index1].orderItems?[index2].serviceDate}',
                                                              //   style: TextStyle(
                                                              //       fontSize: 14,
                                                              //       fontWeight: FontWeight.w500
                                                              //   ),
                                                              // ),

                                                              Text(
                                                                '${DateFormat("EEE, d MMM yyyy ").format(DateTime.parse(order[index1].orderItems![index2].serviceDate!.substring(0,10) + ' ' + order[index1].orderItems![index2].serviceDate!.substring(11,23)))}',
                                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.orange.withRed(1)),),
                                                            ],
                                                          ),
                                                        ],
                                                      ),

                                                    ],
                                                  )
                                              );
                                            },
                                          ),
                                          SizedBox(height: 6),
                                          Row(
                                            children: [
                                              Text(
                                                'OrderId:${order[index1].orderId}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  color: Colors.red
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                'Status: ${order[index1].orderItems?[0].status}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.orange.withRed(1)
                                                ),
                                              ),

                                            ],
                                          ),
                                          SizedBox(height: 6,),
                                          Row(
                                            children: [
                                              Text(
                                                'Payment Type',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  color: Colors.red
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                '${order[index1].paymentType}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.orange.withRed(1)
                                                ),
                                              ),

                                            ],
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Text(
                                          //       'Order Date',
                                          //       style: TextStyle(
                                          //           fontSize: 14,
                                          //           fontWeight: FontWeight.w500
                                          //       ),
                                          //     ),
                                          //     Spacer(),
                                          //     Text(
                                          //       '${order[index1].}',
                                          //       style: TextStyle(
                                          //           fontSize: 14,
                                          //           fontWeight: FontWeight.w500
                                          //       ),
                                          //     ),
                                          //
                                          //   ],
                                          // ),
                                          // Text(
                                          //   ' ${order[index1].orderItems?[0].serviceName?.toUpperCase()}',
                                          //   style: TextStyle(
                                          //       fontSize: 14,
                                          //       fontWeight: FontWeight.w500
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    )
                                );
                              },
                            ),
                          ) :
                          Container(
                            // height: 900,

                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 100,),
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      // color: Colors.black,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/open-box (1).png'
                                            ),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  ),
                                  Text(
                                    'you haven\'t ordered yet',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      // color: Colors.white
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          order.length!=0 ?
                          Container(
                            child: ListView.builder(
                              itemCount: order.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (_,index1){
                                return  Container(
                                  // height: 130,
                                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.pink.shade500),
                                        color: Color(0xfff9f7f7),
                                        borderRadius: BorderRadius.circular(14)
                                    ),
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ListView.builder(
                                            itemCount: order[index1].orderItems?.length == null ? 0 : 1 ,
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemBuilder: (_,index2){
                                              return  Container(
                                                // height: 130,
                                                //   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                                //   margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    // border: Border.all(color: Colors.green.shade100),
                                                    // color: Colors.white,
                                                      borderRadius: BorderRadius.circular(4)
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        // mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '${order[index1].orderItems?[0].serviceName?.toUpperCase()}',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w500
                                                                ),
                                                              ),
                                                              Spacer(),
                                                              Text(
                                                                'Rs. ${order[index1].orderItems?[index2].servicePrice}',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w500
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          if(order[index1].orderItems!.length>1)
                                                            Text(
                                                              '+${(order[index1].orderItems?.length).toString()} Items more',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.red
                                                              ),
                                                            ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              if(order[index1].orderItems!.length>1)
                                                                TextButton(
                                                                  onPressed: () async{
                                                                    final userId = await context.read(secureStorageServiceProvider).getString('id');
                                                                    await Navigator.pushNamed(context, AppRoutes.orderDetailsView,
                                                                        arguments: OrderDetailsViewArgs(
                                                                            customerId: int.parse('$userId'),
                                                                            index1: index1
                                                                        )
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    'View all',
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.w500,
                                                                        color: Colors.red
                                                                    ),
                                                                  ),
                                                                )
                                                            ],
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Schedule:',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w500,
                                                                    color: Colors.red
                                                                ),
                                                              ),
                                                              Spacer(),
                                                              // Text(
                                                              //   '${order[index1].orderItems?[index2].serviceDate}',
                                                              //   style: TextStyle(
                                                              //       fontSize: 14,
                                                              //       fontWeight: FontWeight.w500
                                                              //   ),
                                                              // ),

                                                              Text(
                                                                '${DateFormat("EEE, d MMM yyyy ").format(DateTime.parse(order[index1].orderItems![index2].serviceDate!.substring(0,10) + ' ' + order[index1].orderItems![index2].serviceDate!.substring(11,23)))}',
                                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.orange.withRed(1)),),
                                                            ],
                                                          ),
                                                        ],
                                                      ),

                                                    ],
                                                  )
                                              );
                                            },
                                          ),
                                          SizedBox(height: 6),
                                          Row(
                                            children: [
                                              Text(
                                                'OrderId:${order[index1].orderId}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                'Status: ${order[index1].orderItems?[0].status}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.orange.withRed(1)
                                                ),
                                              ),

                                            ],
                                          ),
                                          SizedBox(height: 6,),
                                          Row(
                                            children: [
                                              Text(
                                                'Payment Type',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                '${order[index1].paymentType}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.orange.withRed(1)
                                                ),
                                              ),

                                            ],
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Text(
                                          //       'Order Date',
                                          //       style: TextStyle(
                                          //           fontSize: 14,
                                          //           fontWeight: FontWeight.w500
                                          //       ),
                                          //     ),
                                          //     Spacer(),
                                          //     Text(
                                          //       '${order[index1].}',
                                          //       style: TextStyle(
                                          //           fontSize: 14,
                                          //           fontWeight: FontWeight.w500
                                          //       ),
                                          //     ),
                                          //
                                          //   ],
                                          // ),
                                          // Text(
                                          //   ' ${order[index1].orderItems?[0].serviceName?.toUpperCase()}',
                                          //   style: TextStyle(
                                          //       fontSize: 14,
                                          //       fontWeight: FontWeight.w500
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    )
                                );
                              },
                            ),
                          ) :
                          Container(
                            // height: 900,

                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 100,),
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      // color: Colors.black,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/open-box (1).png'
                                            ),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  ),
                                  Text(
                                    'you haven\'t ordered yet',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      // color: Colors.white
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          order.length!=0 ?
                          Container(
                            child: ListView.builder(
                              itemCount: order.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (_,index1){
                                return  Container(
                                  // height: 130,
                                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.pink.shade500),
                                        color: Color(0xfff9f7f7),
                                        borderRadius: BorderRadius.circular(14)
                                    ),
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ListView.builder(
                                            itemCount: order[index1].orderItems?.length == null ? 0 : 1 ,
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemBuilder: (_,index2){
                                              return  Container(
                                                // height: 130,
                                                //   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                                //   margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    // border: Border.all(color: Colors.green.shade100),
                                                    // color: Colors.white,
                                                      borderRadius: BorderRadius.circular(4)
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        // mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '${order[index1].orderItems?[0].serviceName?.toUpperCase()}',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w500
                                                                ),
                                                              ),
                                                              Spacer(),
                                                              Text(
                                                                'Rs. ${order[index1].orderItems?[index2].servicePrice}',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w500
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          if(order[index1].orderItems!.length>1)
                                                            Text(
                                                              '+${(order[index1].orderItems?.length).toString()} Items more',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.red
                                                              ),
                                                            ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              if(order[index1].orderItems!.length>1)
                                                                TextButton(
                                                                  onPressed: () async{
                                                                    final userId = await context.read(secureStorageServiceProvider).getString('id');
                                                                    await Navigator.pushNamed(context, AppRoutes.orderDetailsView,
                                                                        arguments: OrderDetailsViewArgs(
                                                                            customerId: int.parse('$userId'),
                                                                            index1: index1
                                                                        )
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    'View all',
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.w500,
                                                                        color: Colors.red
                                                                    ),
                                                                  ),
                                                                )
                                                            ],
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Schedule:',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w500,
                                                                    color: Colors.red
                                                                ),
                                                              ),
                                                              Spacer(),
                                                              // Text(
                                                              //   '${order[index1].orderItems?[index2].serviceDate}',
                                                              //   style: TextStyle(
                                                              //       fontSize: 14,
                                                              //       fontWeight: FontWeight.w500
                                                              //   ),
                                                              // ),

                                                              Text(
                                                                '${DateFormat("EEE, d MMM yyyy ").format(DateTime.parse(order[index1].orderItems![index2].serviceDate!.substring(0,10) + ' ' + order[index1].orderItems![index2].serviceDate!.substring(11,23)))}',
                                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.orange.withRed(1)),),
                                                            ],
                                                          ),
                                                        ],
                                                      ),

                                                    ],
                                                  )
                                              );
                                            },
                                          ),
                                          SizedBox(height: 6),
                                          Row(
                                            children: [
                                              Text(
                                                'OrderId:${order[index1].orderId}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                'Status: ${order[index1].orderItems?[0].status}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.orange.withRed(1)
                                                ),
                                              ),

                                            ],
                                          ),
                                          SizedBox(height: 6,),
                                          Row(
                                            children: [
                                              Text(
                                                'Payment Type',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                '${order[index1].paymentType}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.orange.withRed(1)
                                                ),
                                              ),

                                            ],
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Text(
                                          //       'Order Date',
                                          //       style: TextStyle(
                                          //           fontSize: 14,
                                          //           fontWeight: FontWeight.w500
                                          //       ),
                                          //     ),
                                          //     Spacer(),
                                          //     Text(
                                          //       '${order[index1].}',
                                          //       style: TextStyle(
                                          //           fontSize: 14,
                                          //           fontWeight: FontWeight.w500
                                          //       ),
                                          //     ),
                                          //
                                          //   ],
                                          // ),
                                          // Text(
                                          //   ' ${order[index1].orderItems?[0].serviceName?.toUpperCase()}',
                                          //   style: TextStyle(
                                          //       fontSize: 14,
                                          //       fontWeight: FontWeight.w500
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    )
                                );
                              },
                            ),
                          ) :
                          Container(
                            // height: 900,

                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 100,),
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      // color: Colors.black,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/open-box (1).png'
                                            ),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  ),
                                  Text(
                                    'you haven\'t ordered yet',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      // color: Colors.white
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

