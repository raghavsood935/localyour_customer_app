import 'package:app/auth/auth_user_model.dart';
import 'package:app/network_files/models.dart';
import 'package:app/network_files/view_model.dart';
import 'package:app/screens_list/best_deal_view.dart';
import 'package:app/screens_list/location_search.dart';
import 'package:app/screens_list/my_cart_view.dart';
import 'package:app/screens_list/my_profile_view.dart';
import 'package:app/screens_list/service_details_view.dart';
import 'package:app/screens_list/service_search_view.dart';
import 'package:app/views.dart';
import 'package:app/secure_storage.dart';
import 'package:app/utils/views.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'checkout_view.dart';
import 'main_drawer.dart';
import '../router.dart';

final imgList = [
  'assets/images/app banner1.jpg',
  'assets/images/app banner2.jpg',
  'assets/images/app banner3.jpg',
  'assets/images/app banner4.jpg'
];

class HomeViewArgs {
  final String? locationName;
  final int? locationId;
  HomeViewArgs({this.locationName, this.locationId});
}

class HomeView extends HookWidget {
  final HomeViewArgs? args;
  const HomeView({Key? key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final searchController = TextEditingController();
    final productLoaded = useState(false);
    LocUser? user;

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (!productLoaded.value) {
        if (args?.locationId != null) {
          context.read(homeViewModelProvider).getServices(args?.locationId);
        } else {
          context.read(homeViewModelProvider).getServices(1);
        }
        productLoaded.value = true;
        final userId =
            await context.read(secureStorageServiceProvider).getString('id');
        // await context
        //     .read(homeViewModelProvider)
        //     .getCartItems(int.parse("$userId"));
        await context.read(homeViewModelProvider).getServices(1);
        // await context.read(homeViewModelProvider).getCustomerAddresses(userId);
        // await context.read(homeViewModelProvider).getCartItems(userId);
        print('[[[[[[[[[[$userId]]]]]]]]]]');

        // if(user==null){
        //   context.read(homeViewModelProvider).getServices(1);
        // }

      }
    });
    final isLoading = useProvider(homeViewModelProvider).isLoading;
    final homeProvider = useProvider(homeViewModelProvider);
    final locations = homeProvider.locations;
    openwhatsapp() async {
      var whatsapp = "+919836031188";
      var whatsappURl_android =
          "whatsapp://send?phone=" + whatsapp + "&text=hello";
      var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
      // if(Platform.isIOS){
      //   // for iOS phone only
      //   if( await canLaunch(whatappURL_ios)){
      //     await launch(whatappURL_ios, forceSafariVC: false);
      //   }else{
      //     ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(content: new Text("whatsapp no installed")));
      //   }
      // }else{
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
    // }

    var locationid = useState(1);
    var defaultlocation = useState('Kolkata');
    final currentIndex = useState(0);
    String greeting() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Hello Good Morning!';
      }
      if (hour < 17) {
        return 'Hello Good Afternoon!';
      }
      return 'Hello Good Evening!';
    }

    ;
    final dismissValue = useState(0);

    return isLoading
        ? Center(
            child: CupertinoActivityIndicator(
              radius: 10,
            ),
          )
        : Stack(
            children: [
              Scaffold(
                // backgroundColor: Color(0xffDEDCE1),
                drawer: Drawer(),
                appBar: AppBar(
                  centerTitle: false,
                  backgroundColor: Color(0xffC0242D),
                  title: GestureDetector(
                    onTap: () async {
                      final userId = await context
                          .read(secureStorageServiceProvider)
                          .getString('id');
                      // showModalBottomSheet(
                      //     backgroundColor: Colors.transparent,
                      //     context: context,
                      //     isScrollControlled: true,
                      //     isDismissible: true,
                      //     builder: (BuildContext context) {
                      //       return DraggableScrollableSheet(
                      //           initialChildSize: 0.75, //set this as you want
                      //           maxChildSize: 0.75, //set this as you want
                      //           minChildSize: 0.75, //set this as you want
                      //           expand: true,
                      //           builder: (context, scrollController) {
                      //             return Container(
                      //               child: Center(
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       borderRadius: BorderRadius.only(
                      //                           topLeft: Radius.circular(25),
                      //                           topRight:
                      //                           Radius.circular(25)),
                      //                       color: Colors.pink.shade50
                      //                   ),
                      //                   child: LocationSearchView(),
                      //                 ),
                      //               ),
                      //             ); //whatever you're returning, does not have to be a Container
                      //           }
                      //       );
                      //     }
                      // );
                      Navigator.pushNamed(context, AppRoutes.searchLocation);
                    },
                    child: Container(
                      height: 50,
                      // width: 250,
                      margin: EdgeInsets.only(right: 30),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                      child: Row(
                        children: [
                          Container(
                            height: 25,
                            width: 120,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                Expanded(
                                  child: args?.locationName == null
                                      ? Text(
                                          '${defaultlocation.value}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      : Text(
                                          '${args!.locationName}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                )
                              ],
                            ),
                          ),
                          Icon(
                            CupertinoIcons.search_circle_fill,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                      preferredSize: Size(80, 60),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final userId = await context
                                  .read(secureStorageServiceProvider)
                                  .getString('id');
                              // showModalBottomSheet(
                              //     backgroundColor: Colors.transparent,
                              //     context: context,
                              //     isScrollControlled: true,
                              //     isDismissible: true,
                              //     builder: (BuildContext context) {
                              //       return DraggableScrollableSheet(
                              //           initialChildSize: 0.75, //set this as you want
                              //           maxChildSize: 0.75, //set this as you want
                              //           minChildSize: 0.75, //set this as you want
                              //           expand: true,
                              //           builder: (context, scrollController) {
                              //             return Container(
                              //               child: Center(
                              //                 child: Container(
                              //                   decoration: BoxDecoration(
                              //                       borderRadius: BorderRadius.only(
                              //                           topLeft: Radius.circular(25),
                              //                           topRight:
                              //                           Radius.circular(25)),
                              //                       color: Colors.pink.shade50
                              //                   ),
                              //                   child: ServiceSearchView(
                              //                     args: ServiceSearchViewArgs(
                              //                         locationId: locationid.value,
                              //                         locationName: defaultlocation.value
                              //                     ),
                              //                   ),
                              //                 ),
                              //               ),
                              //             ); //whatever you're returning, does not have to be a Container
                              //           }
                              //       );
                              //     }
                              // );
                              Navigator.pushNamed(
                                  context, AppRoutes.searchServices,
                                  arguments: ServiceSearchViewArgs(
                                      locationName: defaultlocation.value,
                                      locationId: locationid.value));
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Text('Search Here'),
                                    Spacer(),
                                    Icon(Icons.search)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      )),
                ),
                body: isLoading
                    ? Center(
                        child: CircularProgressBar(),
                      )
                    : ListView(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 140,
                            child: CarouselSlider.builder(
                              options: CarouselOptions(
                                autoPlay: true,
                                viewportFraction: 1,
                                onPageChanged: (_, i) {
                                  currentIndex.value = _;
                                },
                              ),
                              itemCount: imgList.length,
                              itemBuilder: (BuildContext context, int index,
                                  int realIndex) {
                                return Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image:
                                              AssetImage('${imgList[index]}'),
                                          fit: BoxFit.fill)),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 10,
                            width: double.infinity,
                            child: ListView.builder(
                                itemCount: imgList.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            index == currentIndex.value
                                                ? Color(0xffC0242D)
                                                : Colors.grey,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            color: Color(0xffDEDCE1),
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1.4,
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 2,
                                        mainAxisSpacing: 2),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: homeProvider.services.length,
                                itemBuilder: (context, index) {
                                  return homeProvider.services == null
                                      ? CircularProgressIndicator()
                                      : GestureDetector(
                                          onTap: () async {
                                            await Navigator.pushNamed(context,
                                                AppRoutes.serviceDetailsView,
                                                arguments:
                                                    ServiceDetailsViewArgs(
                                                        serviceName:
                                                            homeProvider
                                                                .services[index]
                                                                .servicename,
                                                        locationName:
                                                            defaultlocation
                                                                .value,
                                                        serviceSlug:
                                                            homeProvider
                                                                .services[index]
                                                                .serviceslug,
                                                        subLocation: '',
                                                        locationId:
                                                            locations[index]
                                                                .locationId));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            color: Colors.white,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  height: 27,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                    image: NetworkImage(
                                                        '${homeProvider.services[index].servicelogourl}'),
                                                  )),
                                                ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Text(
                                                  '${homeProvider.services[index].servicename}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                // Text(
                                                //   listResponse![index]["service_slug"].toString(),style: TextStyle(fontSize: 18),),
                                              ],
                                            ),
                                          ),
                                        );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Trending',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Container(
                                    height: 135,
                                    child: ListView.builder(
                                        itemCount: homeProvider.services.length,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () async {
                                              await Navigator.pushNamed(context,
                                                  AppRoutes.serviceDetailsView,
                                                  arguments:
                                                      ServiceDetailsViewArgs(
                                                          serviceName:
                                                              homeProvider
                                                                  .services[
                                                                      index]
                                                                  .servicename,
                                                          locationName:
                                                              defaultlocation
                                                                  .value,
                                                          serviceSlug:
                                                              homeProvider
                                                                  .services[
                                                                      index]
                                                                  .serviceslug,
                                                          subLocation: '',
                                                          locationId:
                                                              locations[index]
                                                                  .locationId));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              // height: double.infinity,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4),
                                                    child: Column(
                                                      // mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          height: 70,
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              3),
                                                                  image:
                                                                      DecorationImage(
                                                                    image: NetworkImage(
                                                                        '${homeProvider.services[index].serviceimageurl}'),
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  )),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 100,
                                                          child: Text(
                                                            '${homeProvider.services[index].servicename}',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black,
                                                              // fontWeight: FontWeight.w900),
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            // Text(
                                                            //   listResponse![index]["service_slug"].toString(),style: TextStyle(fontSize: 18),),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        })),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 140,
                            child: CarouselSlider.builder(
                              options: CarouselOptions(
                                autoPlay: true,
                                viewportFraction: 1,
                                onPageChanged: (_, i) {
                                  currentIndex.value = _;
                                },
                              ),
                              itemCount: imgList.length,
                              itemBuilder: (BuildContext context, int index,
                                  int realIndex) {
                                return Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('${imgList[index]}'),
                                          fit: BoxFit.fill)),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            // height: 300,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Best Deal',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Container(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset(
                                          'assets/images/thunderr.jpg'),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BestDeals()));
                                      },
                                      child: Text(
                                        'View All',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffC0242D)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 20),
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 1.2,
                                      ),
                                      itemCount:
                                          homeProvider.services.length > 4
                                              ? 4
                                              : homeProvider.services.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return homeProvider.services == null
                                            ? CircularProgressIndicator()
                                            : GestureDetector(
                                                onTap: () async {
                                                  await Navigator.pushNamed(
                                                      context,
                                                      AppRoutes
                                                          .serviceDetailsView,
                                                      arguments: ServiceDetailsViewArgs(
                                                          serviceName:
                                                              homeProvider
                                                                  .services[
                                                                      index]
                                                                  .servicename,
                                                          locationName: args
                                                                      ?.locationName ==
                                                                  null
                                                              ? defaultlocation
                                                                  .value
                                                              : args
                                                                  ?.locationName,
                                                          serviceSlug:
                                                              homeProvider
                                                                  .services[
                                                                      index]
                                                                  .serviceslug,
                                                          subLocation: '',
                                                          locationId:
                                                              locations[index]
                                                                  .locationId));
                                                },
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        height: 100,
                                                        // width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                image:
                                                                    DecorationImage(
                                                                  image: NetworkImage(
                                                                      '${homeProvider.services[index].serviceimageurl}'),
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '${homeProvider.services[index].servicename}',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                          // fontWeight: FontWeight.w900
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                      }),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/localBanner.png',
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          Container(),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            // height: 300,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Popular Services',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      'View all',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffC0242D)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 180,
                                      child: ListView.builder(
                                          itemCount:
                                              homeProvider.services.length,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () async {
                                                await Navigator.pushNamed(
                                                    context,
                                                    AppRoutes
                                                        .serviceDetailsView,
                                                    arguments:
                                                        ServiceDetailsViewArgs(
                                                            serviceName:
                                                                homeProvider
                                                                    .services[
                                                                        index]
                                                                    .servicename,
                                                            locationName:
                                                                defaultlocation
                                                                    .value,
                                                            serviceSlug:
                                                                homeProvider
                                                                    .services[
                                                                        index]
                                                                    .serviceslug,
                                                            subLocation: '',
                                                            locationId:
                                                                locations[index]
                                                                    .locationId));
                                              },
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      height: 140,
                                                      width: 200,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                '${homeProvider.services[index].serviceimageurl}'),
                                                            fit: BoxFit.fill,
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '${homeProvider.services[index].servicename}',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        // fontWeight: FontWeight.w900
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          })),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // height: 180,
                            // decoration: BoxDecoration(
                            //     image: DecorationImage(
                            //         image: AssetImage('assets/images/loca.png'),fit: BoxFit.fill
                            //     )
                            // ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0xffC0242D),
                                          child: Icon(
                                            CupertinoIcons.square_list_fill,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '1. Select the service',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Pick the desired service from the category of service.You can easily select the service you are looking for from website or app',
                                          style: TextStyle(
                                              // fontWeight: FontWeight.w400,
                                              fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0xffC0242D),
                                          child: Icon(
                                            CupertinoIcons.stopwatch,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '2. Select the time-slot',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Select your convenient date and time to avail the service.You can select your schedule before placing the order.',
                                          style: TextStyle(
                                              // fontWeight: FontWeight.w400,
                                              fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0xffC0242D),
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '3. Order and relax',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Review and place the order. Now just sit back and relax. One of our exper service provider will be assigned for your job.',
                                          style: TextStyle(
                                              // fontWeight: FontWeight.w400,
                                              fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0xffC0242D),
                                          child: Icon(
                                            CupertinoIcons.square_list_fill,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '4. Review and rate',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'At last, after getting your desired service you can rate our service and service personnel. Your feed back is very important to us.',
                                          style: TextStyle(
                                              // fontWeight: FontWeight.w400,
                                              fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/foot.png'))),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Color(0xffC0242D),
                  unselectedItemColor: Colors.grey.shade600,
                  selectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  unselectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 20,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.book_rounded,
                        size: 20,
                      ),
                      label: 'Booking',
                    ),
                    BottomNavigationBarItem(
                      icon: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => SimpleDialog(
                                    title: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Have Queries?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 22,
                                          ),
                                        )),
                                    titlePadding:
                                        EdgeInsets.fromLTRB(24, 24, 24, 10),
                                    children: [
                                      Image.asset('assets/images/help.jpg'),
                                      Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              'We are here 24/7 only to serve you.'
                                              '\nPlease, call us to 9836031188 or chat \nwith'
                                              'us for any kind of query.',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                                color: Color(0xffcec8c8),
                                              ),
                                            )),
                                      ),
                                      Container(
                                        height: 60,
                                        padding:
                                            EdgeInsets.fromLTRB(2, 2, 2, 0),
                                        color: Color(0xffcec8c8),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  openwhatsapp();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  color: Colors.white,
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          CupertinoIcons
                                                              .chat_bubble_text_fill,
                                                          color:
                                                              Color(0xffC0242D),
                                                          size: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          'Let\s chat',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xffC0242D),
                                                              fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 2,
                                              color: Color(0xffcec8c8),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  FlutterPhoneDirectCaller
                                                      .callNumber('9836031188');
                                                  print('pressed');
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  color: Colors.white,
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          CupertinoIcons
                                                              .phone_fill,
                                                          color:
                                                              Color(0xffC0242D),
                                                          size: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          'Let\s Talk',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xffC0242D),
                                                              fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ));
                        },
                        child: Icon(
                          Icons.live_help_outlined,
                          size: 20,
                        ),
                      ),
                      label: 'Help',
                    ),
                    BottomNavigationBarItem(
                      icon: GestureDetector(
                        onTap: () async {
                          final userId = await context
                              .read(secureStorageServiceProvider)
                              .getString('id');
                          if (userId != null) {
                            Navigator.pushNamed(context, AppRoutes.myProfile,
                                arguments: ProfileViewArgs(
                                    userId: int.parse('$userId')));
                          } else {
                            EasyLoading.showToast(
                                    'You Are Not Logged In!\nPlease Login First')
                                .then((value) => Navigator.pushNamed(
                                    context, AppRoutes.loginPage));
                          }
                        },
                        child: Icon(
                          Icons.account_circle,
                          size: 20,
                        ),
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
              if (dismissValue.value == 0)
                Positioned(
                  left: 40,
                  right: 30,
                  top: 60,
                  child: Container(
                      // margin: EdgeInsets.fromLTRB(30, 0, 60, 600),
                      height: 210,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 3,
                                blurRadius: 2)
                          ],
                          // color: Colors.grey
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.red.withOpacity(0.6),
                              Colors.red.shade900,
                            ],
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${greeting()}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Set your Delivery Address',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'all the services and service providers you see will be around this location\ntap on the location anytime to change it',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              dismissValue.value = 1;
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red.withOpacity(0.7)),
                            child: Text(
                              'OK Got It',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      )),
                  // color: Colors.lightBlueAccent.withOpacity(0.5),
                ),
            ],
          );
  }
}
