import 'package:app/network_files/models.dart';
import 'package:app/network_files/view_model.dart';
import 'package:app/screens_list/carts.dart';
import 'package:app/screens_list/change_or_add_address.dart';
import 'package:app/views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../router.dart';
import '../secure_storage.dart';

class CheckoutViewArgs{
  dynamic? userId;
  dynamic addressId;
  dynamic locationId;
  CheckoutViewArgs({this.userId, this.addressId,this.locationId});
}
final  _formkey =  GlobalKey<FormState>();
class CheckoutView extends HookWidget {
  final CheckoutViewArgs? args;
  const CheckoutView({Key? key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productLoaded = useState(false);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if(!productLoaded.value){
        productLoaded.value = true;
        context.read(homeViewModelProvider).getCartItems(args!.userId);
        context.read(homeViewModelProvider).getCustomerAddresses(args!.userId);
      }
    });
    final paymentMethod = useState('Pay on Delivery');

    final cartItems = useProvider(homeViewModelProvider).cartItems;

    final items = cartItems?.itemsModel ?? [];
    final allAddresses = useProvider(homeViewModelProvider).allAddresses;
    final carts = useProvider(cartViewModelProvider).carts;

    final time = useState('');
    final addressId = useState('0');
    final dateTime = useState(DateTime.now());
    DateTime pickedDate = DateTime.now();

    var timeLength = useState(0);
    var dateLength = useState(0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        backgroundColor: Color(0xffC0242D),
        centerTitle: false,
        title: Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 18),),
      ),
      body:
      // ProviderListener<HomeViewModel>(
      //   provider: homeViewModelProvider,
      //   onChange: (_, state){
      //     // if(state.isLoading){
      //     //   EasyLoading.show(indicator: CupertinoActivityIndicator(radius: 20,));
      //     // }
      //     if(state.isSuccess){
      //       EasyLoading.showSuccess('Order Placed Successfully')
      //           .then((value) => context.read(homeViewModelProvider).getOrders(args!.userId))
      //           .then((value) => Navigator.pushNamed(context, AppRoutes.orders))
      //           .then((value) => context.read(cartViewModelProvider).carts.clear()
      //       );
      //     }
      //   },
        Form(
          key: _formkey,
          child: Stack(
            children: [
              ListView(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red.shade50,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Services',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),


                          ],
                        ),
                        SizedBox(height: 5,),
                        ListView.builder(
                          itemCount: items.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_,index){
                            return  Container(
                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('${items[index].serviceName}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                                            SizedBox(height: 10,),
                                            RichText(
                                              text: TextSpan(
                                                  text: 'Rs.',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 16
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: '${items[index].servicePrice}',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.red,
                                                          fontSize: 16
                                                      ),
                                                    ) ,
                                                    TextSpan(
                                                      text: '/unit',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w300,
                                                          color: Colors.black,
                                                          fontSize: 16
                                                      ),
                                                    )]
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: GestureDetector(
                                                  onTap: ()async{
                                                    final userId = await context.read(secureStorageServiceProvider).getString('id');
                                                    print(userId);
                                                    await   context.read(homeViewModelProvider).deleteCartItem(DecreaseCartItemQuantityModel(
                                                      customerId: int.parse('$userId'),
                                                      serviceId: cartItems!.itemsModel![index].serviceID,
                                                    )).then((value) => context.read(homeViewModelProvider).getCartItems(userId));
                                                  },
                                                  child: Icon(Icons.delete_outline,size: 15,)),
                                            )
                                          ],
                                        ),


                                      ],
                                    ),
                                    Spacer(),
                                    RichText(
                                      text: TextSpan(
                                          text: 'Quantity:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 16
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '${items[index].serviceQuantity}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.red,
                                                  fontSize: 16
                                              ),)
                                          ]
                                      ) ,
                                    )
                                  ],
                                )
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text('Address',
                        style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),],
                  ),
                  SizedBox(height: 10,),
                  if(allAddresses.length>0)
                    Container(
                      // height: double.infinity,

                        child:    ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:  allAddresses.length>0? allAddresses.length :0,
                          itemBuilder: (context, index)=> Card(
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                                child:
                                Row(
                                  children: [
                                    Radio(
                                        value: '${allAddresses[index].addressId}',
                                        groupValue: addressId.value,
                                        onChanged: (val){
                                          addressId.value = '${val}';
                                          print(addressId.value);

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
                                                '${allAddresses[index].customerName}'
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
                                                    '${allAddresses[index].addressType}'
                                                    ,style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.w600,),),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            width: 250,
                                            child: Text(
                                              '${allAddresses[index].customerAddressLine1}, ${allAddresses[index].customerAddressLine2} , ${allAddresses[index].city} - ${allAddresses[index].pincode}\n State: ${allAddresses[index].state}\n city: ${allAddresses[index].city}',
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
                  SizedBox(height: 10,),
                  if(allAddresses!=null)
                    GestureDetector(
                      onTap: () async{
                        final userId = await context.read(secureStorageServiceProvider).getString('id');
                        await Navigator.pushNamed(context, AppRoutes.addNewAddress,);
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffC0242D)
                        ),
                        child: Center(
                          child: Text('Add Address',
                            style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  addressId.value =='0' ?  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.grey.shade200,
                    ),
                    height: 60,
                    child: Center(
                      child: Text(
                        'Select Timing',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ) :
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink.shade50
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Select Timing',
                              style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),],
                        ),
                        ListView.builder(
                          itemCount: items.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index){
                            return Card(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${items[index].serviceName}',
                                      style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w300),),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // height: 30,
                                          // width: 100,
                                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(3),
                                                border: Border.all(color: Colors.grey)
                                            ),
                                            // height: 30,
                                            // width: 140,
                                            child: Row(
                                              children: [
                                                // if(carts.length!=0 && carts[index].serviceDate!=null)
                                                Container(
                                                  // height: 40,
                                                  // width: 200,
                                                  child: Text(
                                                      '${carts[index].serviceDate}',
                                                    style: TextStyle(
                                                      fontSize: 10
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () async{

                                                    final DateTime? date = await showDatePicker(
                                                        context: context,
                                                        initialDate: pickedDate,
                                                        firstDate: DateTime.now(),
                                                        lastDate: DateTime(DateTime.now().year+5));
                                                    if(date != null && date != pickedDate) {
                                                      // pickedDate = date;
                                                      dateTime.value = date;
                                                      if(timeLength.value!=carts.length){
                                                        timeLength.value = timeLength.value+1;
                                                      }
                                                      // context.read(cartViewModelProvider).addToCart(CartsModel(
                                                      //   serviceDate: '$date'
                                                      // ));
                                                      var target = carts.firstWhere((item) => item.serviceId == carts[index].serviceId);
                                                      if (target != null) {
                                                        target.serviceDate = '${dateTime.value.year}-${dateTime.value.month}-${dateTime.value.day}';
                                                      }
                                                      print(time.value);
                                                    }
                                                  },
                                                  icon: Icon(Icons.calendar_today,size: 12,),
                                                ),

                                              ],
                                            )
                                        ),
                                        if(dateTime.value!=DateTime.now())
                                          Container(
                                            // height: 30,
                                            // width: 140,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey),
                                                  borderRadius: BorderRadius.circular(4)
                                              ),
                                              child: Row(
                                                children: [
                                                  // if(carts.length!=0 && carts[index].serviceTimeSlot != null)
                                                  //  carts[index].serviceTimeSlot == null ? Text(
                                                  //       '${time.value}'
                                                  //   ) :
                                                  Text(
                                                    '${carts[index].serviceTimeSlot}',
                                                    style: TextStyle(
                                                        fontSize: 10
                                                    ),
                                                  ),
                                                  SizedBox(width: 5,),
                                                  Container(
                                                    // padding: EdgeInsets.only(bottom: 10),
                                                    // height: 20,
                                                    // width: 30,
                                                    child: Center(
                                                      child: PopupMenuButton(
                                                        icon: Icon(Icons.arrow_drop_down),
                                                        itemBuilder: (_){
                                                          return [
                                                            PopupMenuItem(
                                                              child: TextButton(
                                                                onPressed: (){
                                                                  if(dateLength.value!=carts.length){
                                                                    dateLength.value = dateLength.value+1;
                                                                  }
                                                                  time.value = '10 am to 12 pm';

                                                                  // context.read(cartViewModelProvider).addToCart(CartsModel(
                                                                  //   serviceId: cartItems?.itemsModel?[index].serviceID,
                                                                  //   serviceDate: '${dateTime.value.year}-${dateTime.value.month}-${dateTime.value.day}',
                                                                  //   serviceTimeSlot: time.value,
                                                                  // ));
                                                                  var target = carts.firstWhere((item) => item.serviceId == carts[index].serviceId);
                                                                  if (target != null) {
                                                                    target.serviceTimeSlot = time.value;
                                                                  }

                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: Text(
                                                                  '10 am to 12 pm',
                                                                  style: TextStyle(
                                                                      color: Colors.black
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            PopupMenuItem(
                                                              child: TextButton(
                                                                onPressed: (){
                                                                  if(dateLength.value!=carts.length){
                                                                    dateLength.value = dateLength.value+1;
                                                                  }
                                                                  time.value = '12 pm to 2 pm';
                                                                  // context.read(cartViewModelProvider).addToCart(CartsModel(
                                                                  //   serviceId: cartItems?.itemsModel?[index].serviceID,
                                                                  //   serviceDate: '${dateTime.value}',
                                                                  //   serviceTimeSlot: '${dateTime.value.year}-${dateTime.value.month}-${dateTime.value.day}',
                                                                  // ));
                                                                  var target = carts.firstWhere((item) => item.serviceId == carts[index].serviceId);
                                                                  if (target != null) {
                                                                    target.serviceTimeSlot = time.value;
                                                                  }
                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: Text(
                                                                  '12 pm to 2 pm',
                                                                  style: TextStyle(
                                                                      color: Colors.black
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            PopupMenuItem(
                                                              child: TextButton(
                                                                onPressed: (){
                                                                  if(dateLength.value!=carts.length){
                                                                    dateLength.value = dateLength.value+1;
                                                                  }
                                                                  time.value = '2 pm to 4 pm';
                                                                  // context.read(cartViewModelProvider).addToCart(CartsModel(
                                                                  //   serviceId: cartItems?.itemsModel?[index].serviceID,
                                                                  //   serviceDate: '${dateTime.value.year}-${dateTime.value.month}-${dateTime.value.day}',
                                                                  //   serviceTimeSlot: time.value,
                                                                  // ));
                                                                  var target = carts.firstWhere((item) => item.serviceId == carts[index].serviceId);
                                                                  if (target != null) {
                                                                    target.serviceTimeSlot = time.value;
                                                                  }
                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: Text(
                                                                  '2 pm to 4 pm',
                                                                  style: TextStyle(
                                                                      color: Colors.black
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            PopupMenuItem(
                                                              child: TextButton(
                                                                onPressed: (){
                                                                  if(dateLength.value!=carts.length){
                                                                    dateLength.value = dateLength.value+1;
                                                                  }
                                                                  time.value = '4 pm to 6 pm';
                                                                  // context.read(cartViewModelProvider).addToCart(CartsModel(
                                                                  //   serviceId: cartItems?.itemsModel?[index].serviceID,
                                                                  //   serviceDate: '${dateTime.value.year}-${dateTime.value.month}-${dateTime.value.day}',
                                                                  //   serviceTimeSlot: time.value,
                                                                  // ));
                                                                  var target = carts.firstWhere((item) => item.serviceId == carts[index].serviceId);
                                                                  if (target != null) {
                                                                    target.serviceTimeSlot = time.value;
                                                                  }
                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: Text(
                                                                  '4 pm to 6 pm',
                                                                  style: TextStyle(
                                                                      color: Colors.black
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ];
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                          )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.shade50
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Payment Options',
                              style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),],
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          paymentMethod.value = 'Pay on Delivery';
                                          print(paymentMethod.value);
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                              color: paymentMethod.value == 'Pay on Delivery' ? Colors.green : Colors.white
                                          ),
                                          child: paymentMethod.value == 'Pay on Delivery' ? Icon(Icons.done,color: Colors.white,size: 18,) : null,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 250,
                                      child: Text('Pay On Delivery',style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15
                                      ),),
                                    )
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     Padding(
                                //       padding: const EdgeInsets.all(8.0),
                                //       child: GestureDetector(
                                //         onTap: (){
                                //           paymentMethod.value = 'Bank Transfer';
                                //           print(paymentMethod.value);
                                //         },
                                //         child: Container(
                                //           height: 20,
                                //           width: 20,
                                //           decoration: BoxDecoration(
                                //               border: Border.all(color: Colors.black),
                                //               color: paymentMethod.value == 'Bank Transfer' ? Colors.green : Colors.white
                                //           ),
                                //           child: paymentMethod.value == 'Bank Transfer' ? Icon(Icons.done,color: Colors.white,size: 18,) : null,
                                //         ),
                                //       ),
                                //     ),
                                //     Container(
                                //       width: 250,
                                //       child: Text('Bank Transfer',style: TextStyle(
                                //           color: Colors.black,
                                //           fontSize: 15
                                //       ),),
                                //     )
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if(timeLength.value == carts.length && dateLength.value == carts.length)
                  GestureDetector(
                    onTap: (){
                      if(_formkey.currentState!.validate()){
                        context.read(homeViewModelProvider).creatrOrder(CreateOrderModel(
                          customerId: args!.userId,
                          customerAddressId: int.parse('${addressId.value}'),
                          paymentType: paymentMethod.value,
                          locationId: args!.locationId,
                          orderItem: carts,))
                            .then((value) => context.read(homeViewModelProvider).getOrders(int.parse('${args!.userId}')))
                            .then((value) => EasyLoading.showSuccess('Order Placed Successfully'))
                            .then((value) => Navigator.pushNamed(context, AppRoutes.orders))
                            .then((value) => context.read(cartViewModelProvider).carts.clear())
                           .then((value) => context.read(homeViewModelProvider).getCartItems(args!.userId))
                            .then((value) => context.read(homeViewModelProvider).cartItems?.itemsModel?.clear());
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xffC0242D)
                      ),
                      height: 40,
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 2),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),

              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(height: 50,color: Colors.red,)
              //   ],
              // ),
            ],
          ),
        ),
      );
  }
}

