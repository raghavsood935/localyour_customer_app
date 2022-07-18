import 'package:app/network_files/models.dart';
import 'package:app/network_files/view_model.dart';
import 'package:app/router.dart';
import 'package:app/screens_list/carts.dart';
import 'package:app/screens_list/checkout_view.dart';
import 'package:app/secure_storage.dart';
import 'package:app/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyCartViewArgs{
  int? customerId;
  int? locationId;
  int? addressId;
  MyCartViewArgs({this.customerId, this.locationId,this.addressId});
}

class MyCartView extends HookWidget {
  final MyCartViewArgs? args;
  const MyCartView({Key? key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productLoaded = useState(false);
    // final homeVM = useProvider(homeViewModelProvider);
    WidgetsBinding.instance!.addPostFrameCallback((_) async{
      if(!productLoaded.value){
        productLoaded.value = true;
        // userVM.getAllAddress();
        context.read(homeViewModelProvider).getCartItems(args!.customerId);
        context.read(homeViewModelProvider).getCustomerAddresses(args!.customerId);
      }
    });
    final isLoading = useProvider(homeViewModelProvider).isLoading;
    final cartItems = useProvider(homeViewModelProvider).cartItems;
    final items = cartItems?.itemsModel ?? [];
    final addresses = context.read(homeViewModelProvider).customerProfile?.addresses;
    final carts = context.read(cartViewModelProvider).carts;
    print(cartItems?.itemsModel?.length);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink.shade50,
        // appBar: AppBar(
        //   backgroundColor: Color(0xffC0242D),
        //   leading: IconButton(
        //     onPressed: ()=>Navigator.of(context).pop(),
        //     icon: Icon(Icons.arrow_back,color: Colors.white,),
        //   ),
        //   centerTitle: true,
        //   title: Text(
        //     'My Cart',style: TextStyle(fontSize: 20,color: Colors.white),),
        // ),
        body: isLoading ? Center(child: CircularProgressBar(),) : ListView(
          // padding: EdgeInsets.symmetric(vertical: 20),
          children: [
            if(items.length != 0)
            ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_,index){
                return  Container(
                  height: 130,
                    padding: EdgeInsets.symmetric(vertical: 6,horizontal: 15),
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink.shade500),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Row(
                      children: [
                        // Container(
                        //   width: 80,
                        //   height: 200,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(8),
                        //     image: DecorationImage(
                        //       image: AssetImage('assets/images/interior.jpg'),fit: BoxFit.fill
                        //     )
                        //   ),
                        // ),
                        SizedBox(width: 20,),
                        Container(
                          width: 160,
                          // height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${items[index].serviceName}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black),),
                                  RichText(
                                    text: TextSpan(
                                        text: 'Rs.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 18
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '${items[index].servicePrice}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.red,
                                                fontSize: 18
                                            ),
                                          ) ,
                                          TextSpan(
                                            text: '/sft.',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                color: Colors.black,
                                                fontSize: 10
                                            ),
                                          )]
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: ()async{
                                        final userId = await context.read(secureStorageServiceProvider).getString('id');
                                        print(userId);
                                        await   context.read(homeViewModelProvider).deleteCartItem(DecreaseCartItemQuantityModel(
                                          customerId: int.parse('$userId'),
                                          serviceId: cartItems!.itemsModel![index].serviceID,
                                        )).then((value) => cartItems.itemsModel!.removeWhere((element) => element.serviceID == cartItems.itemsModel?[index].serviceID))
                                            .then((value) => carts.removeWhere((element) => element.serviceId == carts[index].serviceId))
                                            .then((value) => EasyLoading.showSuccess('Item Removed Successfully')).then((value) => context.read(homeViewModelProvider).getCartItems(userId));
                                      },
                                      icon: Icon(Icons.delete_outline,size: 15,))
                                ],
                              ),
                              // SizedBox(height: 25,),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     RichText(
                              //       text: TextSpan(
                              //           text: 'Subtotal.',
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.w600,
                              //               color: Colors.black,
                              //               fontSize: 15
                              //           ),
                              //           children: [
                              //             TextSpan(
                              //               text: 'Rs',
                              //               style: TextStyle(
                              //                   fontWeight: FontWeight.w300,
                              //                   color: Colors.black,
                              //                   fontSize: 15
                              //               ),
                              //             ),
                              //             TextSpan(
                              //               text: '900.',
                              //               style: TextStyle(
                              //                   fontWeight: FontWeight.w600,
                              //                   color: Colors.red,
                              //                   fontSize: 15
                              //               ),
                              //             ) ,
                              //           ]
                              //       ),
                              //     ),
                              //
                              //   ],
                              // )

                            ],
                          ),
                        ),
                       SizedBox(width: 30,),
                        Container(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: ()async{
                                  final userId = await context.read(secureStorageServiceProvider).getString('id');
                                  print(userId);
                                  if(cartItems?.itemsModel?[index].serviceQuantity == 1){
                                    await   context.read(homeViewModelProvider).deleteCartItem(DecreaseCartItemQuantityModel(
                                      customerId: int.parse('$userId'),
                                      serviceId: cartItems!.itemsModel![index].serviceID,
                                    )).then((value) => cartItems.itemsModel!.removeWhere((element) => element.serviceID == cartItems.itemsModel?[index].serviceID))
                                        .then((value) => carts.removeWhere((element) => element.serviceId == carts[index].serviceId))
                                        .then((value) => EasyLoading.showSuccess('Item Removed Successfully')).then((value) => context.read(homeViewModelProvider).getCartItems(userId));
                                  }else{
                                    await   context.read(homeViewModelProvider).decreaseCartItemQuantity(DecreaseCartItemQuantityModel(
                                      customerId: int.parse('$userId'),
                                      serviceId: cartItems!.itemsModel![index].serviceID,
                                    )).then((value) => context.read(homeViewModelProvider).getCartItems(userId)).then((value) => EasyLoading.showToast('Quantity Decreased'));
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color: Color(0xffC0242D)),
                                  height: 20,
                                  width: 20,
                                  child:Center(child:
                                  Icon(Icons.remove,size: 15,color: Colors.white,)),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color: Colors.white),
                                height: 20,
                                width: 30,
                                child:Center(
                                    child:
                                Text(
                                  '${cartItems!.itemsModel![index].serviceQuantity}',
                                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700),)),
                              ),
                              GestureDetector(
                                onTap: ()async{
                                  final userId = await context.read(secureStorageServiceProvider).getString('id');
                                  print(userId);
                               await   context.read(homeViewModelProvider).addToCart(AddToCartModel(
                                    customerId: args!.customerId,
                                    serviceId: cartItems.itemsModel![index].serviceID,
                                    locationId: args!.locationId,
                                  ))
                                   .then((value) => context.read(homeViewModelProvider).getCartItems(userId))
                                   .then((value) => EasyLoading.showToast('Quantity Increased'));
                                },
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color: Color(0xffC0242D)),
                                  height: 20,
                                  width: 20,
                                  child:Center(child:
                                  Icon(Icons.add,size: 15,color: Colors.white,)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                );
              },
            ),
            if(items.length == 0)
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      // color: Colors.green,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/emptyCart.png'),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Your Cart is Empty\n  Try to add some',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xffC0242D),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:  Center(
                        child: Text(
                          'Shop Now',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            color: Colors.white
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            SizedBox(height: 20,),
            if(items.length != 0)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async{
                     final userId = await context.read(secureStorageServiceProvider).getString('id');
                     print(userId);
                     print('${args!.addressId}');
                     print('${args!.locationId}');
                     await Navigator.pushNamed(context, AppRoutes.checkoutView,
                         arguments: CheckoutViewArgs(
                             userId: int.parse('$userId'),
                             addressId: args!.addressId,
                           locationId: args!.locationId
                         )
                     );},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      primary: Color(0xffC0242D)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Proceed to Checkout',style: TextStyle(fontSize: 18,color: Colors.white),),
                  )),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 150,vertical: 40),
            //   child: TweenAnimationBuilder<double>(
            //     tween: Tween<double>(begin: 0.0, end: 1),
            //     duration: const Duration(milliseconds: 3500),
            //     builder: (context, value, _) => CircularProgressIndicator(value: value),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
