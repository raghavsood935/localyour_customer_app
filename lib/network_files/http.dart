import 'package:app/auth/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _dioOptionsProvider = Provider<BaseOptions>((ref) {
  return BaseOptions(
    baseUrl: 'https://www.localyour.com',
    //connectTimeout: 5000,
    //receiveTimeout: 3000,
  );
});
/*final publicDioProvider = Provider<Dio>((ref) => Dio(ref.watch(_dioOptionsProvider)));
final _tokenDioProvider = Provider<Dio>((ref) => Dio(ref.watch(_dioOptionsProvider)));
final tokenDioProvider = Provider<Dio>((ref) {
  //final authUser = ref.watch(authUserViewModelProvider);
  final dio = ref.watch(_tokenDioProvider);
  // final authState = ref.watch(authStateChangesProvider);
  // authState.whenData((user) {
  //   dynamic _requestInterceptor(RequestOptions options, AuthUser user) async {
  //     final token = await user.idToken;
  //     options.headers.addAll({"X-Authorization-Firebase": token});
  //
  //     return options;
  //   }
  //   dio.interceptors.clear();
  //   dio.interceptors.add((InterceptorsWrapper(
  //       onRequest: (RequestOptions options) => _requestInterceptor(options, user))
  //   ));
  // });

  final pref = ref.read(sharedPreferencesServiceProvider);
  final token = pref.getString('current_user_token');
  if(token!= null && token != ''){
    dio.options.headers["Authorization"] = "$token";
  }

  return dio;
});*/

final _dioProvider = Provider<Dio>((ref) => Dio(ref.watch(_dioOptionsProvider)));

final dioProvider = Provider<Dio>((ref) {
  final dio = ref.watch(_dioProvider);
  final authVm = ref.watch(authViewModelProvider);

  final token = authVm.token;

  if(token!= null && token != ''){
    // dio.options.headers["Authorization"] = "Bearer $token";
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest:(options, handler){
        final token = authVm.token;
        print('======================================$token');
        options.headers.addAll({"Authorization": 'Bearer $token'});
        return handler.next(options); //continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: return `dio.resolve(response)`.
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: return `dio.reject(dioError)`
      },
        onResponse:(response,handler) async{
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        },
        onError: (DioError e, handler) {
          // Do something with response error
          return  handler.next(e);//continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.
        }
    ));
  }

  return dio;
});