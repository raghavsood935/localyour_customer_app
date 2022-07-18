import 'dart:math';

import 'package:app/network_files/http.dart';
import 'package:app/network_files/view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/network_files/models.dart';

class OrderDetailsViewArgs {
  dynamic? customerId;
  int? index1;
  // int? locationId;
  OrderDetailsViewArgs({this.customerId, this.index1});
}

class OrderDetailsView extends HookWidget {
  final OrderDetailsViewArgs? args;
  const OrderDetailsView({Key? key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productLoaded = useState(false);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (!productLoaded.value) {
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
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.arrow_left_circle_fill,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        title: Text(
          'Order Details',
          style: TextStyle(
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
      // backgroundColor: Color(0xffDEDCE1),
      body: isLoading
          ? Center(
              child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.pink.shade50,
                  child: CupertinoActivityIndicator(
                    radius: 30,
                    animating: true,
                  )),
            )
          : ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green.shade100),
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Items',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.builder(
                        itemCount: order[args!.index1!].orderItems?.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index2) {
                          return Container(
                              // height: 130,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.green.shade100),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '${order[args!.index1!].orderItems?[index2].serviceName?.toUpperCase()}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Spacer(),
                                          Text(
                                            'Rs. ${order[args!.index1!].orderItems?[index2].servicePrice}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Status: ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                Spacer(),
                                Text(
                                  '${order[args!.index1!].orderItems?[0].status}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total Bill:',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  'Rs. ${order[args!.index1!].totalAmount}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Text(
                      //   ' ${order[index1].orderItems?[0].serviceName?.toUpperCase()}',
                      //   style: TextStyle(
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.w500
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
