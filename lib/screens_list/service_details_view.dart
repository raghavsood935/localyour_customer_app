import 'package:app/auth/auth_user_model.dart';
import 'package:app/network_files/models.dart';
import 'package:app/network_files/view_model.dart';
import 'package:app/screens_list/carts.dart';
import 'package:app/screens_list/child_services.dart';
import 'package:app/views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../router.dart';
import '../secure_storage.dart';
import 'checkout_view.dart';
import 'my_cart_view.dart';

class ServiceDetailsViewArgs {
  String? serviceName;
  String? locationName;
  String? subLocation;
  String? serviceSlug;
  int? locationId;
  int? customerId;
  ServiceDetailsViewArgs(
      {this.serviceName,
      this.locationName,
      this.subLocation,
      this.serviceSlug,
      this.customerId,
      this.locationId});
}

class ServiceDetailsView extends HookWidget {
  final ServiceDetailsViewArgs? args;
  ServiceDetailsView({Key? key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productLoaded = useState(false);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (!productLoaded.value) {
        productLoaded.value = true;
        context.read(homeViewModelProvider).getServiceDetails(
            '${args!.serviceSlug!}',
            '${args!.locationName!}',
            '${args!.subLocation!}');
      }
    });

    final isLoading = useProvider(homeViewModelProvider).isLoading;
    final serviceDetails =
        useProvider(homeViewModelProvider).serviceDetailsModel;
    final seviceFAQ = serviceDetails?.serviceFaqModel ?? [];
    final serviceCategoryDetails = serviceDetails?.categoryModel ?? [];
    final datevalue = useState(DateTime.now());
    final cartItems = useProvider(homeViewModelProvider).cartItems;
    final moveCheckout = useState(-1);
    final addresses =
        context.read(homeViewModelProvider).customerProfile?.addresses ?? [];
    final customerId =
        context.read(secureStorageServiceProvider).getString('id');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC0242D),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          args!.serviceName! == null ? '' : args!.serviceName!,
          style: TextStyle(color: Colors.white),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(6.0),
        //     child: GestureDetector(
        //         onTap: () async{
        //           final userId = await context.read(secureStorageServiceProvider).getString('id');
        //           // showModalBottomSheet(
        //           //     backgroundColor: Colors.transparent,
        //           //     context: context,
        //           //     isScrollControlled: true,
        //           //     isDismissible: true,
        //           //     builder: (BuildContext context) {
        //           //       return DraggableScrollableSheet(
        //           //           initialChildSize: 0.75, //set this as you want
        //           //           maxChildSize: 0.75, //set this as you want
        //           //           minChildSize: 0.75, //set this as you want
        //           //           expand: true,
        //           //           builder: (context, scrollController) {
        //           //             return Container(
        //           //               child: Center(
        //           //                 child: Container(
        //           //                   decoration: BoxDecoration(
        //           //                       borderRadius: BorderRadius.only(
        //           //                           topLeft: Radius.circular(25),
        //           //                           topRight:
        //           //                           Radius.circular(25)),
        //           //                       color: Colors.pink.shade50
        //           //                   ),
        //           //                   child: MyCartView(
        //           //                     args: MyCartViewArgs(
        //           //                         customerId: int.parse('$userId'),
        //           //                         locationId: args?.locationId,
        //           //                         addressId: addresses[0].addressId
        //           //                     ),
        //           //                   ),
        //           //                 ),
        //           //               ),
        //           //             ); //whatever you're returning, does not have to be a Container
        //           //           }
        //           //       );
        //           //     }
        //           // );
        //           Navigator.pushNamed(context, AppRoutes.myCart,arguments: MyCartViewArgs(
        //             addressId: addresses[0].addressId,
        //             locationId: args!.locationId,
        //           ));
        //         },
        //         child: Stack(
        //           children: [
        //             Container(
        //               child: Icon(
        //                 Icons.shopping_cart,
        //                 size: 25,
        //               ),
        //             ),
        //             if(cartItems?.itemsModel != null)
        //               Positioned(
        //                   right: 0,
        //                   top: 0,
        //                   child: CircleAvatar(
        //                     radius: 6,
        //                     backgroundColor: Colors.red,
        //                     child: Text(
        //                       '${cartItems!.itemsModel!.length.toString()}',
        //                       style: TextStyle(
        //                           fontSize: 10,
        //                           color: Colors.white
        //                       ),
        //                     ),
        //                   ))
        //           ],
        //         ),
        //       ),
        //   ),
        // ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressBar(),
            )
          : ListView(
              children: [
                Container(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 170,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                '${serviceDetails?.serviceBannerUrl}'),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: [
                        Text(
                          '${args!.serviceName} in \n${args!.locationName}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xffC0242D),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${args!.serviceName} in \n${args!.locationName}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        height: 20,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xffC0242D),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 18,
                            ),
                            Text(
                              '5.00 out of 5',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        itemCount: serviceCategoryDetails.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index1) {
                          return GestureDetector(
                            onTap: () {
                              moveCheckout.value = index1;
                              datevalue.value == DateTime.now();
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  isScrollControlled: true,
                                  isDismissible: true,
                                  builder: (BuildContext context) {
                                    return DraggableScrollableSheet(
                                        initialChildSize:
                                            0.95, //set this as you want
                                        maxChildSize:
                                            0.95, //set this as you want
                                        minChildSize:
                                            0.95, //set this as you want
                                        expand: true,
                                        builder: (context, scrollController) {
                                          return Container(
                                            // height: 340,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(25),
                                                  topRight:
                                                      Radius.circular(25)),
                                              color: Colors.pink.shade50,
                                            ),
                                            child: Column(
                                              children: [
                                                AppBar(
                                                  backgroundColor:
                                                      Color(0xffC0242D),
                                                  leading: IconButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    icon: Icon(
                                                      Icons.arrow_back,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  centerTitle: false,
                                                  title: Text(
                                                    '${serviceCategoryDetails[index1].childCategory!.toUpperCase()}',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                // if(datevalue.value.second > DateTime.now().second + 4)
                                                Expanded(
                                                  child: Container(
                                                    // height: 350,
                                                    child: ListView.builder(
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      physics:
                                                          AlwaysScrollableScrollPhysics(),
                                                      itemCount:
                                                          serviceCategoryDetails[
                                                                  index1]
                                                              .categoryChildrenModel
                                                              ?.length,
                                                      itemBuilder: (_, index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            if (serviceCategoryDetails[
                                                                        index1]
                                                                    .categoryChildrenModel![
                                                                        index]
                                                                    .price ==
                                                                null) {
                                                              showModalBottomSheet(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  context:
                                                                      context,
                                                                  isScrollControlled:
                                                                      true,
                                                                  isDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return DraggableScrollableSheet(
                                                                        initialChildSize:
                                                                            0.75, //set this as you want
                                                                        maxChildSize:
                                                                            0.75, //set this as you want
                                                                        minChildSize:
                                                                            0.75, //set this as you want
                                                                        expand:
                                                                            true,
                                                                        builder:
                                                                            (context,
                                                                                scrollController) {
                                                                          return Container(
                                                                            // height: 340,
                                                                            padding:
                                                                                EdgeInsets.all(10),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                                                                              color: Colors.pink.shade50,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                AppBar(
                                                                                  backgroundColor: Color(0xffC0242D),
                                                                                  leading: IconButton(
                                                                                    onPressed: () => Navigator.of(context).pop(),
                                                                                    icon: Icon(
                                                                                      Icons.arrow_back,
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                  ),
                                                                                  centerTitle: true,
                                                                                  title: Text(
                                                                                    '${serviceCategoryDetails[index1].categoryChildrenModel?[index].childOfChildrenModel?[index].parentCategory.toUpperCase()}',
                                                                                    style: TextStyle(fontSize: 20, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 3,
                                                                                  child: Container(
                                                                                    child: ListView.builder(
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      physics: AlwaysScrollableScrollPhysics(),
                                                                                      itemCount: serviceCategoryDetails[index1].categoryChildrenModel?[index].childOfChildrenModel?.length,
                                                                                      itemBuilder: (_, index2) {
                                                                                        return Container(
                                                                                          // height: 400,
                                                                                          child: Card(
                                                                                            child: Container(
                                                                                              color: Colors.grey,
                                                                                              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                                                                                              child: Container(
                                                                                                color: Colors.white,
                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                child: Container(
                                                                                                  margin: EdgeInsets.symmetric(vertical: 10),
                                                                                                  child: Row(
                                                                                                    children: [
                                                                                                      Column(
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 220,
                                                                                                            child: Text(
                                                                                                              '${serviceCategoryDetails[index1].categoryChildrenModel?[index].childOfChildrenModel?[index2].childCategory}',
                                                                                                              style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w900),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            'Rs .${serviceCategoryDetails[index1].categoryChildrenModel![index].childOfChildrenModel?[index2].price}',
                                                                                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xffC0242D)),
                                                                                                          )
                                                                                                        ],
                                                                                                      ),
                                                                                                      GestureDetector(
                                                                                                        onTap: () async {
                                                                                                          // if(moveCheckout.value == -1){
                                                                                                          // if(serviceCategoryDetails[index].categoryChildrenModel?[index].childOfChildrenModel?[index].price != null){
                                                                                                          // final locationId = await context.read(secureStorageServiceProvider).getString('location_id');
                                                                                                          if (customerId != null) {
                                                                                                            await context
                                                                                                                .read(homeViewModelProvider)
                                                                                                                .addToCart(AddToCartModel(
                                                                                                                  customerId: int.parse('$customerId'),
                                                                                                                  locationId: args!.locationId,
                                                                                                                  serviceId: int.parse('${serviceCategoryDetails[index1].categoryChildrenModel?[index].childOfChildrenModel?[index2].serviceId}'),
                                                                                                                ))
                                                                                                                .then((value) => context.read(cartViewModelProvider).addToCart(CartsModel(serviceId: serviceCategoryDetails[index1].categoryChildrenModel?[index].childOfChildrenModel?[index2].serviceId, serviceDate: 'select date', serviceTimeSlot: 'select time')))
                                                                                                                .then((value) => EasyLoading.showSuccess('Added to Cart Successfully'))
                                                                                                                .then((value) => context.read(homeViewModelProvider).getCartItems(customerId))
                                                                                                                .then((value) => moveCheckout.value = 1);
                                                                                                          } else {
                                                                                                            EasyLoading.showToast('You arenot logged in!\nPlease login first').then((value) => Navigator.pushNamed(context, AppRoutes.loginPage));
                                                                                                          }
                                                                                                          // }else{
                                                                                                          //         final userId = await context.read(secureStorageServiceProvider).getString('id');
                                                                                                          //         await Navigator.pushNamed(context, AppRoutes.checkoutView,
                                                                                                          //         arguments: CheckoutViewArgs(
                                                                                                          //           userId: int.parse('$userId'),
                                                                                                          //           locationId: args!.locationId,
                                                                                                          //           addressId: 0,
                                                                                                          //         )
                                                                                                          //         );
                                                                                                          //       }
                                                                                                          // }
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          height: 29,
                                                                                                          width: 66,
                                                                                                          decoration: BoxDecoration(
                                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                                            color: Color(0xffC0242D),
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                height: 25,
                                                                                                                width: 40,
                                                                                                                decoration: BoxDecoration(
                                                                                                                    // borderRadius: BorderRadius.circular(5),
                                                                                                                    color: Colors.white),
                                                                                                                child: Center(
                                                                                                                  child: Text(
                                                                                                                    'Add',
                                                                                                                    style: TextStyle(fontSize: 15, color: Color(0xffC0242D), fontWeight: FontWeight.bold),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Container(
                                                                                                                height: 25,
                                                                                                                width: 22,
                                                                                                                decoration: BoxDecoration(
                                                                                                                    // borderRadius: BorderRadius.circular(5),
                                                                                                                    //   color: Colors.white
                                                                                                                    ),
                                                                                                                child: Center(
                                                                                                                  child: Icon(
                                                                                                                    Icons.add,
                                                                                                                    color: Colors.white,
                                                                                                                    size: 20,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              )
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if (cartItems?.itemsModel != null)
                                                                                  GestureDetector(
                                                                                    onTap: () async {
                                                                                      if (addresses.length > 0) {
                                                                                        final userId = await context.read(secureStorageServiceProvider).getString('id');
                                                                                        await Navigator.pushNamed(context, AppRoutes.checkoutView,
                                                                                            arguments: CheckoutViewArgs(
                                                                                              userId: args!.customerId,
                                                                                              locationId: args!.locationId,
                                                                                              // addressId: addresses[0].addressId,
                                                                                            ));
                                                                                      } else {
                                                                                        EasyLoading.showToast('you haven/t added any address!\nAdd Address First').then((value) => Navigator.pushNamed(context, AppRoutes.addNewAddress));
                                                                                      }
                                                                                    },
                                                                                    child: Container(
                                                                                      // height: 40,
                                                                                      // width: 200,
                                                                                      margin: EdgeInsets.symmetric(horizontal: 4),
                                                                                      padding: EdgeInsets.all(10),
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffC0242D)),
                                                                                      child: Center(
                                                                                        child: Text(
                                                                                          'Proceed to Checkout',
                                                                                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                              ],
                                                                            ),
                                                                          ); //whatever you're returning, does not have to be a Container
                                                                        });
                                                                  });
                                                            }
                                                          },
                                                          child: Container(
                                                            // height: 400,
                                                            child: Card(
                                                              child: Container(
                                                                color:
                                                                    Colors.grey,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            1,
                                                                        horizontal:
                                                                            1),
                                                                child:
                                                                    Container(
                                                                  color: Colors
                                                                      .white,
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            10),
                                                                    child: Row(
                                                                      children: [
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              width: 220,
                                                                              child: Text(
                                                                                '${serviceCategoryDetails[index1].categoryChildrenModel![index].childCategory!.toUpperCase()}',
                                                                                style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w900),
                                                                              ),
                                                                            ),
                                                                            if (serviceCategoryDetails[index1].categoryChildrenModel![index].price !=
                                                                                null)
                                                                              Text(
                                                                                'Rs .${serviceCategoryDetails[index1].categoryChildrenModel![index].price}',
                                                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xffC0242D)),
                                                                              )
                                                                          ],
                                                                        ),

                                                                        // Icon(Icons.add_shopping_cart_outlined)
                                                                        if (serviceCategoryDetails[index1].categoryChildrenModel?[index].price !=
                                                                            null)
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () async {
                                                                              print('?????????????//====================${serviceCategoryDetails[index].categoryChildrenModel?[index].childOfChildrenModel?.length}==============??????????????????');
                                                                              if (serviceCategoryDetails[index1].categoryChildrenModel?[index].price != null) {
                                                                                final customerId = await context.read(secureStorageServiceProvider).getString('id');
                                                                                // final locationId = await context.read(secureStorageServiceProvider).getString('location_id');
                                                                                await context
                                                                                    .read(homeViewModelProvider)
                                                                                    .addToCart(AddToCartModel(
                                                                                      customerId: int.parse('$customerId'),
                                                                                      locationId: args!.locationId,
                                                                                      serviceId: int.parse('${serviceCategoryDetails[index1].categoryChildrenModel![index].serviceId}'),
                                                                                    ))
                                                                                    .then((value) => context.read(cartViewModelProvider).addToCart(CartsModel(serviceId: serviceCategoryDetails[index1].categoryChildrenModel?[index].serviceId, serviceDate: 'select date', serviceTimeSlot: 'select time')))
                                                                                    .then((value) => EasyLoading.showSuccess('Added to Cart Successfully'))
                                                                                    .then((value) => context.read(homeViewModelProvider).getCartItems(customerId))
                                                                                    .then((value) => print('~~~~~~~~~~~~~~~~~~${serviceCategoryDetails[index].categoryChildrenModel?[index].serviceId}'));
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: 29,
                                                                              width: 66,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(4),
                                                                                color: Color(0xffC0242D),
                                                                              ),
                                                                              child: Center(
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(
                                                                                      height: 25,
                                                                                      width: 40,
                                                                                      decoration: BoxDecoration(
                                                                                          // borderRadius: BorderRadius.circular(5),
                                                                                          color: Colors.white),
                                                                                      child: Center(
                                                                                        child: Text(
                                                                                          'Add',
                                                                                          style: TextStyle(fontSize: 15, color: Color(0xffC0242D), fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      height: 25,
                                                                                      width: 22,
                                                                                      decoration: BoxDecoration(
                                                                                          // borderRadius: BorderRadius.circular(5),
                                                                                          //   color: Colors.white
                                                                                          ),
                                                                                      child: Center(
                                                                                        child: Icon(
                                                                                          Icons.add,
                                                                                          color: Colors.white,
                                                                                          size: 20,
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                if (cartItems!
                                                        .itemsModel!.length >
                                                    0)
                                                  Expanded(
                                                    child: MyCartView(
                                                      args: MyCartViewArgs(
                                                          customerId:
                                                              args!.customerId,
                                                          locationId:
                                                              args!.locationId,
                                                          addressId:
                                                              addresses.length >
                                                                      0
                                                                  ? addresses[0]
                                                                      .addressId
                                                                  : 0),
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ); //whatever you're returning, does not have to be a Container
                                        });
                                  });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 220,
                                      child: Text(
                                        '${serviceCategoryDetails[index1].childCategory!.toUpperCase()}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Queries: ',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      ListView.builder(
                        itemCount: seviceFAQ.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Row(
                              children: [
                                Container(
                                  width: 280,
                                  child: Text(
                                    '${seviceFAQ[index].question}',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                                Spacer(),
                                PopupMenuButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  itemBuilder: (_) {
                                    return [
                                      PopupMenuItem(
                                        child: Container(
                                          width: 280,
                                          child: Text(
                                            '${seviceFAQ[index].answer}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ];
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Text(
                        'Can/t Find Your Service?',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        child: Text(
                          'click here',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          Text(
                            '+91-983603118',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Html(
                      data: serviceDetails!.serviceDetails,
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Html(
                      data: serviceDetails.serviceOverview,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
