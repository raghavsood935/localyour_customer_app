import 'package:app/network_files/view_model.dart';
import 'package:app/screens_list/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:app/network_files/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../router.dart';

class LocationSearchView extends HookWidget {
  const LocationSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = useProvider(homeViewModelProvider);
    final isLoading = useProvider(homeViewModelProvider).isLoading;
    final searchedLocations = homeProvider.searchedLocation;
    final searchController = TextEditingController();
    final locationIdValue = useState(1);
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: isLoading? Center(child: CupertinoActivityIndicator(radius: 20,),) : ListView(
        children: [
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
                  onChanged: (value){
                    if(value.length>2){

                    homeProvider.getSearchedLocation(value);}
                  },
                  // enableSuggestions: true,
                  // onFieldSubmitted: (value){
                  //   homeProvider.getSearchedLocation(value);
                  //   print(value);
                  // },
                ),
              ),
            ),
          ),
          if(searchedLocations.length==0)
            Column(
              children: [
                SizedBox(height: 50,),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Type the name of the location where you want to\n take the services',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.withOpacity(0.8)
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          if(searchedLocations.length>0)
            Container(
              height: 200,
              width: 200,
              child: ListView.builder(
                  itemCount: searchedLocations.length,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: (){
                        locationIdValue.value = searchedLocations[index].locationId!;
                        print(locationIdValue.value);
                       Navigator.pushNamed(context, AppRoutes.homePage,
                        arguments: HomeViewArgs(
                            locationName: searchedLocations[index].locationName,
                            locationId: locationIdValue.value));
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
                                  '${searchedLocations[index].locationName}',
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
          Text(
              'or',
          style: TextStyle(
            fontSize: 16,
          ),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Row(
              children: [
                Icon(Icons.my_location,color: Color(0xffC0242D),),
            SizedBox(width: 10,),
            Text(
              'At my current location',
              style: TextStyle(
                fontSize: 16,
              ),
            )
              ],
            ),
          ),
          SizedBox(height: 3,),
          Container(
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Row(
              children: [
                Icon(Icons.map,color: Color(0xffC0242D),),
                SizedBox(width: 10,),
                Text(
                  'Choose on map',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
