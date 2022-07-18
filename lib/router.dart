import 'package:app/network_files/models.dart';
import 'package:app/screens_list/add_location.dart';
import 'package:app/screens_list/add_new_address_view.dart';
import 'package:app/screens_list/all_services.dart';
import 'package:app/screens_list/change_or_add_address.dart';
import 'package:app/screens_list/checkout_view.dart';
import 'package:app/screens_list/edit_profile_view.dart';
import 'package:app/screens_list/location_search.dart';
import 'package:app/screens_list/my_profile_view.dart';
import 'package:app/screens_list/order_details.dart';
import 'package:app/screens_list/orders_view.dart';
import 'package:app/screens_list/painting_services_view.dart';
import 'package:app/screens_list/service_details_view.dart';
import 'package:app/login_register/registration_view.dart';
import 'package:app/login_register/verify_otp_view.dart';
import 'package:app/screens_list/manage_address_view.dart';
import 'package:app/screens_list/my_cart_view.dart';
import 'package:app/screens_list/payment_methods_view.dart';
import 'package:app/screens_list/service_list_children_wise.dart';
import 'package:app/screens_list/service_search_view.dart';
import 'package:flutter/material.dart';
import 'package:app/screens_list/home_page.dart';

import 'login_register/login_page.dart';

class AppRoutes {
  static const loginPage = '/login-page';
  static const register = '/register';
  static const verifyOtp = '/verify-otp';
  static const homePage = '/home-page';
  static const myProfile = '/my-profile-view';
  static const orders = '/orders-view';
  static const painting = '/painting-services-view';
  static const serviceDetailsView = '/renovation-services-view';
  static const addNewAddress = '/add-new-addrress-view';
  // static const cartPage = '/cart-page-view';
  static const manageAddress = '/manage-address-view';
  static const paymentMethods = '/payment-methods-view';
  static const checkoutView = '/checkout-view';
  static const orderDetails = '/order-details-view';
  static const myCart = '/my-cart-view';
  static const allServices = '/all-services-view';
  static const changeOrAddAddress = '/change-or-add-address';
  static const orderDetailsView = '/order-details-view';
  static const searchLocation = '/location-search-view';
  static const searchServices = '/service-search-view';
  static const editProfile = '/edit-profile-view';
  static const locationSearch = '/location-search-view';
  static const childrenWiseServices = '/children-wise-services-list';
  static const addlocation = '/add-location';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      case AppRoutes.loginPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => LoginPage(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.addlocation:
        return MaterialPageRoute<dynamic>(
          builder: (_) => AddLocation(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.register:
        return MaterialPageRoute<dynamic>(
          builder: (_) => RegistrationView(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.verifyOtp:
        final mobile = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => VerifyOtpView(mobile),
          settings: settings,
          fullscreenDialog: true,
        );

      case AppRoutes.homePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomeView(args: settings.arguments == null ? null : settings.arguments as HomeViewArgs,),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.childrenWiseServices:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ChildrenWiseServicesList(args: settings.arguments == null ? null : settings.arguments as ChildrenWiseServicesListArgs,),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.myProfile:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ProfileView(args: settings.arguments == null ? null : settings.arguments as ProfileViewArgs,),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.orders:
        return MaterialPageRoute<dynamic>(
          builder: (_) => OrdersView(args: settings.arguments == null ? null : settings.arguments as OrdersViewArgs,),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.painting:
        return MaterialPageRoute<dynamic>(
          builder: (_) => PaintingServicesView(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.serviceDetailsView:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ServiceDetailsView(args: settings.arguments == null ? null : settings.arguments as ServiceDetailsViewArgs,),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.addNewAddress:
        return MaterialPageRoute<dynamic>(
          builder: (_) => AddNewAddressView(address: settings.arguments == null ? null : settings.arguments as Addresses,),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.manageAddress:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ManageAddressView(args: settings.arguments == null ? null : settings.arguments as ManageAddressViewArgs,),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.paymentMethods:
        return MaterialPageRoute<dynamic>(
          builder: (_) => PaymentMethodsView(),
          settings: settings,
          fullscreenDialog: true,
        );
      // case AppRoutes.orderDetails:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => OrderDetailsView(),
      //     settings: settings,
      //     fullscreenDialog: true,
      //   );
      case AppRoutes.checkoutView:
        return MaterialPageRoute<dynamic>(
          builder: (_) => CheckoutView(args: settings.arguments == null ? null : settings.arguments as CheckoutViewArgs,),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.myCart:
        return MaterialPageRoute<dynamic>(
          builder: (_) => MyCartView(args: settings.arguments == null ? null : settings.arguments as MyCartViewArgs,),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.allServices:
        return MaterialPageRoute<dynamic>(
          builder: (_) => AllServicesView(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.changeOrAddAddress:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ChangeOrAddAddress(args: settings.arguments == null ? null : settings.arguments as ChangeOrAddAddressArgs,),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.orderDetailsView:
        return MaterialPageRoute<dynamic>(
          builder: (_) => OrderDetailsView(args: settings.arguments == null ? null : settings.arguments as OrderDetailsViewArgs,),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.searchLocation:
        return MaterialPageRoute<dynamic>(
          builder: (_) => LocationSearchView(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.searchServices:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ServiceSearchView(args: settings.arguments == null ? null : settings.arguments as ServiceSearchViewArgs,),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.editProfile:
        return MaterialPageRoute<dynamic>(
          builder: (_) => EditProfileView(args: settings.arguments == null ? null : settings.arguments as EditProfileViewArgs,),
          settings: settings,
          fullscreenDialog: true,
        );




    // case AppRoutes.videoPlayer:
      //   GintaaPlayerArgs args = settings.arguments;
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => GintaaPlayer(url: videoArgs.url,  tag: videoArgs.tag,),
      //     settings: settings,
      //     fullscreenDialog: true,
      //   );

      default:
      // TODO: Throw
        return null;
    }
  }
}

// RedeemDetailsPage