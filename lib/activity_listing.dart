
import 'package:app/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicRoute {
  final title;
  final route;
  DynamicRoute(this.title, this.route);
}

final routeList = [
  DynamicRoute('Login', AppRoutes.loginPage),
  DynamicRoute('Register', AppRoutes.register),
  DynamicRoute('HomePage', AppRoutes.homePage),
  DynamicRoute('Otp Verification', AppRoutes.verifyOtp),
  DynamicRoute('My Profile', AppRoutes.myProfile),
  DynamicRoute('My Orders', AppRoutes.orders),
  DynamicRoute('Painting Services', AppRoutes.painting),
  DynamicRoute('ServiceDetails', AppRoutes.serviceDetailsView),
  DynamicRoute('Add New Address', AppRoutes.addNewAddress),
  // DynamicRoute('Cart Page', AppRoutes.cartPage),
  DynamicRoute('Manage Address', AppRoutes.manageAddress),
  DynamicRoute('Payment Methods', AppRoutes.paymentMethods),
  DynamicRoute('Order Details', AppRoutes.orderDetails),
  DynamicRoute('Checkout View', AppRoutes.checkoutView),
  DynamicRoute('My Cart View', AppRoutes.myCart),
  DynamicRoute('All Services View', AppRoutes.allServices),





];

class ActivityListing extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0eded),
      appBar: AppBar(
        title: Text('Activity Listing',style: TextStyle(fontSize: 30),),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(30.0),
        itemCount: routeList.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, routeList[index].route);
              },
              child: Text('${routeList[index].title}')
          );
        },
      ),
    );
  }
}
