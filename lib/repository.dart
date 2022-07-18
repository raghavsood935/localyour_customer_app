class Repository {

  // final Reader read;
  // Logger logger;
  // CreateOfferRepository(this.read){
  //   logger = read(loggerProvider);
  // }
  //
  // Future createDraftOffer(CreateOfferModel offerData) async {
  //   final dioClient = read(tokenDioProvider);
  //   Map<String, dynamic> data = offerData.toDraftJson();
  //   final response = await dioClient.post<Map<String, dynamic>>(
  //       "/offers/v1/draft/offers/service",
  //       data: data
  //   );
  //
  //   final responseObj = BaseResponseModel.fromJson(response.data);
  //
  //   logger.d(responseObj.message);
  //
  //   if(responseObj.code == 200 || responseObj.code == 201){
  //     return responseObj.payload['draftOfferId'].toString();
  //   } else {
  //     return '';
  //   }
  // }
  //
  // Future updateDraftOffer(CreateOfferModel offerData) async {
  //   final dioClient = read(tokenDioProvider);
  //
  //   final response = await dioClient.put<Map<String, dynamic>>(
  //       "/offers/v1/draft/offers/service",
  //       data: offerData.toDraftJson()
  //   );
  //   logger.d(response);
  //
  //   final responseObj = BaseResponseModel.fromJson(response.data);
  //
  //   logger.d(responseObj.message);
  //   return responseObj;
  // }
  //
  // Future addAddress(LocationModel location) async {
  //   final dioClient = read(tokenDioProvider);
  //   final response = await dioClient.post<Map<String, dynamic>>(
  //       "/users/v1/user/address",
  //       data: location.toJson()
  //   );
  //
  //   final responseObj = BaseResponseModel.fromJson(response.data);
  //
  //   logger.d(responseObj.message);
  //
  //   if(responseObj.code == 200 || responseObj.code == 201){
  //     return LocationModel.fromJson(responseObj.payload);
  //   } else {
  //     throw('Error in adding address');
  //   }
  // }
  //
  // Future deleteAddress(String addressId) async {
  //   final dioClient = read(tokenDioProvider);
  //   final response = await dioClient.delete<Map<String, dynamic>>(
  //       "/users/v1/user/address/$addressId"
  //   );
  //
  //   final responseObj = BaseResponseModel.fromJson(response.data);
  //
  //   logger.d(responseObj.message);
  //
  //   if(responseObj.code == 200){
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  //
  // Future getAddresses() async {
  //   final dioClient = read(tokenDioProvider);
  //   final response = await dioClient.get<Map<String, dynamic>>(
  //       "/users/v1/user/address/all"
  //   );
  //
  //   final responseObj = BaseResponseModel.fromJson(response.data);
  //
  //   logger.d(responseObj.message);
  //
  //   List<LocationModel> addresses = [];
  //
  //   if(responseObj.code == 200) {
  //     responseObj.payload.forEach((v) {
  //       final loc = LocationModel.fromJson(v);
  //       addresses.add(loc);
  //     });
  //   }
  //
  //   return addresses;
  // }
  //
  // Future createOffer(CreateOfferModel offerData) async {
  //   final dioClient = read(tokenDioProvider);
  //   logger.d(offerData.toServiceJson());
  //   try{
  //
  //     final response = await dioClient.post<Map<String, dynamic>>(
  //         "/offers/v1/offers/service",
  //         data: offerData.toServiceJson()
  //     );
  //
  //     final responseObj = BaseResponseModel.fromJson(response.data);
  //
  //     logger.d(responseObj.message);
  //     return responseObj.payload;
  //
  //   } on DioError catch (e) {
  //     logger.e(e.error);
  //   } catch(e){
  //     logger.e(e);
  //   }
  //
  //   return null;
  // }
  //
  // Future createItemOffer(CreateOfferModel offerData) async {
  //   final dioClient = read(tokenDioProvider);
  //   logger.d(offerData.toItemJson());
  //   try{
  //
  //     final response = await dioClient.post<Map<String, dynamic>>(
  //         "/offers/v1/offers/item",
  //         data: offerData.toItemJson()
  //     );
  //
  //     final responseObj = BaseResponseModel.fromJson(response.data);
  //
  //     logger.d(responseObj.message);
  //     return responseObj.payload;
  //
  //   } on DioError catch (e) {
  //     logger.e(e.error);
  //   } catch(e){
  //     logger.e(e);
  //   }
  //
  //   return null;
  // }
  //
  // List<CategoryModel> parseCategories(String responseBody) {
  //   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  //
  //   return parsed.map<CategoryModel>((json) => CategoryModel.fromJson(json)).toList();
  // }
  //
  // Future<List<CategoryModel>> getCategories(Map<String, dynamic> queryParameters) async {
  //   final dioClient = read(publicDioProvider);
  //   final catResponse = await dioClient.get(
  //       "/categories/v1/categories",
  //       queryParameters: queryParameters
  //   );
  //
  //   final responseObj = ResponseModel.fromJson(catResponse.data);
  //
  //   List<CategoryModel> categories = responseObj.payload.map((e) => CategoryModel.fromJson(e)).toList();
  //   return categories;
  // }
  //
  // Future<List<CustomTagModel>> getCategoriesAsCustomTags(Map<String, dynamic> queryParameters) async {
  //   final dioClient = read(publicDioProvider);
  //
  //   final catResponse = await dioClient.get(
  //       "/categories/v1/categories",
  //       queryParameters: queryParameters
  //   );
  //
  //   final responseObj = ResponseModel.fromJson(catResponse.data);
  //
  //   List<CustomTagModel> categories = responseObj.payload.map((e) => CustomTagModel.fromJson(e)).toList();
  //   return categories;
  // }
  //
  // Future<List<CustomTagModel>> getTagsAsCustomTags(CustomTagModel catTag, Map<String, dynamic> queryParameters) async {
  //   final dioClient = read(publicDioProvider);
  //   final catResponse = await dioClient.get(
  //       '/categories/v1/category-tags/${catTag.categoryId}',
  //       // '/categories/v1/category-tags/99a1ae3a-9536-4fb6-9bb9-e01d61c49e1c',
  //       queryParameters: queryParameters
  //   );
  //
  //   final responseObj = ResponseModel.fromJson(catResponse.data);
  //
  //   List<CustomTagModel> categories = [];
  //
  //   responseObj.payload.forEach((v) {
  //     CustomTagModel tag = CustomTagModel.fromJsonTags(v, catTag);
  //     catTag.tagId = tag.tagId;
  //
  //     tag.tagValues.forEach((tg) {
  //       final tagObj = CustomTagModel.copy(catTag);
  //       tagObj.tagValue = tg;
  //       tagObj.label = tg;
  //       categories.add(tagObj);
  //     });
  //   });
  //
  //   return categories;
  // }
  //
  // Future uploadFile(FormData formData) async {
  //   final dioClient = read(tokenDioProvider);
  //
  //   final response = await dioClient.post<Map<String, dynamic>>(
  //       "/offers/v1/draft/offers/attachments/document",
  //       data: formData
  //   );
  //
  //   logger.d(response);
  //   final responseObj = BaseResponseModel.fromJson(response.data);
  //   logger.d(responseObj.message);
  //   List<DocumentModel> docs = [];
  //
  //   if(responseObj.code == 200){
  //     responseObj.payload['documents'].forEach((val) {
  //       docs.add(DocumentModel.fromJson(val));
  //     });
  //   }
  //
  //   return docs;
  // }
  //
  // Future uploadImage(FormData formData) async {
  //   final dioClient = read(tokenDioProvider);
  //
  //   final response = await dioClient.post<Map<String, dynamic>>(
  //       "/offers/v1/draft/offers/attachments/image",
  //       data: formData
  //   );
  //
  //   final responseObj = BaseResponseModel.fromJson(response.data);
  //   logger.d(responseObj.message);
  //   List<ImageModel> images = [];
  //
  //   if(responseObj.code == 200){
  //     responseObj.payload['images'].forEach((val) {
  //       images.add(ImageModel.fromJson(val));
  //     });
  //   }
  //
  //   return images;
  // }
  //
  // Future deleteImage(String data) async {
  //   final dioClient = read(tokenDioProvider);
  //
  //   final response = await dioClient.delete<Map<String, dynamic>>(
  //       "/offers/v1/draft/offers/attachments/image",
  //       data: data
  //   );
  //
  //   final responseObj = BaseResponseModel.fromJson(response.data);
  //   logger.d(responseObj.message);
  //   List<ImageModel> images = [];
  //
  //   if(responseObj.code == 200){
  //     responseObj.payload['images'].forEach((val) {
  //       images.add(ImageModel.fromJson(val));
  //     });
  //   }
  //
  //   return images;
  // }
  //
  // Future uploadVideo(FormData formData) async {
  //   final dioClient = read(tokenDioProvider);
  //
  //   final response = await dioClient.post<Map<String, dynamic>>(
  //       "/offers/v1/draft/offers/attachments/video",
  //       data: formData
  //   );
  //
  //   final responseObj = BaseResponseModel.fromJson(response.data);
  //   logger.d(responseObj.message);
  //   List<VideoModel> videos = [];
  //
  //   if(responseObj.code == 200){
  //     responseObj.payload['videos'].forEach((val) {
  //       videos.add(VideoModel.fromJson(val));
  //     });
  //   }
  //
  //   return videos;
  // }
  //
  // Future deleteVideo(String data) async {
  //   final dioClient = read(tokenDioProvider);
  //
  //   final response = await dioClient.delete<Map<String, dynamic>>(
  //       "/offers/v1/draft/offers/attachments/video",
  //       data: data
  //   );
  //
  //   final responseObj = BaseResponseModel.fromJson(response.data);
  //   logger.d(responseObj.message);
  //   List<VideoModel> videos = [];
  //
  //   if(responseObj.code == 200){
  //     responseObj.payload['videos'].forEach((val) {
  //       videos.add(VideoModel.fromJson(val));
  //     });
  //   }
  //
  //   return videos;
  // }
  //
  // Future deleteFile(String data) async {
  //   final dioClient = read(tokenDioProvider);
  //
  //   final response = await dioClient.delete<Map<String, dynamic>>(
  //       "/offers/v1/draft/offers/attachments/document",
  //       data: data
  //   );
  //
  //   final responseObj = BaseResponseModel.fromJson(response.data);
  //   logger.d(responseObj.message);
  //   List<DocumentModel> docs = [];
  //
  //   if(responseObj.code == 200){
  //     responseObj.payload['documents'].forEach((val) {
  //       docs.add(DocumentModel.fromJson(val));
  //     });
  //   }
  //
  //   return docs;
  // }
  //
  // Future<List<CreateOfferModel>> getDraftOffers({params: const {}}) async {
  //   final api = read(tokenDioProvider);
  //
  //   try {
  //     final response = await api.get<Map<String, dynamic>>(
  //         '/offers/v1/draft/offers',
  //         queryParameters: params
  //     );
  //
  //     final responseObj = BaseResponseModel.fromJson(response.data);
  //
  //     List<CreateOfferModel> draftOffers = [];
  //
  //     if(responseObj.code == 200) {
  //       responseObj.payload.forEach((v) {
  //         final loc = CreateOfferModel.fromDraftJson(v);
  //         draftOffers.add(loc);
  //       });
  //     }
  //
  //     read(loggerProvider).d(responseObj.message);
  //
  //     return draftOffers;
  //   } on DioError catch (e) {
  //     read(loggerProvider).e(e);
  //     rethrow;
  //   }
  // }

  void dispose() {
    // TODO: implement dispose
  }
}