import 'package:app/network_files/models.dart';
import 'package:app/network_files/view_model.dart';
import 'package:app/router.dart';
import 'package:app/views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ManageAddressViewArgs{
  int? customerId;
  ManageAddressViewArgs({this.customerId});
}

class ManageAddressView extends HookWidget {
  final ManageAddressViewArgs? args;
  const ManageAddressView({Key? key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productLoaded = useState(false);
    // final homeVM = useProvider(homeViewModelProvider);
    WidgetsBinding.instance!.addPostFrameCallback((_) async{
      if(!productLoaded.value){
        productLoaded.value = true;
        // userVM.getAllAddress();
        context.read(homeViewModelProvider).getCustomerAddresses(args!.customerId!);
      }
    });
    final isLoading = useProvider(homeViewModelProvider).isLoading;
    final allAddresses = useProvider(homeViewModelProvider).allAddresses ;
    return Scaffold(
      backgroundColor: Color(0xffDEDCE1),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=>Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            // size: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xffC0242D),
        title: Text('Manage Adresses',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: isLoading ? Center(child: CircularProgressBar(),) :
      Stack(
        children: [
          ListView(
          padding: EdgeInsets.symmetric(vertical: 20),
          children: [
           allAddresses.length != 0 ? Container(
             child: Column(
               children: [
                 ListView.builder(
                   itemCount: allAddresses.length,
                   shrinkWrap: true,
                   scrollDirection: Axis.vertical,
                   physics: NeverScrollableScrollPhysics(),
                   itemBuilder: (_,index){
                     return Card(

                       // margin: EdgeInsets.all(15),
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               children: [
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Container(
                                       // width: 100,
                                       child: Text(
                                           '${allAddresses[index].customerName?.toUpperCase()}',
                                         style: TextStyle(
                                           fontWeight: FontWeight.w800,
                                           fontSize: 12,
                                           decorationStyle: TextDecorationStyle.wavy
                                         ),
                                       ),
                                     ),
                                     // SizedBox(width: 10,),

                                     SizedBox(height: 4,),
                                     Text(
                                       '${allAddresses[index].customerEmail}',
                                       style: TextStyle(
                                           fontWeight: FontWeight.w500,
                                           fontSize: 15,
                                           decorationStyle: TextDecorationStyle.wavy
                                       ),
                                     ),

                                   ],
                                 ),

                                 Spacer(),
                                 PopupMenuButton(
                                   icon: Icon(Icons.more_vert_rounded),
                                   itemBuilder: (_){
                                     return [
                                       PopupMenuItem(
                                         child: TextButton(
                                           onPressed: (){
                                             Navigator.pushNamed(context, AppRoutes.addNewAddress,
                                                 arguments: allAddresses[index]
                                             );
                                           },
                                           child: Text(
                                               'Edit'
                                           ),
                                         ),
                                       ),
                                       PopupMenuItem(
                                         child: TextButton(
                                           onPressed: (){
                                             context.read(homeViewModelProvider).deleteAddress(DeleteAddressModel(
                                               addressId: allAddresses[index].addressId,
                                             )).then((value) => allAddresses.removeWhere((element) => element.addressId == allAddresses[index].addressId))
                                                 .then((value) => context.read(homeViewModelProvider).getCustomerAddresses(args!.customerId))
                                                 .then((value) => EasyLoading.showSuccess('Address Deleted Successfully')).then((value) => allAddresses.removeWhere((element) => element.addressId == allAddresses[index].addressId)).then((value) => Navigator.of(context).pop());
                                           },
                                           child: Text(
                                               'Delete'
                                           ),
                                         ),
                                       )
                                     ];
                                   },
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 Icon(CupertinoIcons.phone_fill,size: 10,),
                                 Text(
                                   '${allAddresses[index].customerPhoneNumber}',
                                   style: TextStyle(
                                       fontWeight: FontWeight.w500,
                                       fontSize: 12,
                                       decorationStyle: TextDecorationStyle.wavy
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 Icon(CupertinoIcons.home,size: 10,),
                                 Text(
                                   '${allAddresses[index].customerAddressLine1}',
                                   style: TextStyle(
                                       fontWeight: FontWeight.w500,
                                       fontSize: 12,
                                       decorationStyle: TextDecorationStyle.wavy
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 Icon(CupertinoIcons.home,size: 10,),
                                 Text(
                                   '${allAddresses[index].customerAddressLine2}',
                                   style: TextStyle(
                                       fontWeight: FontWeight.w500,
                                       fontSize: 12,
                                       decorationStyle: TextDecorationStyle.wavy
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 Icon(CupertinoIcons.location_fill,size: 10,),
                                 Text(
                                   '${allAddresses[index].city}',
                                   style: TextStyle(
                                       fontWeight: FontWeight.w500,
                                       fontSize: 12,
                                       decorationStyle: TextDecorationStyle.wavy
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 // Icon(CupertinoIcons.none,size: 10,),
                                 Text(
                                   '${allAddresses[index].state}',
                                   style: TextStyle(
                                       fontWeight: FontWeight.w500,
                                       fontSize: 12,
                                       decorationStyle: TextDecorationStyle.wavy
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 // Icon(CupertinoIcons.home,size: 10,),
                                 Text(
                                   '${allAddresses[index].pincode}',
                                   style: TextStyle(
                                       fontWeight: FontWeight.w500,
                                       fontSize: 12,
                                       decorationStyle: TextDecorationStyle.wavy
                                   ),
                                 ),
                               ],
                             ),
                             // Container(
                             //   // width: 400,
                             //   child: Text(
                             //       '\n${allAddresses[index].customerAddressLine1}'
                             //       '\n${allAddresses[index].customerAddressLine2}'
                             //       '\n${allAddresses[index].city}'
                             //       '\n${allAddresses[index].state}'
                             //       '\n${allAddresses[index].pincode}',
                             //     style: TextStyle(fontSize: 12,color: Colors.black),),
                             // ),


                           ],
                         ),
                       ),
                     );
                   },
                 ),

                 SizedBox(height: 100,),


               ],
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
                                 'assets/images/address.png'
                             ),
                             fit: BoxFit.fill
                         )
                     ),
                   ),
                   SizedBox(height: 15,),
                   Text(
                     'You haven\'t added any address yet',
                     style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.w700,
                       // color: Colors.white
                     ),
                   ),
                 ],
               ),
             ),
           ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: ()=>Navigator.pushNamed(context, AppRoutes.addNewAddress),
              child: Container(
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color(0xffC0242D)),
                  height: 50,
    color: Color(0xffC0242D),
                  // margin: EdgeInsets.symmetric(
                  //   horizontal: 15,
                  // ),
                  child:Center(
                    child: Text(
                      '+ Add New Address',
                      style: TextStyle(fontSize: 18,color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ],
        )
        ]
      ),
    );
  }
}

