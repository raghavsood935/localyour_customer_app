

import 'package:app/auth/auth_user_model.dart';
import 'package:app/network_files/models.dart';
import 'package:app/network_files/http.dart';
import 'package:app/screens_list/location_search.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeRepository {
  final Reader read;

  HomeRepository({required this.read});

  Future<List<Location>> getLocations() async {
    final api = read(dioProvider);

    try {
      final response = await api.get<Map<String, dynamic>>(
          '/customer/api/location-list'
      );

      if(response.data?['status'] == 'success' ){
        print(response.data);
        return List<Location>.from((response.data!['data'] as List<dynamic>).map((e) => Location.fromJson(e)).toList());
      }

      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<List<MainServices>> getServices(data) async {
    final api = read(dioProvider);

    try {
      final response = await api.get<Map<String, dynamic>>(
          '/customer/api/get-all-services',
        queryParameters: {
            'location_id' : data
        }
      );

      if(response.data?['status'] == 'success' ){
        print(response.data);
        return List<MainServices>.from((response.data!['data'] as List<dynamic>).map((e) => MainServices.fromJson(e)).toList());
      }
      // else{return response.data?['message'];}

      throw response.data?['message'];//it's just the short technique of else statement
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<CustomerProfile> customerProfileInfo(data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/api/customer-profile',
          data: data
      );
      if(response.data?['status'] == 'success' ){
       // return CustomerProfile.fromJson(response.data!['data']);

        print(response.data);
        return CustomerProfile.fromJson(response.data!['data']);
      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<ServiceDetailsModel> getServiceDetails(serviceName,  locationName,  subLocation) async {
    final api = read(dioProvider);
    try {
      final response = await api.get<Map<String, dynamic>>(
          '/customer/api/service-details/',
        queryParameters: {
            'slug' : '$serviceName',
            'location_name' : '$locationName',
            'sub_location' : '$subLocation',
        }
      );
      if(response.data?['status'] == 'success' ){
        // return CustomerProfile.fromJson(response.data!['data']);
        print(response.data!);
        return ServiceDetailsModel.fromJson(response.data!['data']);
      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<AddAddress> addAddress(Map<String, dynamic> data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/api/add-customer-address',
        data: data
      );
      if(response.data?['status'] == 'success' ){
        // return CustomerProfile.fromJson(response.data!['data']);
        print(response.data);
        return response.data!['message'];
      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<List<Addresses>> getCustomerAddresses(data) async {
    final api = read(dioProvider);

    try {
      final response = await api.get<Map<String, dynamic>>(
          '/customer/api/list-of-customer-address/',
          queryParameters: {
            'customer_id' : data
          }
      );

      if(response.data?['status'] == 'success' ){
        print(response.data);
        return List<Addresses>.from((response.data!['data'] as List<dynamic>).map((e) => Addresses.fromJson(e)).toList());
      }
      // else{return response.data?['message'];}

      throw response.data?['message'];//it's just the short technique of else statement
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<AddAddress> editAddress(Map<String, dynamic> data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/api/edit-customer-address',
          data: data
      );
      if(response.data?['status'] == 'success' ){
        // return CustomerProfile.fromJson(response.data!['data']);
        print(response.data);
        return response.data!['message'];
      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<AddToCartModel> addToCart(Map<String, dynamic> data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/api/add-item-to-cart',
          data: data
      );
      if(response.data?['status'] == 'success' ){
        // return CustomerProfile.fromJson(response.data!['data']);
        print(response.data);
        return response.data!['message'];
      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<CartItemsModel> getCartItems(data) async {
    final api = read(dioProvider);

    try {
      final response = await api.get<Map<String, dynamic>>(
          '/customer/api/get-cart-items',
          queryParameters: {
            'customer_id' : data
          }
      );

      if(response.data?['status'] == 'success' ){
        print(response.data);
        return CartItemsModel.fromJson(response.data!['data']);
      }
      // else{return response.data?['message'];}

      throw response.data?['message'];//it's just the short technique of else statement
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<DecreaseCartItemQuantityModel> decreaseCartItemQuantity(Map<String, dynamic> data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/api/remove-item-from-cart',
          data: data
      );
      if(response.data?['status'] == 'success' ){
        // return CustomerProfile.fromJson(response.data!['data']);
        print(response.data);
        return response.data!['message'];
      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<DecreaseCartItemQuantityModel> deleteCartItem(Map<String, dynamic> data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/api/delete-single-item-from-cart',
          data: data
      );
      if(response.data?['status'] == 'success' ){
        // return CustomerProfile.fromJson(response.data!['data']);
        print(response.data);
        return response.data!['message'];
      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<DeleteAddressModel> deleteAddress(Map<String, dynamic> data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/api/delete-address',
          data: data
      );
      if(response.data?['status'] == 'success' ){
        // return CustomerProfile.fromJson(response.data!['data']);
        print(response.data);
        return response.data!['message'];
      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<List<OrdersModel>> getOrders(customerId) async {
    final api = read(dioProvider);

    try {
      final response = await api.get<Map<String, dynamic>>(
          '/customer/api/get-customer-order',
          queryParameters: {
            'customer_id' : customerId,
            'limit' : 10,
            'offset' : 0
          }
      );

      if(response.data?['status'] == 'success' ){
        print(response.data);
        // print(response.data!['data']);
        // return response.data!['message'];
        return List<OrdersModel>.from((response.data!['data'] as List<dynamic>).map((e) => OrdersModel.fromJson(e)).toList());
      }
      else{return response.data?['message'];}

      throw response.data?['message'];//it's just the short technique of else statement
    } on DioError catch (e) {
      print(e);
      throw e.response?.data;
    }
  }

  Future<List<Location>> getSearchedLocation(String query) async {
    final api = read(dioProvider);

    try {
      final response = await api.get<Map<String, dynamic>>(
          '/customer/api/location-search',
          queryParameters: {
            'searchString' : query
          }
      );

      if(response.data?['status'] == 'success' ){
        print(response.data);
        return List<Location>.from((response.data!['data'] as List<dynamic>).map((e) => Location.fromJson(e)).toList());
      }
      // else{return response.data?['message'];}

      throw response.data?['message'];//it's just the short technique of else statement
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<List<ServiceDetailsModel>> getSearchedService(String query, dynamic locationId) async {
    final api = read(dioProvider);

    try {
      final response = await api.get<Map<String, dynamic>>(
          '/customer/api/service-search',
          queryParameters: {
            'location_id' : locationId,
            'searchString' : query,
          }
      );

      if(response.data?['status'] == 'success' ){
        print(response.data);
        return List<ServiceDetailsModel>.from((response.data!['data'] as List<dynamic>).map((e) => ServiceDetailsModel.fromJson(e)).toList());
      }
      // else{return response.data?['message'];}

      throw response.data?['message'];//it's just the short technique of else statement
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<CreateOrderModel> createOrder(Map<String, dynamic> data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/api/do-checkout',
          data: data
      );
      if(response.data?['status'] == 'success' ){
        // return CustomerProfile.fromJson(response.data!['data']);
        print(response.data);
        return response.data!['message'];
      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<UpdateProfile> editProfile(Map<String, dynamic> data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/api/update-profile',
          data: data
      );
      if(response.data?['status'] == 'success' ){
        // return CustomerProfile.fromJson(response.data!['data']);
        print(response.data);
        return UpdateProfile.fromJson(response.data!['data']);
      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

}

final homeRepoProvider = Provider((ref) => HomeRepository(read: ref.read));

