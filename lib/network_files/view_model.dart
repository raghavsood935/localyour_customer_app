import 'package:app/auth/auth_user_model.dart';
import 'package:app/network_files/models.dart';
import 'package:app/network_files/repository.dart';
import 'package:app/secure_storage.dart';
import 'package:app/views.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';
import 'models.dart';
import 'models.dart';
import 'models.dart';
import 'models.dart';
import 'package:flutter_share/flutter_share.dart';
final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  final repo = ref.read(homeRepoProvider);
  return HomeViewModel(ref: ref, repo: repo);
});


class HomeViewModel extends ChangeNotifier {
  ProviderReference ref;
  HomeRepository repo;

  bool isCustomer = true;
  bool isLoading = false;
  bool isSuccess = false;
  String errorMsg = '';
  String selectedLocation = '';

  List<Location> locations = [];
  List<Location> searchedLocation = [];
  List<MainServices> services = [];
  CartItemsModel? cartItems;
  ServiceDetailsModel? serviceDetailsModel;
  CustomerProfile? customerProfile;
  List<Addresses> allAddresses = [];
  List<OrdersModel> orders = [];
  List<ServiceDetailsModel> searchedServices = [];
  UpdateProfile? updateUser;

  HomeViewModel({required this.ref, required this.repo}){
    this.getLocations();

    // this.getServices();
  }


  Future getLocations() async {
    try {
      isLoading = true;
      notifyListeners();

      locations = await repo.getLocations();
    } catch (e){

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getServices(locationId) async {
    try {
      isLoading = true;
      notifyListeners();

      services = await repo.getServices(locationId);
    } catch (e){

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future customerProfileInfo( CustomerId customerId) async {
    try {
      isLoading = true;
      isSuccess = false;
      errorMsg = '';
      notifyListeners();

      ref.read(loggerProvider).e(customerId.toJson());
      customerProfile = await repo.customerProfileInfo(customerId.toJson());

      if(customerProfile != null){
        isSuccess = true;
      } else {
        errorMsg = 'Invalid Customer';
      }

    } catch (e){
      errorMsg = e.toString();
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future addAddress(AddAddress addAddress) async {
    try {
      isLoading = true;
      isSuccess = false;
      errorMsg = '';
      notifyListeners();
      ref.read(loggerProvider).e(addAddress.toJson());
      await repo.addAddress(addAddress.toJson());
      isSuccess = true;
    } catch (e){
      errorMsg = 'wrong data';
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getServiceDetails(serviceName, locationName, subLocation) async {
    try {
      isLoading = true;
      isSuccess = false;
      errorMsg = '';
      notifyListeners();
      // ref.read(loggerProvider).e(serviceName, locationName, subLocation);
      serviceDetailsModel =  await repo.getServiceDetails(serviceName, locationName, subLocation);
      isSuccess = true;
    } catch (e){
      errorMsg = 'wrong data';
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getCustomerAddresses(customerId) async {
    try {
      isLoading = true;
      notifyListeners();

      allAddresses = await repo.getCustomerAddresses(customerId);
    } catch (e){

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future editAddress(EditAddress editAddress) async {
    try {
      isLoading = true;
      isSuccess = false;
      errorMsg = '';
      notifyListeners();
      ref.read(loggerProvider).e(editAddress.toJson());
      await repo.editAddress(editAddress.toJson());
      isSuccess = true;
    } catch (e){
      errorMsg = 'wrong data';
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future addToCart(AddToCartModel addToCartModel) async {

    try {
      isLoading = true;
      isSuccess = false;
      errorMsg = '';
      notifyListeners();
      ref.read(loggerProvider).e(addToCartModel.toJson());
      await repo.addToCart(addToCartModel.toJson());
      isSuccess = true;

    } catch (e){
      errorMsg = 'wrong data';
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getCartItems(customerId) async {
    try {
      isLoading = true;
      notifyListeners();

      cartItems = await repo.getCartItems(customerId);
    } catch (e){

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future decreaseCartItemQuantity(DecreaseCartItemQuantityModel decreaseCartItemQuantityModel) async {
    try {
      isLoading = true;
      isSuccess = false;
      errorMsg = '';
      notifyListeners();
      ref.read(loggerProvider).e(decreaseCartItemQuantityModel.toJson());
      await repo.decreaseCartItemQuantity(decreaseCartItemQuantityModel.toJson());
      isSuccess = true;
    } catch (e){
      errorMsg = 'wrong data';
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future deleteCartItem(DecreaseCartItemQuantityModel decreaseCartItemQuantityModel) async {
    try {
      isLoading = true;
      isSuccess = false;
      errorMsg = '';
      notifyListeners();
      ref.read(loggerProvider).e(decreaseCartItemQuantityModel.toJson());
      await repo.deleteCartItem(decreaseCartItemQuantityModel.toJson());
      isSuccess = true;
    } catch (e){
      errorMsg = 'wrong data';
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future deleteAddress(DeleteAddressModel deleteAddressModel) async {
    try {
      isLoading = true;
      isSuccess = false;
      errorMsg = '';
      notifyListeners();
      ref.read(loggerProvider).e(deleteAddressModel.toJson());
      await repo.deleteAddress(deleteAddressModel.toJson());
      isSuccess = true;
    } catch (e){
      errorMsg = 'wrong data';
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getOrders(customerId) async {
    try {
      isLoading = true;
      notifyListeners();

      orders = await repo.getOrders(customerId);
      // notifyListeners();
      // print('11 + ${orders?[0].customerName}');
    } catch (e){

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getSearchedLocation(searchString) async {
    try {
      isLoading = true;
      notifyListeners();

      searchedLocation = await repo.getSearchedLocation(searchString);
    } catch (e){

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getSearchedService({searchString, locationId}) async {
    try {
      isLoading = true;
      notifyListeners();

      searchedServices = await repo.getSearchedService(searchString, locationId);
    } catch (e){

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future creatrOrder(CreateOrderModel createOrderModel) async {
    try {
      isLoading = true;
      isSuccess = false;
      errorMsg = '';
      notifyListeners();
      ref.read(loggerProvider).e(createOrderModel.toJson());
      await repo.createOrder(createOrderModel.toJson());
      isSuccess = true;
    } catch (e){
      errorMsg = 'wrong data';
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future editProfile(UpdateProfile updateProfile) async {
    try {
      isLoading = true;
      isSuccess = false;
      errorMsg = '';
      notifyListeners();
      ref.read(loggerProvider).e(updateProfile.toJson());
      updateUser = await repo.editProfile(updateProfile.toJson());
      await ref.read(secureStorageServiceProvider).setString('token', updateUser!.token!);
      isSuccess = true;
    } catch (e){
      errorMsg = 'wrong data';
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  // Future<void> share(ShareModel shareModel ) async {
  //   await FlutterShare.share(
  //       title: '${shareModel.title}',
  //       text: '${shareModel.text}',
  //       linkUrl: '${shareModel.linkUrl}',
  //       chooserTitle: '${shareModel.chooserTitle}');
  // }

}
