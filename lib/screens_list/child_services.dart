// import 'package:app/network_files/models.dart';
// import 'package:app/network_files/view_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/all.dart';
//
// import '../secure_storage.dart';
// import 'carts.dart';
//
// class ChildServices extends HookWidget {
//   String? title;
//   int? itemCount;
//   String? serviceSlug;
//   String? locationName;
//   String? subLocation;
//   int? locationId;
//   ChildServices({this.title,this.itemCount,this.locationName,this.serviceSlug,this.subLocation,this.locationId});
//   // const ChildServices({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final productLoaded = useState(false);
//     WidgetsBinding.instance!.addPostFrameCallback((_) async {
//       if (!productLoaded.value) {
//         productLoaded.value = true;
//         // userVM.getAllAddress();
//         context.read(homeViewModelProvider).getServiceDetails(
//             '${serviceSlug}',
//             '${locationName}',
//             '${subLocation}');
//       }
//     });
//     final isLoading = useProvider(homeViewModelProvider).isLoading;
//     final serviceDetails =
//         useProvider(homeViewModelProvider).serviceDetailsModel;
//     final seviceFAQ = serviceDetails?.serviceFaqModel ?? [];
//     final serviceCategoryDetails = serviceDetails?.categoryModel ?? [];
//     final addresses =
//         context.read(homeViewModelProvider).customerProfile?.addresses;
//     final cartItems = useProvider(homeViewModelProvider).cartItems;
//     final carts = useProvider(cartViewModelProvider).carts;
//     final datevalue = useState(DateTime.now());
//     final moveCheckout = useState(0);
//     return Scaffold(
//      appBar: AppBar(
//         backgroundColor: Color(0xffC0242D),
//         leading: IconButton(
//           onPressed: ()=>Navigator.of(context).pop(),
//           icon: Icon(Icons.arrow_back,color: Colors.white,),
//         ),
//         centerTitle: true,
//         title: Text(
//           '${title!.toUpperCase()}',style: TextStyle(fontSize: 20,color: Colors.white),),
//       ),
//       body: isLoading ? Center(child: Container(child: Column(
//         children: [
//           CupertinoActivityIndicator(radius: 12,),
//           Text('Please Wait',style: TextStyle(color: Colors.grey),)
//         ],
//       ),),) : Container(
//         height: 360,
//         child: ListView.builder(
//           itemCount: serviceCategoryDetails.length,
//           shrinkWrap: true,
//           scrollDirection: Axis.vertical,
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (_, index1) {
//             return GestureDetector(
//               onTap: () {
//                 datevalue.value == DateTime.now();
//                 showModalBottomSheet(
//                     backgroundColor: Colors.transparent,
//                     context: context,
//                     isScrollControlled: true,
//                     isDismissible: true,
//                     builder: (BuildContext context) {
//                       return DraggableScrollableSheet(
//                           initialChildSize:
//                           0.75, //set this as you want
//                           maxChildSize:
//                           0.75, //set this as you want
//                           minChildSize:
//                           0.75, //set this as you want
//                           expand: true,
//                           builder: (context, scrollController) {
//                             return Container(
//                               // height: 340,
//                               padding: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(25),
//                                     topRight:
//                                     Radius.circular(25)),
//                                 color: Colors.pink.shade50,
//                               ),
//                               child: Column(
//                                 children: [
//                                   AppBar(
//                                     backgroundColor: Color(0xffC0242D),
//                                     leading: IconButton(
//                                       onPressed: ()=>Navigator.of(context).pop(),
//                                       icon: Icon(Icons.arrow_back,color: Colors.white,),
//                                     ),
//                                     centerTitle: false,
//                                     title: Text(
//                                       '${serviceCategoryDetails[index1].childCategory!.toUpperCase()}',style: TextStyle(fontSize: 20,color: Colors.white),),
//                                   ),
//                                   // if(datevalue.value.second > DateTime.now().second + 4)
//                                   Container(
//                                     height: 350,
//                                     child: ListView.builder(
//                                       shrinkWrap: true,
//                                       scrollDirection: Axis.vertical,
//                                       physics: AlwaysScrollableScrollPhysics(),
//                                       itemCount: serviceCategoryDetails[index1].categoryChildrenModel?.length,
//                                       itemBuilder: (_, index) {
//                                         return GestureDetector(
//                                           onTap: (){
//                                             print(index1);
//                                             print('?????????????????????${serviceCategoryDetails[index1].categoryChildrenModel?[index].childOfChildrenModel?.length}?????????????/');
//                                             if(serviceCategoryDetails[index1].categoryChildrenModel![index].price==null){
//                                               showModalBottomSheet(
//                                                   backgroundColor: Colors.transparent,
//                                                   context: context,
//                                                   isScrollControlled: true,
//                                                   isDismissible: true,
//                                                   builder: (BuildContext context) {
//                                                     return DraggableScrollableSheet(
//                                                         initialChildSize:
//                                                         0.75, //set this as you want
//                                                         maxChildSize:
//                                                         0.75, //set this as you want
//                                                         minChildSize:
//                                                         0.75, //set this as you want
//                                                         expand: true,
//                                                         builder: (context, scrollController) {
//                                                           return Container(
//                                                             // height: 340,
//                                                             padding: EdgeInsets.all(10),
//                                                             decoration: BoxDecoration(
//                                                               borderRadius: BorderRadius.only(
//                                                                   topLeft: Radius.circular(25),
//                                                                   topRight:
//                                                                   Radius.circular(25)),
//                                                               color: Colors.pink.shade50,
//                                                             ),
//                                                             child: Column(
//                                                               children: [
//                                                                 AppBar(
//                                                                   backgroundColor: Color(0xffC0242D),
//                                                                   leading: IconButton(
//                                                                     onPressed: ()=>Navigator.of(context).pop(),
//                                                                     icon: Icon(Icons.arrow_back,color: Colors.white,),
//                                                                   ),
//                                                                   centerTitle: true,
//                                                                   title: Text(
//                                                                     '${serviceCategoryDetails[index1].categoryChildrenModel?[index].childOfChildrenModel?[index].parentCategory.toUpperCase()}',style: TextStyle(fontSize: 20,color: Colors.white),),
//                                                                 ),
//                                                                 Container(
//                                                                   height: 360,
//                                                                   child: ListView.builder(
//                                                                     shrinkWrap: true,
//                                                                     scrollDirection:
//                                                                     Axis.vertical,
//                                                                     physics:
//                                                                     AlwaysScrollableScrollPhysics(),
//                                                                     itemCount: serviceCategoryDetails[index1].categoryChildrenModel?[index].childOfChildrenModel?.length,
//                                                                     itemBuilder: (_, index2) {
//                                                                       return Container(
//                                                                         // height: 400,
//                                                                         child: Card(
//                                                                           child: Container(
//                                                                             color: Colors.grey,
//                                                                             padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
//                                                                             child: Container(
//                                                                               color: Colors.white,
//                                                                               padding: const EdgeInsets.all(8.0),
//                                                                               child: Container(
//                                                                                 margin: EdgeInsets.symmetric(vertical: 10),
//                                                                                 child: Row(
//                                                                                   children: [
//                                                                                     Column(
//                                                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                       children: [
//                                                                                         Container(
//                                                                                           width: 220,
//                                                                                           child:
//                                                                                           Text(
//                                                                                             '${serviceCategoryDetails[index1].categoryChildrenModel?[index].childOfChildrenModel?[index2].childCategory}',
//                                                                                             style: TextStyle(
//                                                                                                 fontSize:
//                                                                                                 18,
//                                                                                                 color:
//                                                                                                 Colors.black,
//                                                                                                 fontWeight: FontWeight.w900),
//                                                                                           ),
//                                                                                         ),
//
//                                                                                         Text(
//                                                                                           'Rs .${serviceCategoryDetails[index1].categoryChildrenModel![index].childOfChildrenModel?[index2].price}',
//                                                                                           style: TextStyle(
//                                                                                               fontSize:
//                                                                                               18,
//                                                                                               fontWeight:
//                                                                                               FontWeight.w700,
//                                                                                               color: Color(0xffC0242D)),
//                                                                                         )
//                                                                                       ],
//                                                                                     ),
//
//                                                                                     moveCheckout.value == 0 ?
//                                                                                     GestureDetector(
//                                                                                       onTap:
//                                                                                           () async {
//                                                                                         // if(serviceCategoryDetails[index].categoryChildrenModel?[index].childOfChildrenModel?[index].price != null){
//                                                                                         final customerId = await context.read(secureStorageServiceProvider).getString('id');
//                                                                                         // final locationId = await context.read(secureStorageServiceProvider).getString('location_id');
//                                                                                         await context.read(homeViewModelProvider).addToCart(AddToCartModel(
//                                                                                           customerId: int.parse('$customerId'),
//                                                                                           locationId: locationId,
//                                                                                           serviceId: int.parse('${serviceCategoryDetails[index1].categoryChildrenModel?[index].childOfChildrenModel?[index2].serviceId}'),
//                                                                                         )).then((value) => context.read(cartViewModelProvider).addToCart(CartsModel(
//                                                                                             serviceId: serviceCategoryDetails[index1].categoryChildrenModel?[index].childOfChildrenModel?[index2].serviceId,
//                                                                                             serviceDate: 'select date',
//                                                                                             serviceTimeSlot: 'select time'
//                                                                                         ))).then((value) => EasyLoading.showSuccess('Added to Cart Successfully'))
//                                                                                             .then((value) => context.read(homeViewModelProvider).getCartItems(customerId))
//                                                                                             .then((value) => moveCheckout.value = 1);
//                                                                                         // }
//                                                                                       },
//                                                                                       child:
//                                                                                       Container(
//                                                                                         height: 29,
//                                                                                         width: 66,
//                                                                                         decoration:
//                                                                                         BoxDecoration(
//                                                                                           borderRadius:
//                                                                                           BorderRadius.circular(
//                                                                                               4),
//                                                                                           color: Color(
//                                                                                               0xffC0242D),
//                                                                                         ),
//                                                                                         child:
//                                                                                         Center(
//                                                                                           child:
//
//                                                                                           Row(
//                                                                                             mainAxisAlignment:
//                                                                                             MainAxisAlignment.center,
//                                                                                             children: [
//                                                                                               Container(
//                                                                                                 height:
//                                                                                                 25,
//                                                                                                 width:
//                                                                                                 40,
//                                                                                                 decoration: BoxDecoration(
//                                                                                                   // borderRadius: BorderRadius.circular(5),
//                                                                                                     color: Colors.white),
//                                                                                                 child:
//                                                                                                 Center(
//                                                                                                   child: Text(
//                                                                                                     'Add',
//                                                                                                     style: TextStyle(fontSize: 15, color: Color(0xffC0242D), fontWeight: FontWeight.bold),
//                                                                                                   ),
//                                                                                                 ),
//                                                                                               ),
//                                                                                               Container(
//                                                                                                 height:
//                                                                                                 25,
//                                                                                                 width:
//                                                                                                 22,
//                                                                                                 decoration: BoxDecoration(
//                                                                                                   // borderRadius: BorderRadius.circular(5),
//                                                                                                   //   color: Colors.white
//                                                                                                 ),
//                                                                                                 child:
//                                                                                                 Center(
//                                                                                                   child: Icon(
//                                                                                                     Icons.add,
//                                                                                                     color: Colors.white,
//                                                                                                     size: 20,
//                                                                                                   ),
//                                                                                                 ),
//                                                                                               )
//                                                                                             ],
//                                                                                           ),
//                                                                                         ),
//                                                                                       ),
//                                                                                     ) :
//                                                                                     GestureDetector(
//                                                                                       onTap:
//                                                                                           () async {
//
//                                                                                       },
//                                                                                       child:
//                                                                                       Container(
//                                                                                         height: 29,
//                                                                                         width: 66,
//                                                                                         decoration:
//                                                                                         BoxDecoration(
//                                                                                           borderRadius:
//                                                                                           BorderRadius.circular(
//                                                                                               4),
//                                                                                           color: Color(
//                                                                                               0xffC0242D),
//                                                                                         ),
//                                                                                         child:
//                                                                                         Center(
//                                                                                           child:
//
//                                                                                           Row(
//                                                                                             mainAxisAlignment:
//                                                                                             MainAxisAlignment.center,
//                                                                                             children: [
//                                                                                               Container(
//                                                                                                 height:
//                                                                                                 25,
//                                                                                                 width:
//                                                                                                 40,
//                                                                                                 decoration: BoxDecoration(
//                                                                                                   // borderRadius: BorderRadius.circular(5),
//                                                                                                     color: Colors.white),
//                                                                                                 child:
//                                                                                                 Center(
//                                                                                                   child: Text(
//                                                                                                     'Add',
//                                                                                                     style: TextStyle(fontSize: 15, color: Color(0xffC0242D), fontWeight: FontWeight.bold),
//                                                                                                   ),
//                                                                                                 ),
//                                                                                               ),
//                                                                                               Container(
//                                                                                                 height:
//                                                                                                 25,
//                                                                                                 width:
//                                                                                                 22,
//                                                                                                 decoration: BoxDecoration(
//                                                                                                   // borderRadius: BorderRadius.circular(5),
//                                                                                                   //   color: Colors.white
//                                                                                                 ),
//                                                                                                 child:
//                                                                                                 Center(
//                                                                                                   child: Icon(
//                                                                                                     Icons.add,
//                                                                                                     color: Colors.white,
//                                                                                                     size: 20,
//                                                                                                   ),
//                                                                                                 ),
//                                                                                               )
//                                                                                             ],
//                                                                                           ),
//                                                                                         ),
//                                                                                       ),
//                                                                                     ),
//                                                                                   ],
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                         ),
//                                                                       );
//                                                                     },
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ); //whatever you're returning, does not have to be a Container
//                                                         });
//                                                   });}
//                                           },
//                                           child: Container(
//                                             // height: 400,
//                                             child: Card(
//                                               child: Container(
//                                                 color: Colors.grey,
//                                                 padding: EdgeInsets
//                                                     .symmetric(
//                                                     vertical: 1,
//                                                     horizontal: 1),
//                                                 child: Container(
//                                                   color: Colors.white,
//                                                   padding:
//                                                   const EdgeInsets
//                                                       .all(8.0),
//                                                   child: Container(
//                                                     margin: EdgeInsets
//                                                         .symmetric(
//                                                         vertical:
//                                                         10),
//                                                     child: Row(
//                                                       children: [
//                                                         Column(
//                                                           crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                           children: [
//                                                             Container(
//                                                               width:
//                                                               220,
//                                                               child:
//                                                               Text(
//                                                                 '${serviceCategoryDetails[index1].categoryChildrenModel![index].childCategory!.toUpperCase()}',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                     18,
//                                                                     color:
//                                                                     Colors.black,
//                                                                     fontWeight: FontWeight.w900),
//                                                               ),
//                                                             ),
//                                                             if (serviceCategoryDetails[index1]
//                                                                 .categoryChildrenModel![index]
//                                                                 .price !=
//                                                                 null)
//                                                               Text(
//                                                                 'Rs .${serviceCategoryDetails[index1].categoryChildrenModel![index].price}',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                     18,
//                                                                     fontWeight:
//                                                                     FontWeight.w700,
//                                                                     color: Color(0xffC0242D)),
//                                                               )
//                                                           ],
//                                                         ),
//
//                                                         // Icon(Icons.add_shopping_cart_outlined)
//                                                         if(serviceCategoryDetails[index1].categoryChildrenModel?[index].price != null)
//                                                           GestureDetector(
//                                                             onTap:
//                                                                 () async {
//                                                               print('?????????????//====================${serviceCategoryDetails[index].categoryChildrenModel?[index].childOfChildrenModel?.length}==============??????????????????');
//                                                               if(serviceCategoryDetails[index1].categoryChildrenModel?[index].price != null){
//                                                                 final customerId = await context.read(secureStorageServiceProvider).getString('id');
//                                                                 // final locationId = await context.read(secureStorageServiceProvider).getString('location_id');
//                                                                 await context.read(homeViewModelProvider).addToCart(AddToCartModel(
//                                                                   customerId: int.parse('$customerId'),
//                                                                   locationId: locationId,
//                                                                   serviceId: int.parse('${serviceCategoryDetails[index1].categoryChildrenModel![index].serviceId}'),
//                                                                 )).then((value) => context.read(cartViewModelProvider).addToCart(CartsModel(
//                                                                     serviceId: serviceCategoryDetails[index1].categoryChildrenModel?[index].serviceId,
//                                                                     serviceDate: 'select date',
//                                                                     serviceTimeSlot: 'select time'
//                                                                 ))).then((value) => EasyLoading.showSuccess('Added to Cart Successfully'))
//                                                                     .then((value) => context.read(homeViewModelProvider).getCartItems(customerId))
//                                                                     .then((value) => print('~~~~~~~~~~~~~~~~~~${serviceCategoryDetails[index].categoryChildrenModel?[index].serviceId}'));
//                                                               }
//                                                             },
//                                                             child:
//                                                             Container(
//                                                               height: 29,
//                                                               width: 66,
//                                                               decoration:
//                                                               BoxDecoration(
//                                                                 borderRadius:
//                                                                 BorderRadius.circular(
//                                                                     4),
//                                                                 color: Color(
//                                                                     0xffC0242D),
//                                                               ),
//                                                               child:
//                                                               Center(
//                                                                 child:
//
//                                                                 Row(
//                                                                   mainAxisAlignment:
//                                                                   MainAxisAlignment.center,
//                                                                   children: [
//                                                                     Container(
//                                                                       height:
//                                                                       25,
//                                                                       width:
//                                                                       40,
//                                                                       decoration: BoxDecoration(
//                                                                         // borderRadius: BorderRadius.circular(5),
//                                                                           color: Colors.white),
//                                                                       child:
//                                                                       Center(
//                                                                         child: Text(
//                                                                           'Add',
//                                                                           style: TextStyle(fontSize: 15, color: Color(0xffC0242D), fontWeight: FontWeight.bold),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                     Container(
//                                                                       height:
//                                                                       25,
//                                                                       width:
//                                                                       22,
//                                                                       decoration: BoxDecoration(
//                                                                         // borderRadius: BorderRadius.circular(5),
//                                                                         //   color: Colors.white
//                                                                       ),
//                                                                       child:
//                                                                       Center(
//                                                                         child: Icon(
//                                                                           Icons.add,
//                                                                           color: Colors.white,
//                                                                           size: 20,
//                                                                         ),
//                                                                       ),
//                                                                     )
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 8,
//                                   ),
//                                 ],
//                               ),
//                             ); //whatever you're returning, does not have to be a Container
//                           });
//                     });
//               },
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.grey)),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: 10, vertical: 2),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 220,
//                         child: Text(
//                           '${serviceCategoryDetails[index1].childCategory!.toUpperCase()}',
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       // Spacer(),
//                       Icon(
//                         Icons.arrow_forward_ios_sharp,
//                         size: 18,
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
