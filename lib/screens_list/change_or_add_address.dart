import 'package:app/network_files/view_model.dart';
import 'package:app/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../router.dart';
import 'checkout_view.dart';


class ChangeOrAddAddressArgs{
  dynamic addressId;
  dynamic userId;
  ChangeOrAddAddressArgs({this.addressId, this.userId});
}

class ChangeOrAddAddress extends HookWidget {
  final ChangeOrAddAddressArgs? args;
  ChangeOrAddAddress({this.args});

  @override
  Widget build(BuildContext context) {
    final productLoaded = useState(false);
    final homeVM = useProvider(homeViewModelProvider);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if(!productLoaded.value){
        productLoaded.value = true;
        context.read(homeViewModelProvider).getCustomerAddresses(args!.userId);
      }
    });
    // print(args!.addressId);

    final isLoading = homeVM.isLoading;
    final allAddress = context.read(homeViewModelProvider).allAddresses;
    final addressIdValue = useState(args!.addressId);
    // print(addressIdValue);


    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Color(0xffC0242D),
        centerTitle: false,
        leading: InkWell(
          onTap: ()=>Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back,size: 30,color: Colors.white,),
        ),
        title: Text('Change Address',style: TextStyle(fontSize: 20,color: Colors.white),),
        // actions: [
        //   Icon(Icons.notifications_none,size: 25,color: Colors.white,),
        //   SizedBox(width: 10,),
        //   Icon(Icons.shopping_cart_rounded,size: 25,color: Colors.white,),
        //   SizedBox(width: 10,)
        // ],
      ),
      body: isLoading? Center(child: CupertinoActivityIndicator(radius: 25,),):Stack(children : [
        ListView(
        children: [
          // allAddress.length > 0 ? Card(
          //   child: Padding(
          //     padding: EdgeInsets.all(15),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Column(
          //           children: [
          //             CircleAvatar(radius: 13,
          //               backgroundColor: Color(0xff86BB46),
          //               child: CircleAvatar(radius: 12,
          //                 backgroundColor: Color(0xff86BB46),
          //                 child: Text('1',style: TextStyle(color: Colors.white),),
          //               ),
          //             ),
          //             SizedBox(height: 5,),
          //             Text('Address',
          //               style: TextStyle(
          //                 // color: Colors.blue
          //               ),)
          //           ],
          //         ),
          //         Container(height: 3,width: 55,color: Color(0xff86BB46),),
          //         Column(
          //           children: [
          //             CircleAvatar(radius: 13,
          //               backgroundColor: Color(0xff86BB46),
          //               child: CircleAvatar(radius: 12,
          //                 backgroundColor: Colors.white,
          //                 // backgroundColor: Colors.white,
          //                 child: Text('2',style: TextStyle(color: Colors.blue),),
          //               ),
          //             ),
          //             SizedBox(height: 5,),
          //             Text('Order Summary',
          //               style: TextStyle(
          //                 // color: Colors.grey
          //               ),)
          //           ],
          //         ),
          //         Container(height: 3,width: 55,color: Color(0xff86BB46),),
          //         Column(
          //           children: [
          //             CircleAvatar(radius: 13,
          //               backgroundColor: Color(0xff86BB46),
          //               child: CircleAvatar(radius: 12,
          //                 backgroundColor: Colors.white,
          //                 child: Text('3'),
          //               ),
          //             ),
          //             SizedBox(height: 5,),
          //             Text('Payment',
          //               style: TextStyle(
          //                   color: Colors.grey
          //               ),)
          //           ],
          //         ),
          //         // Container(height: 3,width: 55,color: Colors.blue,)
          //       ],
          //     ),
          //   ),
          // ) :
          // Card(
          //   child: Padding(
          //     padding: EdgeInsets.all(15),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Column(
          //           children: [
          //             CircleAvatar(radius: 13,
          //               backgroundColor: Color(0xff86BB46),
          //               child: CircleAvatar(radius: 12,
          //                 backgroundColor: Colors.white,
          //                 child: Text('1',style: TextStyle(color: Colors.blue),),
          //               ),
          //             ),
          //             SizedBox(height: 5,),
          //             Text('Address',
          //               style: TextStyle(
          //                 // color: Colors.blue
          //               ),)
          //           ],
          //         ),
          //         Container(height: 3,width: 55,color: Color(0xff86BB46),),
          //         Column(
          //           children: [
          //             CircleAvatar(radius: 13,
          //               backgroundColor: Color(0xff86BB46),
          //               child: CircleAvatar(radius: 12,
          //                 backgroundColor: Colors.white,
          //                 // backgroundColor: Colors.white,
          //                 child: Text('2',style: TextStyle(color: Colors.blue),),
          //               ),
          //             ),
          //             SizedBox(height: 5,),
          //             Text('Order Summary',
          //               style: TextStyle(
          //                 // color: Colors.grey
          //               ),)
          //           ],
          //         ),
          //         Container(height: 3,width: 55,color: Color(0xff86BB46),),
          //         Column(
          //           children: [
          //             CircleAvatar(radius: 13,
          //               backgroundColor: Color(0xff86BB46),
          //               child: CircleAvatar(radius: 12,
          //                 backgroundColor: Colors.white,
          //                 child: Text('3'),
          //               ),
          //             ),
          //             SizedBox(height: 5,),
          //             Text('Payment',
          //               style: TextStyle(
          //                   color: Colors.grey
          //               ),)
          //           ],
          //         ),
          //         // Container(height: 3,width: 55,color: Colors.blue,)
          //       ],
          //     ),
          //   ),
          // ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: ()=>Navigator.pushNamed(context, AppRoutes.addNewAddress),
                    child: Text(
                      '+ Add New Address',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w800
                      ),
                    )),
              ],
            ),
          ),
          if(allAddress.length>0)
          Container(
            // height: double.infinity,

              child:    ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:  allAddress.length>0? allAddress.length :0,
                itemBuilder: (context, index)=> Card(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      child:
                      Row(
                        children: [
                          Radio(
                              value: '${allAddress[index].addressId}',
                              groupValue: addressIdValue.value,
                              onChanged: (val){
                            addressIdValue.value = val;
                            print(addressIdValue.value);

                          }),
                          // Spacer()
                          Container(
                            padding: EdgeInsets.all(5),
                            // height: 150,
                            // width: 250,
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${allAddress[index].customerName}'
                                      ,style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),),
                                    SizedBox(width: 20,),
                                    Container(
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Color(0xfff7f7f4)
                                      ),
                                      padding: EdgeInsets.all(5),
                                      child: Center(
                                        child: Text(
                                          '${allAddress[index].addressType}'
                                          ,style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.w600,),),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 270,
                                  child: Text(
                                    '${allAddress[index].customerAddressLine1}, ${allAddress[index].customerAddressLine2} , ${allAddress[index].city} - ${allAddress[index].pincode}\n State: ${allAddress[0].state}\n city: ${allAddress[0].city}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              )
          ),

        ],
      ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async{
                        final userID = await context.read(secureStorageServiceProvider).getString('id');
                        Navigator.pushNamed(context, AppRoutes.checkoutView,arguments: CheckoutViewArgs(
                          addressId: int.parse('${addressIdValue.value}'),
                          userId: int.parse('$userID'),
                          locationId: 1
                        ));
                      },
                      child: Container(
                        height: 50,
                        color: Color(0xffC0242D),
                        child: Center(
                          child: Text('Deliver Here',style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ),),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}


