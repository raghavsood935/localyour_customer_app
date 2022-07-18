import 'dart:ffi';
import 'dart:math';

import 'package:app/network_files/models.dart';
import 'package:app/router.dart';
import 'package:app/screens_list/my_profile_view.dart';
import 'package:app/screens_list/orders_view.dart';
import 'package:app/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:async';
import '../network_files/repository.dart';
import '../network_files/view_model.dart';
import '../login_register/repository.dart';





class MainDrawer extends HookWidget {
  Reader? read;


  @override
  Widget build(BuildContext context) {
    Future<void> share() async {
      await FlutterShare.share(
          title: 'Example share',
          text: 'Share LocalYour',
          linkUrl: 'https://localyour.com',
          chooserTitle: 'Share LocalYour with your contacts');
    }
    final isLoading = useProvider(homeViewModelProvider).isLoading;
    return isLoading ? Center(child: CupertinoActivityIndicator(radius: 20,),) :
    Drawer(
      child: Column(
        children: [

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
            color: Color(0xffC0242D),
            width: double.infinity,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/proofile.png'),
                ),
                SizedBox(width: 8,),
                Text (
                   "User" ,
                  style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
              ],
            ),
          ),

          GestureDetector(
            onTap: ()  async{
              final userId = await context.read(secureStorageServiceProvider).getString('id');
             // context.read(homeViewModelProvider).getOrders(int.parse('$userId'));
             await Navigator.pushNamed(context, AppRoutes.orders,arguments: OrdersViewArgs(customerId: userId
             ));

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Orders',style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async{
              final storageProvider = context.read(secureStorageServiceProvider);
              final csId = await storageProvider.getString('id');
              context.read(homeViewModelProvider).customerProfileInfo(CustomerId(customerID: int.parse('$csId')));
              Navigator.pushNamed(context, AppRoutes.myProfile,arguments: ProfileViewArgs(userId: int.parse('$csId')));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Profile',style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              share();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Refer Localyour',style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Rate Localyour',style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('About Localyour',style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Register as a Partner',style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async{
              await context.read(secureStorageServiceProvider).deleteString('id')
                  .then((value) =>  context.read(secureStorageServiceProvider).deleteString('customer_name'))
                  .then((value) => context.read(secureStorageServiceProvider).deleteString('customer_email'))
                  .then((value) => context.read(secureStorageServiceProvider).deleteString('customer_phone'))
                  .then((value) => context.read(secureStorageServiceProvider).deleteString('token'))
                  .then((value) => EasyLoading.showToast('Logged Out Successfully'))
                  .then((value) => Navigator.pushNamed(context, AppRoutes.loginPage));
              // Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Logout',style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
          //   child: Row(
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(10),
          //         child: Text('Promo code',style: TextStyle(fontSize: 20),),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
          //   child: Row(
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(10),
          //         child: Text('Free service',style: TextStyle(fontSize: 20),),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
          //   child: Row(
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(10),
          //         child: Text('Notification',style: TextStyle(fontSize: 20),),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
          //   child: Row(
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(10),
          //         child: Text('Offers',style: TextStyle(fontSize: 20),),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text('Turn location on',style: TextStyle(fontSize: 20),),
          //
          //       AnimatedContainer(
          //         duration: Duration(milliseconds: 1000),
          //         height: 24,
          //         width: 50,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //             color: toggleValue ? Color(0xffaefcfb):Color(0xffcacccc).withOpacity(0.5)
          //         ),
          //         child: Stack(
          //           children: [
          //             AnimatedPositioned(
          //
          //               duration: Duration(milliseconds: 1000),
          //               curve: Curves.easeIn,
          //               top: 3,
          //               left: toggleValue ? 30:0,
          //               right: toggleValue ? 0:30,
          //               child: InkWell(
          //                 onTap: toggleButton,
          //                 child: AnimatedSwitcher(
          //                   duration: Duration(milliseconds: 1000),
          //                   transitionBuilder: ( Widget child, Animation<double> animation) {
          //                     return ScaleTransition(scale: animation,child: child,);
          //                   },
          //                   child: toggleValue ? Icon(Icons.check_circle,color: Color(0xff3D3DD8),size: 20,key: UniqueKey(),
          //                   ) : Icon(Icons.remove_circle_outline,color: Colors.grey,size: 20,key: UniqueKey(),),
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

        ],
      ),
    );
  }
}

  toggleButton(){

      toggleValue = ! toggleValue;
}
bool toggleValue = false;
