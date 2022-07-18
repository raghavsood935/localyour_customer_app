import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

// class OfferTypeModel {
//   bool isSelected;
//   final String buttonText;
//   final String image;
//   final String imageActive;
//
//   OfferTypeModel({this.isSelected, this.buttonText, this.image, this.imageActive});
//
//   @override
//   String toString() {
//     return buttonText;
//   }
// }
//
// class OfferTypeList extends StateNotifier<List<OfferTypeModel>> {
//   OfferTypeList([List<OfferTypeModel> initialOfferTypeModels]) : super(initialOfferTypeModels ?? []);
//
//   void add(bool isSelected, String buttonText, String image, String imageActive) {
//     state = [
//       ...state,
//       OfferTypeModel(isSelected: isSelected, buttonText: buttonText, image: image, imageActive: imageActive),
//     ];
//   }
//
//   void toggle(String buttonText) {
//     state = [
//       for (final offerType in state)
//         if (offerType.buttonText == buttonText)
//           OfferTypeModel(
//               isSelected: true,
//               buttonText: offerType.buttonText,
//               image: offerType.image,
//               imageActive: offerType.imageActive
//           )
//         else
//           OfferTypeModel(
//               isSelected: false,
//               buttonText: offerType.buttonText,
//               image: offerType.image,
//               imageActive: offerType.imageActive
//           ),
//     ];
//   }
//
//   void edit({@required String buttonText, @required bool isSelected}) {
//     state = [
//       for (final offerType in state)
//         if (offerType.buttonText == buttonText)
//           OfferTypeModel(
//               isSelected: isSelected,
//               buttonText: buttonText,
//               image: offerType.image,
//               imageActive: offerType.imageActive
//           )
//         else
//           offerType,
//     ];
//   }
//
//   void remove(OfferTypeModel target) {
//     state = state.where((offerType) => offerType.buttonText != target.buttonText).toList();
//   }
// }
//
// class DayTimeItemModel {
//   String from;
//   String to;
//
//   Duration fromDur;
//   Duration toDur;
//
//   static String getFormatted(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//     String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
//     String use24Time =
//         "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
//     return use24Time;
//   }
//
//   DayTimeItemModel({
//     this.from = '',
//     this.to = '',
//     this.fromDur = const Duration(hours: 10),
//     this.toDur = const Duration(hours: 23),
//   });
//
//   Map<String, dynamic> toJson() => {
//     'from': from,
//     'to': to,
//     'fromDur': fromDur,
//     'toDur': toDur,
//   };
//
// }
//
// enum FormToFieldModel { From, To }
//
// class DayModel {
//   bool isSelected;
//   final String buttonText;
//   final String day;
//   final List<DayTimeItemModel> times;
//
//   DayModel({this.isSelected, this.buttonText, this.day, this.times = const []});
//
//   @override
//   String toString() {
//     return buttonText;
//   }
//
//   Map<String, dynamic> toJson() => {
//     'isSelected': isSelected,
//     'buttonText': buttonText,
//     'day': day,
//     'times': times.map((i) => i.toJson()).toList() ,
//   };
// }
//
// class DayListModel extends StateNotifier<List<DayModel>> {
//   DayListModel([List<DayModel> initialDayModels])
//       : super(initialDayModels ?? []);
//
//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//     String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
//     String use24Time =
//         "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
//     return DateFormat("hh:mm a")
//         .format(DateFormat("HH:mm:ss").parse(use24Time));
//   }
//
//   void addTimes({@required String buttonText, @required int index}) {
//     List<DayModel> dmList = [];
//
//     for (final dayModel in state) {
//       if (dayModel.buttonText == buttonText) {
//         dayModel.times.add(DayTimeItemModel());
//         dmList.add(dayModel);
//       } else {
//         dmList.add(dayModel);
//       }
//     }
//
//     state = dmList;
//   }
//
//   void removeTimes({@required String buttonText, @required int index, bool isCustomTime}) {
//     List<DayModel> dmList = [];
//
//     if(isCustomTime) {
//
//       for (final dayModel in state) {
//         if (dayModel.buttonText == buttonText) {
//           dayModel.times.removeAt(index);
//           dayModel.isSelected = dayModel.times.length > 0;
//           dmList.add(dayModel);
//         } else {
//           dmList.add(dayModel);
//         }
//       }
//
//     } else {
//       state[0].times.removeAt(index);
//
//       final timesLen = state[0].times.length;
//       for (final dayModel in state) {
//         dayModel.isSelected = timesLen < 1 ? false : dayModel.isSelected;
//         dmList.add(dayModel);
//       }
//     }
//
//
//     state = dmList;
//   }
//
//   void setTime(
//       {@required String buttonText,
//         @required int index,
//         @required FormToFieldModel field,
//         @required Duration duration}) {
//     List<DayModel> dmList = [];
//
//     for (final dayModel in state) {
//       if (dayModel.buttonText == buttonText) {
//         if (field == FormToFieldModel.From) {
//           dayModel.times[index].fromDur = duration;
//           dayModel.times[index].from = _formatDuration(duration);
//         } else {
//           dayModel.times[index].toDur = duration;
//           dayModel.times[index].to = _formatDuration(duration);
//         }
//         dmList.add(dayModel);
//       } else {
//         dmList.add(dayModel);
//       }
//     }
//
//     state = dmList;
//   }
//
//   void toggle({String buttonText, bool customTime, bool select}) {
//     List<DayModel> dmList = [];
//
//     DayModel dm;
//
//     if(customTime){
//
//       for (final dayModel in state) {
//         if (dayModel.buttonText == buttonText) {
//           dm = DayModel(
//               isSelected: select,
//               buttonText: dayModel.buttonText,
//               day: dayModel.day,
//               times: select ? [DayTimeItemModel()]: []);
//         } else {
//           dm = DayModel(
//               isSelected: dayModel.isSelected,
//               buttonText: dayModel.buttonText,
//               day: dayModel.day,
//               times: dayModel.times);
//         }
//
//         dmList.add(dm);
//       }
//
//     } else {
//       int index = 0;
//
//       final selectedDays = state.where((day) => day.isSelected).toList();
//       int selectedLen = selectedDays.length;
//       selectedLen = select ? selectedLen + 1 : selectedLen - 1;
//       for (final dayModel in state) {
//
//         List<DayTimeItemModel> times = [];
//
//         if(selectedLen > 0 && index == 0){
//           times = dayModel.times.length > 0 ? dayModel.times : [DayTimeItemModel()];
//         } else {
//           times = [];
//         }
//
//         dm = DayModel(
//             isSelected: (dayModel.buttonText == buttonText) ? select : dayModel.isSelected,
//             buttonText: dayModel.buttonText,
//             day: dayModel.day,
//             times: times
//         );
//
//         dmList.add(dm);
//         index++;
//       }
//     }
//
//     state = dmList;
//   }
//
//   void toggleCustomTimes({bool isCustomTime}) {
//     List<DayModel> dmList = [];
//     DayModel dm;
//
//     if(isCustomTime) {
//
//       for (final dayModel in state) {
//         List<DayTimeItemModel> times = dayModel.times.length > 0 ? dayModel.times : [DayTimeItemModel()];
//
//         dm = DayModel(
//             isSelected: dayModel.isSelected,
//             buttonText: dayModel.buttonText,
//             day: dayModel.day,
//             times: times
//         );
//
//         dmList.add(dm);
//       }
//
//     } else {
//       int index = 0;
//       for (final dayModel in state) {
//
//         List<DayTimeItemModel> times = index == 0 ? [DayTimeItemModel()] : [];
//
//         dm = DayModel(
//             isSelected: dayModel.isSelected,
//             buttonText: dayModel.buttonText,
//             day: dayModel.day,
//             times: times
//         );
//
//         dmList.add(dm);
//
//         index++;
//       }
//     }
//
//
//     state = dmList;
//   }
// }
//
//
// class AuctionInfoModel {
//   final double basePrice;
//   final double stepPrice;
//   final double buyOutPrice;
//   final String endDate;
//   final String endTime;
//
//   const AuctionInfoModel({
//     this.basePrice = 0.00,
//     this.stepPrice = 0.00,
//     this.buyOutPrice = 0.00,
//     this.endDate = '',
//     this.endTime = ''
//   });
//
//   Map<String, dynamic> toJson() => {
//     'basePrice': basePrice,
//     'stepPrice': stepPrice,
//     'buyOutPrice': buyOutPrice,
//     'endDate': endDate,
//     'endTime': endTime,
//   };
// }
//
// class DesireModel {
//   final double amount;
//   final String categoryId;
//   final String description;
//   final String desireType;
//   final List<String> tags;
//
//   const DesireModel(
//       {this.amount = 0.00,
//       this.categoryId = '',
//       this.description = '',
//       this.desireType = '',
//       this.tags = const []});
//
//   factory DesireModel.fromJson(Map<String, dynamic> json) {
//     return DesireModel(
//       amount: json['amount'] as double,
//       categoryId: json['categoryId'] as String,
//       description: json['description'] as String,
//       desireType: json['desireType'] as String,
//       tags: json['tags'] as List<String>,
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'amount': amount,
//     'categoryId': categoryId,
//     'description': description,
//     'desireType': desireType,
//     'tags': tags.toList(),
//   };
// }
//
// class DocumentModel {
//   String displayIndex;
//   String id;
//   String name;
//   String orgName;
//   String url;
//
//   DocumentModel({this.displayIndex = '', this.id = '', this.name = '', this.orgName = '', this.url = ''});
//
//   Map<String, dynamic> toJson() => {
//     'displayIndex': displayIndex,
//     'id': id,
//   };
//
//   factory DocumentModel.fromJson(Map<String, dynamic> json) {
//     return DocumentModel(
//       displayIndex: json['displayIndex'] as String,
//       id: json['id'] as String,
//       name: json['name'] as String,
//       orgName: json['orgName'] as String,
//       url: json['url'] as String,
//     );
//   }
// }
//
// class FacetModel {
//   String label = '';
//   String name = '';
//   List<String> values = [];
//
//   FacetModel({this.label, this.name, this.values});
//
//   factory FacetModel.fromJson(Map<String, dynamic> json) {
//     return FacetModel(
//       label: json['label'] as String,
//       name: json['name'] as String,
//       values: json['values'] == null ? [] : json['values'] as List<String>
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'label': label,
//     'name': name,
//     'values': values.toList()
//   };
// }
//
// class ImageModel {
//   bool cover;
//   String displayIndex;
//   String id;
//   String name;
//   String orgName;
//   String url;
//   String keywords;
//   dynamic mimeType;
//
//   ImageModel({this.displayIndex = '', this.id = '', this.name = '', this.orgName = '', this.url = '',
//   this.cover = false, this.keywords = '', this.mimeType = ''});
//
//   Map<String, dynamic> toJson() => {
//     'cover': cover,
//     'displayIndex': displayIndex,
//     'id': id
//   };
//
//   factory ImageModel.fromJson(Map<String, dynamic> json) {
//     return ImageModel(
//       displayIndex: json['displayIndex'] as String,
//       id: json['id'] as String,
//       name: json['name'] as String,
//       orgName: json['orgName'] as String,
//       url: json['url'] as String,
//       cover: json['cover'] as bool,
//       keywords: json['keywords'] as String,
//       mimeType: json['mimeType'],
//     );
//   }
// }
//
// class LocationModel {
//   final String addressId;
//   final String addressLine;
//   final String annotation;
//   final String area;
//   final String city;
//   final String landmark;
//   final String country;
//   final String flatNo;
//   final double lat;
//   final double lng;
//   final String state;
//   final String zip;
//   final bool defaultAddress;
//
//   const LocationModel({
//     this.addressId = '',
//     this.addressLine = '',
//     this.annotation = '',
//     this.area = '',
//     this.landmark = '',
//     this.city,
//     this.country,
//     this.flatNo = '',
//     this.lat,
//     this.lng,
//     this.state,
//     this.zip,
//     this.defaultAddress = false
//   });
//
//   Map<String, dynamic> toJson() => {
//     'addressLine': addressLine,
//     'annotation': annotation,
//     'area': area,
//     'city': city,
//     'country': country,
//     'flatNo': flatNo,
//     'lat': lat,
//     'lng': lng,
//     'state': state,
//     'zip': zip,
//     'landmark': landmark,
//     'default': defaultAddress
//   };
//
//   factory LocationModel.fromJson(Map<String, dynamic> json) {
//     return LocationModel(
//       addressId: json['addressId'] as String,
//       addressLine: json['addressLine'] as String,
//       annotation: json['annotation'] as String,
//       area: json['area'] as String,
//       city: json['city'] as String,
//       country: json['country'] as String,
//       flatNo: json['flatNo'] as String,
//       lat: json['lat'] as double,
//       lng: json['lng'] as double,
//       state: json['state'] as String,
//       zip: json['zip'] as String,
//       landmark: json['landmark'] as String,
//       defaultAddress: json['default'] as bool,
//     );
//   }
//
//   factory LocationModel.fromGooglePlace(PickResult selectedPlace, String annotation) {
//     String route='';
//     String locality='';
//     String country='';
//     String postalCode='';
//     String streetNo='';
//     String city='';
//     String state='';
//
//     selectedPlace.addressComponents.forEach((addressComponent) {
//
//       // print('${addressComponent.types.toString()} == ${addressComponent.longName}');
//       if (addressComponent.types.contains("route")){
//         route = addressComponent.longName;
//       }
//
//       if (addressComponent.types.contains("country")){
//         country = addressComponent.longName;
//       }
//
//       if (addressComponent.types.contains("administrative_area_level_1")){
//         state = addressComponent.longName;
//       }
//
//       if (addressComponent.types.contains("locality")){
//         city = addressComponent.longName;
//       }
//
//       if (addressComponent.types.contains("postal_code")){
//         postalCode = addressComponent.longName;
//       }
//
//       if (addressComponent.types.contains("street_number")){
//         streetNo = addressComponent.longName;
//       }
//     });
//
//     return LocationModel(
//       addressLine: selectedPlace.vicinity,
//       annotation: annotation,
//       city: city,
//       state: state,
//       country: country,
//       zip: postalCode,
//       lat: selectedPlace.geometry.location.lat,
//       lng: selectedPlace.geometry.location.lng,
//     );
//   }
// }
//
// class TimeItemModel {
//   String startTime;
//   String endTime;
//
//   TimeItemModel({this.startTime, this.endTime});
//
//   Map<String, dynamic> toJson() => {
//     'startTime': startTime,
//     'endTime': endTime,
//   };
// }
//
// class ServiceTiming {
//   String dayOfWeek;
//   List<TimeItemModel> timingInfoList;
//
//   ServiceTiming({this.dayOfWeek, this.timingInfoList});
//
//   Map<String, dynamic> toJson() => {
//     'dayOfWeek': dayOfWeek,
//     'timingInfoList': timingInfoList.map((timeItem) => timeItem.toJson()).toList(),
//   };
// }
//
// class VideoModel {
//   String displayIndex = '';
//   String id = '';
//   String name;
//   String orgName;
//   String url;
//
//   VideoModel({this.displayIndex = '', this.id = '', this.name = '', this.orgName = '', this.url = ''});
//
//   Map<String, dynamic> toJson() => {
//     'displayIndex': displayIndex,
//     'id': id,
//   };
//
//   factory VideoModel.fromJson(Map<String, dynamic> json) {
//     return VideoModel(
//       displayIndex: json['displayIndex'] as String,
//       id: json['id'] as String,
//       name: json['name'] as String,
//       orgName: json['orgName'] as String,
//       url: json['url'] as String,
//     );
//   }
// }
//
// class MediaModel {
//   bool cover;
//   int displayIndex;
//   String id;
//   String name;
//   String orgName;
//   String url;
//
//   MediaTypes type;
//   Uint8List data;
//
//   MediaModel({this.displayIndex = 1, this.id = '', this.name = '', this.orgName = '', this.url = '',
//     this.cover = false, this.type, this.data});
// }
//
// class CreateOfferModel {
//   String offerId;
//   String offerType;
//
//   AuctionInfoModel auctionInfoModel;
//   bool auctioned;
//   String categoryId;
//   List<String> customTags;
//   String description;
//   DesireModel desire;
//   List<DocumentModel> documents;
//   String draftId;
//   String exchangeMode;
//   List<FacetModel> facets;
//   List<ImageModel> images;
//   LocationModel location;
//   String name;
//   List<VideoModel> videos;
//
//   //for service only
//   bool myLocation;
//   bool yourLocation;
//   bool remote;
//   List<ServiceTiming> serviceTimingInfos;
//   double fixedRate;
//   double ratePerHour;
//
//   // for item only
//   String conditionType;
//   String itemCondition;
//   int quantity;
//   double totalOfferValuation;
//   double unitOfferValuation;
//
//
//   CreateOfferModel({
//     this.offerId,
//     this.offerType,
//
//     this.auctionInfoModel = const AuctionInfoModel(),
//     this.auctioned = false,
//     this.categoryId = '',
//     this.customTags = const [],
//     this.description = '',
//     this.desire = const DesireModel(),
//     this.documents = const [],
//     this.draftId = '',
//     this.exchangeMode = '',
//     this.facets = const [],
//     this.images = const [],
//     this.location = const LocationModel(),
//     this.name = '',
//     this.videos = const [],
//
//     // for service only
//     this.myLocation = false,
//     this.yourLocation = false,
//     this.remote = false,
//     this.serviceTimingInfos = const [],
//     this.fixedRate = 0.00,
//     this.ratePerHour = 0.00,
//
//     // for item only
//     this.conditionType = '',
//     this.itemCondition = '',
//     this.quantity = 1,
//     this.totalOfferValuation = 0.00,
//     this.unitOfferValuation = 0.00,
//   });
//
//   // todo null check for all fields is required
//   factory CreateOfferModel.fromDraftJson(Map<String, dynamic> json) {
//     return CreateOfferModel(
//       draftId: json['draftOfferId'] as String,
//       // seOId: json['seOId'] as String,
//       name: json['name'] as String,
//       description: json['description'] as String,
//       desire: json['desire'] ==  null ? const DesireModel() : DesireModel.fromJson(json['desire']),
//       auctioned: json['auctioned'] as bool,
//       // auctionResponseInfo: json['auctionResponseInfo'] as String,
//       exchangeMode: json['exchangeMode'] as String,
//       location: json['location'] == null ? const LocationModel() : LocationModel.fromJson(json['location']),
//       // offerType: json['offerType'] as String,
//       // category: json['category'] as String,
//       totalOfferValuation: json['totalOfferValuation'] as double,
//       unitOfferValuation: json['unitOfferValuation'] as double,
//       images: json['images'] == null ? [] : (json['images'] as List<dynamic>).map((e) => ImageModel.fromJson(e)).toList(),
//       videos: json['videos'] == null ? [] : (json['videos'] as List<dynamic>).map((e) => VideoModel.fromJson(e)).toList(),
//       documents: json['documents'] == null ? [] : (json['documents'] as List<dynamic>).map((e) => DocumentModel.fromJson(e)).toList(),
//       // condition: json['condition'] as String,
//       // hiddenPeriod: json['hiddenPeriod'] as String,
//       facets: json['facets'] == null ? [] : (json['facets'] as List<dynamic>).map((e) => FacetModel.fromJson(e)),
//       // // serviceTimingInfos: json['serviceTimingInfos'] ==  null ?  [] : (json['serviceTimingInfos'] as List<dynamic>).map((e) => ServiceTiming.fromJson(e)),
//       serviceTimingInfos: [],
//       ratePerHour: json['ratePerHour'] as double,
//       fixedRate: json['fixedRate'] as double,
//       yourLocation: json['yourLocation'] as bool,
//       remote: json['remote'] as bool,
//       myLocation: json['myLocation'] as bool,
//     );
//   }
//
//   Map<String, dynamic> toDraftJson() {
//     return {
//       'name': name,
//       'description': description,
//       // 'ratePerHour': ratePerHour,
//       // 'fixedRate': fixedRate,
//       // 'myLocation': myLocation,
//       // 'yourLocation': yourLocation,
//       // 'remote': remote,
//       'offerId': draftId, // this is only for draft update
//       // 'serviceTimingInfos': serviceTimingInfos.map((e) => e.toJson()).toList(),
//       // // 'totalOfferValuation': totalOfferValuation,
//       // // 'unitOfferValuation': unitOfferValuation,
//       // 'categoryId': categoryId,
//       // 'customTags': customTags.toList(),
//       // 'location': location.toJson(),
//       // 'exchangeMode': exchangeMode
//     };
//   }
//
//   Map<String, dynamic> toServiceJson() {
//     return {
//       'name': name,
//       'description': description,
//       'ratePerHour': ratePerHour,
//       'fixedRate': fixedRate,
//       'myLocation': myLocation,
//       'yourLocation': yourLocation,
//       'remote': remote,
//       // 'draftId': draftId, // this is only for draft update
//       'serviceTimingInfos': serviceTimingInfos.map((e) => e.toJson()).toList(),
//       'categoryId': categoryId,
//       'customTags': customTags.toList(),
//       'location': location.toJson(),
//       'desire': desire.toJson(),
//       'exchangeMode': exchangeMode,
//       'images': images.map((e) => e.toJson()).toList(),
//       'documents': documents.map((e) => e.toJson()).toList(),
//     };
//   }
//
//   Map<String, dynamic> toItemJson() {
//     return {
//       'name': name,
//       'description': description,
//       'conditionType': conditionType,
//       'itemCondition': itemCondition,
//       'quantity': quantity,
//       // 'draftId': draftId,
//       'totalOfferValuation': unitOfferValuation * quantity,
//       'unitOfferValuation': unitOfferValuation,
//       'categoryId': categoryId,
//       'customTags': customTags.toList(),
//       'location': location.toJson(),
//       'desire': desire.toJson(),
//       'exchangeMode': exchangeMode,
//       'images': images.map((e) => e.toJson()).toList(),
//       'documents': documents.map((e) => e.toJson()).toList(),
//     };
//   }
// }
//
//
// class CatHierarchyModel {
//   final String categoryId;
//   final String label;
//
//   const CatHierarchyModel({this.categoryId = '', this.label = ''});
//
//   Map<String, dynamic> toJson() => {
//     'categoryId': categoryId,
//     'label': label,
//   };
//
//   factory CatHierarchyModel.fromJson(Map<String, dynamic> json) {
//     return CatHierarchyModel(
//       categoryId: json['categoryId'] as String,
//       label: json['label'] as String,
//     );
//   }
// }
//
// class VerticalHierarchyModel {
//   final String categoryId;
//   final String label;
//
//   const VerticalHierarchyModel({this.categoryId = '', this.label = ''});
//
//   Map<String, dynamic> toJson() => {
//     'categoryId': categoryId,
//     'label': label,
//   };
//
//   factory VerticalHierarchyModel.fromJson(Map<String, dynamic> json) {
//     return VerticalHierarchyModel(
//       categoryId: json['categoryId'] as String,
//       label: json['label'] as String,
//     );
//   }
// }
//
// class CategoryModel {
//   String categoryId;
//   String type;
//   String label;
//   String description;
//   bool leafNode;
//   List<String> breadcrumbs;
//   List<CatHierarchyModel> hierarchy;
//   VerticalHierarchyModel vertical;
//   String seoId;
//   String url;
//   String status;
//
//   CategoryModel({
//     this.categoryId = '',
//     this.type = '',
//     this.label = '',
//     this.description = '',
//     this.leafNode = false,
//     this.breadcrumbs = const [],
//     this.hierarchy = const [],
//     this.vertical= const VerticalHierarchyModel(),
//     this.seoId = '',
//     this.url = '',
//     this.status = '',
//   });
//
//   Map<String, dynamic> toJson() => {
//     'categoryId': categoryId,
//     'type': type,
//     'label': label,
//     'description': description,
//     'leafNode': leafNode,
//     'breadcrumbs': breadcrumbs.toList(),
//     'hierarchy': hierarchy.map((hie) => hie.toJson()).toList(),
//     'vertical': vertical.toJson(),
//     'seoId': seoId,
//     'url': url,
//     'status': status,
//   };
//
//   factory CategoryModel.fromJson(Map<String, dynamic> json) {
//     return CategoryModel(
//       categoryId: json['categoryId'] as String,
//       type: json['type'] as String,
//       label: json['label'] as String,
//       description: json['description'] as String,
//       leafNode: json['leafNode'] as bool,
//       breadcrumbs: List<String>.from(json['breadcrumbs']),
//       hierarchy: (json['hierarchy'] as List<dynamic>).map((i) => CatHierarchyModel.fromJson(i)).toList(),
//       vertical: VerticalHierarchyModel.fromJson(json['vertical']),
//       seoId: json['seoId'] as String,
//       url: json['url'] as String,
//       status: json['status'] as String,
//     );
//   }
// }
//
// class CategoryTagModel {
//   String tagId;
//   String name;
//   String description;
//   String label;
//   List<dynamic> values;
//   bool allowCompletionSearch;
//   bool allowFullTextSearch;
//
//   CategoryTagModel({this.tagId, this.name, this.description, this.label,
//     this.values, this.allowCompletionSearch, this.allowFullTextSearch});
//
//   factory CategoryTagModel.fromJson(Map<String, dynamic> json) {
//     return CategoryTagModel(
//       tagId: json['tagId'] as String,
//       name: json['name'] as String,
//       label: json['label'] as String,
//       description: json['description'] as String,
//       values: json['values'],
//       allowCompletionSearch: json['allowCompletionSearch'] as bool,
//       allowFullTextSearch: json['allowFullTextSearch'] as bool,
//     );
//   }
// }
//
// class BaseResponseModel {
//   BaseResponseModel({
//     this.success,
//     this.code,
//     this.message,
//     this.payload,
//   });
//
//   bool success;
//   dynamic code;
//   String message;
//   dynamic payload;
//
//   factory BaseResponseModel.fromJson(Map<String, dynamic> json) => BaseResponseModel(
//     success: json["success"],
//     code: json["code"],
//     message: json["message"],
//     payload: json["payload"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "code": code,
//     "message": message,
//     "payload": payload,
//   };
// }
//
// class ResponseModel {
//   ResponseModel({
//     this.success,
//     this.code,
//     this.message,
//     this.payload,
//   });
//
//   bool success;
//   dynamic code;
//   String message;
//   List<dynamic> payload;
//
//   factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
//     success: json["success"],
//     code: json["code"],
//     message: json["message"],
//     payload: json["payload"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "code": code,
//     "message": message,
//     "payload": payload,
//   };
// }
//
// class CustomTagModel {
//   String categoryId;
//   String type;
//   String label;
//   String description;
//   bool leafNode;
//   String tagId;
//   String tagName;
//   String tagDescription;
//   String tagLabel;
//   String tagValue;
//   bool selected;
//   List<dynamic> tagValues;
//
//   CustomTagModel({
//     this.categoryId,
//     this.type,
//     this.label,
//     this.description,
//     this.leafNode,
//     this.tagId = '',
//     this.tagName = '',
//     this.tagDescription = '',
//     this.tagLabel = '',
//     this.tagValue = '',
//     this.selected = false,
//     this.tagValues = const [],
//   });
//
//   CustomTagModel.fromJson(Map<String, dynamic> json) {
//     categoryId = json['categoryId'];
//     type = json['type'];
//     label = json['label'];
//     description = json['description'];
//     leafNode = json['leafNode'];
//   }
//
//   factory CustomTagModel.fromJsonTags(Map<String, dynamic> json, CustomTagModel tag) {
//     return CustomTagModel(
//       categoryId: tag.categoryId,
//       type: tag.type,
//       label: tag.label,
//       description: tag.description,
//       leafNode: tag.leafNode,
//       tagId: json['tagId'],
//       tagName: json['tagName'],
//       tagDescription: json['tagDescription'],
//       tagLabel: json['tagLabel'],
//       tagValue: json['tagValue'],
//       tagValues: json['values'],
//     );
//   }
//
//   // CustomTagModel copyWith({ String categoryId, String type, String label, String description, bool leafNode, List lista }) {
//   //   return CustomTagModel(
//   //     categoryId: categoryId,
//   //     type: type,
//   //     label: label,
//   //     description: description,
//   //     leafNode: leafNode,
//   //     tagId: json['tagId'],
//   //     tagName: json['tagName'],
//   //     tagDescription: json['tagDescription'],
//   //     tagLabel: json['tagLabel'],
//   //     tagValue: json['tagValue'],
//   //     tagValues: json['values'],
//   //   );
//   // }
//
//   factory CustomTagModel.copy(CustomTagModel tag) {
//     return CustomTagModel(
//       categoryId: tag.categoryId,
//       type: tag.type,
//       label: tag.label,
//       description: tag.description,
//       leafNode: tag.leafNode,
//       tagId: tag.tagId,
//       tagName: tag.tagName,
//       tagDescription: tag.tagDescription,
//       tagLabel: tag.tagLabel,
//       tagValue: tag.tagValue,
//       tagValues: tag.tagValues,
//     );
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['albumId'] = this.albumId;
//   //   data['id'] = this.id;
//   //   data['title'] = this.title;
//   //   data['url'] = this.url;
//   //   data['thumbnailUrl'] = this.thumbnailUrl;
//   //   return data;
//   // }
// }