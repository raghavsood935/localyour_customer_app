import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserRepository {

  final Reader read;
  UserRepository(this.read);

  // Future<CheckUser> _check(String url) async {
  //   final api = read(publicDioProvider);
  //
  //   try {
  //     final response = await api.get<Map<String, dynamic>>(url);
  //     return CheckUser.fromJson(response.data);
  //   } on DioError catch (e) {
  //     read(loggerProvider).e(e);
  //     if (e.type == DioErrorType.response && e.response!.statusCode == 404) {
  //       return CheckUser(true, 500, "not found", e.response, e);
  //     } else {
  //       rethrow;
  //     }
  //   }
  // }
}

final userRepositoryProvider = Provider((ref) => UserRepository(ref.read));
