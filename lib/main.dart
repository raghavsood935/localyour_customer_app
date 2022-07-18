import 'package:app/activity_listing.dart';
import 'package:app/auth/auth_provider.dart';
import 'package:app/page6.dart';
import 'package:app/screens_list/add_location.dart';
import 'package:app/screens_list/add_more_services.dart';
import 'package:app/screens_list/all_services.dart';
import 'package:app/screens_list/best_deal_view.dart';
import 'package:app/screens_list/for_your_home_view.dart';
import 'package:app/screens_list/my_cart_view.dart';
import 'package:app/screens_list/my_profile_view.dart';
import 'package:app/screens_list/painting_services_view.dart';
import 'package:app/screens_list/trending_services_view.dart';
import 'package:app/screens_list/user_name_view.dart';
import 'package:app/screens_list/main_drawer.dart';
// import 'package:app/testing_screens/abc.dart';
import 'package:app/testing_screens/anything.dart';
import 'package:app/testing_screens/drop.dart';
// import 'package:app/testing_screens/dropdown.dart';
import 'package:app/secure_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/screens_list/home_page.dart';
import 'package:app/router.dart';
import 'login_register/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Crashlytics
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  Function originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    originalOnError(errorDetails);
  };

  if (kReleaseMode) {
    debugPrint = (message, {wrapWidth}) {};
  }

  // SharedPreferences.setMockInitialValues({
  //   'appLa': true,
  // });
  // final sharedPreferences = await SharedPreferences.getInstance();
  final storage = new FlutterSecureStorage();
  runApp(
    ProviderScope(
      // observers: [ProviderLogger()],
      overrides: [
        // sharedPreferencesServiceProvider.overrideWithValue(
        //   SharedPreferencesService(sharedPreferences),
        // ),

        secureStorageServiceProvider.overrideWithValue(
          SecureStorageService(storage),
        ),

        // flavorProvider.overrideWithValue(flavor),
        // // offerDetailsServiceProvider .overrideWithProvider(Provider((ref) => FakeRepositoryOfferDetails())),
        // // dealInitiateServiceProvider.overrideWithProvider(Provider((ref) => FakeRepositoryDeals())),
        //
        // matchBoxRepositoryProvider.overrideWithProvider(Provider((ref) => FakeMatchBoxRepository(ref.read)))
      ],
      child: LocalApp(),
    ),
  );
}

class LocalApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Localyour',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //   primarySwatch: AppColors.primaryColor
        primaryColor: Color(0xFF006b94),
        buttonColor: Color(0xFFffbc00),
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Color(0xFFffbc00)),
        ),
      ),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      home: _buildHomeView(),
      // home: DatePicker(),
      // home: HomePage1(),
      // home: ActivityListing(),
      // home: ProfileView(),
      // home: Drop(),
      // home: DioReq(),
      // home: HomeView(),
      // home: ActivityListing(),
      builder: EasyLoading.init(),
    );
  }
}

_buildHomeView() {
  return _LandingView(
    guestViewBuilder: (_) => LoginPage(),
    authenticatedViewBuilder: (_) => HomeView(),
  );
}

class _LandingView extends ConsumerWidget {
  const _LandingView({
    Key? key,
    required this.authenticatedViewBuilder,
    required this.guestViewBuilder,
  }) : super(key: key);
  final WidgetBuilder authenticatedViewBuilder;
  final WidgetBuilder guestViewBuilder;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authVm = watch(authViewModelProvider);
    final token = authVm.token;

    return _data(context, token);
  }

  Widget _data(BuildContext context, String? token) {
    if (token != null) {
      return authenticatedViewBuilder(context);
    }
    return guestViewBuilder(context);
  }
}

class _EmptyContent extends StatelessWidget {
  const _EmptyContent({
    Key? key,
    this.title = 'Nothing here',
    this.message = 'Add a new item to get started',
  }) : super(key: key);
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 32.0, color: Colors.black54),
          ),
          Text(
            message,
            style: const TextStyle(fontSize: 16.0, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
