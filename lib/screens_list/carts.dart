
import 'package:app/network_files/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cartViewModelProvider = ChangeNotifierProvider<CartViewModel>((ref) {
  return CartViewModel(ref: ref);
});

class CartViewModel extends ChangeNotifier {
  ProviderReference ref;
  CartViewModel({required this.ref});

  List<CartsModel> carts = [];
  // double subTotals = 0.00;

  // calculateTotals(){
  //
  //   // carts.reduce((item1, item2) => item1.productPrice +item2!.productPrice);
  //   subTotals = 0;
  //   carts.forEach((element) {
  //     subTotals = subTotals + element.productPrice!;
  //   });
  // }

  addToCart(CartsModel cartProduct){

    final existingIndex = carts.indexWhere((p) => p.serviceId == cartProduct.serviceId);
    if(existingIndex > -1){
    EasyLoading.showToast('allready added in cart');
    } else {
      carts.add(cartProduct);

    }

    // calculateTotals();

    notifyListeners();

  }

  updateDate(CartsModel cartProduct){

    final date = carts.indexWhere((p) => p.serviceDate == cartProduct.serviceDate);
    if(date == date){
      carts.removeAt(date);
      notifyListeners();
      carts.add(cartProduct);
    } else {
      carts.add(cartProduct);

    }

    // calculateTotals();

    notifyListeners();

  }

  updateTime(CartsModel cartProduct){

    final time = carts.indexWhere((p) => p.serviceTimeSlot == cartProduct.serviceTimeSlot);
    if(time == time){
      carts.removeAt(time);
      notifyListeners();
      carts.add(cartProduct);
    } else {
      carts.add(cartProduct);

    }

    // calculateTotals();

    notifyListeners();

  }

  // decreaseQty(int? productId){
  //
  //   final existingIndex = carts.indexWhere((p) => p.productId == productId);
  //   if(existingIndex > -1 && carts[existingIndex].qty > 1 ){
  //     carts[existingIndex].qty--;
  //   } else {
  //     carts.removeAt(existingIndex);
  //   }
  //
  //   calculateTotals();
  //   notifyListeners();
  // }
  //
  // increaseQty(int? productId){
  //
  //   final existingIndex = carts.indexWhere((p) => p.productId == productId);
  //   if(existingIndex > -1 && carts[existingIndex].qty <= 100 ){
  //     carts[existingIndex].qty++;
  //   }
  //
  //   calculateTotals();
  //   notifyListeners();
  // }

  void removeCart(int? serviceId) {
    final existingIndex = carts.indexWhere((p) => p.serviceId == serviceId);
    if(existingIndex > -1){
      carts.removeAt(existingIndex);
    }

    // calculateTotals();
    notifyListeners();
  }
}