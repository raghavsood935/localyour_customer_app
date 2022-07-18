import 'package:app/network_files/view_model.dart';
import 'package:app/screens_list/home_page.dart';
import 'package:app/screens_list/service_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:app/network_files/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../router.dart';

class ServiceSearchViewArgs{
  dynamic locationId;
  String? locationName;
  ServiceSearchViewArgs({this.locationId,this.locationName});
}

class ServiceSearchView extends HookWidget {
  final ServiceSearchViewArgs? args;
  const ServiceSearchView({Key? key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productLoaded = useState(false);
    // final homeVM = useProvider(homeViewModelProvider);
    WidgetsBinding.instance!.addPostFrameCallback((_) async{
      if(!productLoaded.value){
        productLoaded.value = true;
        // userVM.getAllAddress();
        // context.read(homeViewModelProvider).getServiceDetails('${args!.serviceSlug!}', '${args!.locationName!}', '${args!.subLocation!}');
        await   context.read(homeViewModelProvider).getServices(args!.locationId);
      }
    });
    final homeProvider = useProvider(homeViewModelProvider);
    final searchController = TextEditingController();
    final isLoading = useProvider(homeViewModelProvider).isLoading;
    final searchedServices = homeProvider.searchedServices;
    final mainServices = homeProvider.services;

    final locationIdValue = useState(1);
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      appBar:  PreferredSize(
        preferredSize: Size(200,120),
        child: Column(
          children: [
           SizedBox(height: 50,),
            Container(
              color: Color(0xffC0242D),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.shade400)
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.search)
                    ),
                    controller: searchController,
                    // o
                    onFieldSubmitted: (value){
                      homeProvider.getSearchedService(
                          searchString: value.toString(),
                          locationId: args!.locationId
                      );
                      print(value);
                    },
                  ),
                  // child: RawKeyboardListener(focusNode: null,),
                ),
              ),
            ),
          ],
        ),
      ),
      body: isLoading? Center(child: CupertinoActivityIndicator(radius: 20,),) : ListView(
        children: [
          if(searchedServices.length<1)
            Container(
              // height: 200,
              // width: 200,
              child: ListView.builder(
                  itemCount: mainServices.length,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () async{

                        await Navigator.pushNamed(context, AppRoutes.serviceDetailsView, arguments: ServiceDetailsViewArgs(
                          serviceName: mainServices[index].servicename,
                          locationName: args!.locationName,
                          serviceSlug: mainServices[index].serviceslug,
                          subLocation: '',
                          locationId: args!.locationId,
                        )
                        );
                        print('${args!.locationId}++++++++++++++++++++++${args!.locationName}');
                      },
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 35,
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${homeProvider.services[index].servicelogourl}'),
                                  )
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text(
                              '${homeProvider.services[index].servicename}',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            Icon(Icons.done),
                            // Text(
                            //   listResponse![index]["service_slug"].toString(),style: TextStyle(fontSize: 18),),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          if(searchedServices!=null)
            Container(
              height: 200,
              width: 200,
              child: ListView.builder(
                  itemCount: searchedServices.length,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () async{

                        await Navigator.pushNamed(context, AppRoutes.serviceDetailsView, arguments: ServiceDetailsViewArgs(
                          serviceName: searchedServices[index].serviceName,
                          locationName: args!.locationName,
                          serviceSlug: homeProvider.services[index].serviceslug,
                          subLocation: '',
                          locationId: args!.locationId,
                        )
                        );
                        print('${args!.locationId}++++++++++++++++++++++${args!.locationName}');
                      },
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            // height: 30,
                            // width: 40,
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.location_circle_fill,color: Color(0xffC0242D),
                                ),
                                SizedBox(width: 20,),
                                Text(
                                  '${searchedServices[index].serviceName}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                // TextButton(onPressed: () async{
                                //   final userId = await context.read(secureStorageServiceProvider).getString('id');
                                //   print(userId);
                                // }, child: )
                              ],
                            )),
                      ),
                    );
                  }),
            ),

        ],
      ),
    );
  }
}
