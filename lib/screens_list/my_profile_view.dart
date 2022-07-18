import 'package:app/auth/auth_user_model.dart';
import 'package:app/login_register/login_page.dart';
import 'package:app/network_files/models.dart';
import 'package:app/network_files/repository.dart';
import 'package:app/network_files/view_model.dart';
import 'package:app/page6.dart';
import 'package:app/screens_list/edit_profile_view.dart';
import 'package:app/screens_list/manage_address_view.dart';
import 'package:app/screens_list/painting_services_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../router.dart';
import '../secure_storage.dart';
import 'orders_view.dart';

class ProfileViewArgs {
  int? userId;
  ProfileViewArgs({this.userId});
}

class ProfileView extends HookWidget {
  final ProfileViewArgs? args;
  ProfileView({this.args});

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final productLoaded = useState(false);
    // ShareModel? shareModel;

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!productLoaded.value) {
        productLoaded.value = true;
        context
            .read(homeViewModelProvider)
            .customerProfileInfo(CustomerId(customerID: args!.userId));
        print('123456789');
      }
    });
    final profile = useProvider(homeViewModelProvider).customerProfile;
    final isLoading = useProvider(homeViewModelProvider).isLoading;
    final homeProvider = useProvider(homeViewModelProvider);
    print(profile?.profileInfo?.customerPhone);
    Future<void> share() async {
    await FlutterShare.share(
          title: 'LocalYour',
          text: 'Download the LocalYour App Here !',
          linkUrl: 'https://localyour.com',
          chooserTitle: 'Share LocalYour With Your Contacts');
    };

    return Scaffold(
      backgroundColor: Color(0xfff0f1f0),
      appBar: AppBar(
        backgroundColor: Color(0xffC0242D),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 19
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CupertinoActivityIndicator(
                radius: 30,
              ),
            )
          : ListView(
              // padding: EdgeInsets.symmetric(vertical: 20),
              children: [
                // Text(
                //   '${profile?.profileInfo?.customerName}'
                // ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10,right: 2),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      // Icon(Icons.mail_outline_rounded,size: 15,color: Colors.grey,),
                                      // SizedBox(width: 10,),
                                      Text(
                                        // 'anythig',
                                        ' ${profile?.profileInfo?.customerName}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 5,),
                                      Icon(
                                        CupertinoIcons.phone,
                                        size: 17,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        ' ${profile?.profileInfo?.customerPhone}',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey.shade400)
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, AppRoutes.editProfile,
                                          arguments: EditProfileViewArgs(
                                              name: profile
                                                  ?.profileInfo?.customerName,
                                              email: profile
                                                  ?.profileInfo?.customerEmail,
                                              phoneNumber: profile?.profileInfo
                                                  ?.customerPhone
                                          )
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.black54,
                                    ),
                                    iconSize: 17,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 100,
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10,),
                child: Container(
                  height: 55,
                  width: 500,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.captions_bubble_fill,
                        color: Colors.black54,
                        size: 21,
                      ),
                      SizedBox(width: 20,),
                      Text(
                        // 'anythig',
                        'Help Center',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                 )
                ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GestureDetector(
                    onTap: () async {
                      final userId = await context.read(secureStorageServiceProvider).getString('id');
                      // context.read(homeViewModelProvider).getOrders(int.parse('$userId'));
                      await Navigator.pushNamed(context,
                          AppRoutes.orders,
                          arguments: OrdersViewArgs(
                          customerId: userId
                      ));
                    },
                    child: Row(
                      children: [
                        Icon(
                            CupertinoIcons.cube_box,
                            size: 22,
                            color: Colors.black54
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Order History',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1,),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GestureDetector(
                    onTap: () async {
                      final customerId = await context
                          .read(secureStorageServiceProvider)
                          .getString('id');
                      print(customerId);
                      await Navigator.pushNamed(
                          context,
                          AppRoutes.manageAddress,
                          arguments: ManageAddressViewArgs(
                              customerId: int.parse('$customerId')
                          ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.house,
                          size: 22,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Manage Addresses',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                         CupertinoIcons.question_diamond,
                          size: 22,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'About Localyour',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      share();
                    },
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.share,
                          size: 22,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Share Localyour',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          size: 22,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Rate Localyour',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      launchURL("https://play.google.com/store/apps/details?id=com.localyour.partner");
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.handshake_outlined,
                          color: Colors.black54,
                          size: 22,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Register As a Partner',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, AppRoutes.addNewAddress);
                    },
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.money_dollar_circle,
                          size: 22,
                            color: Colors.black54
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Payment Options',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1,),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, AppRoutes.addNewAddress);
                    },
                    child: Row(
                      children: [
                        Icon(
                            CupertinoIcons.settings,
                            size: 22,
                            color: Colors.black54
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1,),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GestureDetector(
                    onTap: () async {
                      await context
                          .read(secureStorageServiceProvider)
                          .deleteString('id')
                          .then((value) => context
                              .read(secureStorageServiceProvider)
                              .deleteString('customer_name'))
                          .then((value) => context
                              .read(secureStorageServiceProvider)
                              .deleteString('customer_email'))
                          .then((value) => context
                              .read(secureStorageServiceProvider)
                              .deleteString('customer_phone'))
                          .then((value) => context
                              .read(secureStorageServiceProvider)
                              .deleteString('token'))
                          .then((value) =>
                              EasyLoading.showToast('Logged Out Successfully'))
                          .then((value) => Navigator.pushNamed(
                              context, AppRoutes.loginPage));
                      // Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          size: 22,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1,),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, AppRoutes.addNewAddress);
                    },
                    child: Row(
                      children: [
                        Icon(
                            CupertinoIcons.settings,
                            size: 22,
                            color: Colors.black54
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1,),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page6()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                            CupertinoIcons.settings,
                            size: 22,
                            color: Colors.black54
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Refrigerator Service Page New',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1,),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaintingServicesView()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                            CupertinoIcons.settings,
                            size: 22,
                            color: Colors.black54
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Painting Service Page New',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // WillPopScope(
                //   onWillPop:() async{
                //     print('how are you?????');
                //     return true;
                //   },
                //   child: Row(
                //     children: [
                //       Icon(Icons.logout_outlined,size: 20,),
                //       SizedBox(width: 20,),
                //       Text(
                //         'Logout',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                //     ],
                //   ),
                // )
              ],
            ),
    );
  }

  // void share(BuildContext context, ShareModel shareModel){
  //   final RenderBox? box = context.findRenderObject() as RenderBox?;
  //   final String? text = 'Share LocalYour';
  //   Share.share(text! , subject: shareModel.linkUrl,
  //   sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size
  //   );
  // }
}
