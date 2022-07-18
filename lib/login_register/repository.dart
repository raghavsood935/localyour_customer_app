
import 'package:app/auth/auth_user_model.dart';
import 'package:app/network_files/http.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginRegisterRepository {
  final Reader read;

  LoginRegisterRepository({required this.read});

  Future register(Map<String, dynamic> data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/auth/register',
          data: data
      );
      return response.data;
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future registerWithOtp(Map<String, dynamic> data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/auth/verify-user-and-save',
          data: data
      );
      if(response.data?['status'] == 'success' ){
        return true;
      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future sendOtp(Map<String, dynamic> data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/auth/check-mobile-number',
          data: data
      );
      if(response.data?['status'] == 'success' ){
        return true;
      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  Future<LocUser> verifyOtpAndLogin(Map<String, dynamic> data) async {
    final api = read(dioProvider);

    try {
      final response = await api.post<Map<String, dynamic>>(
          '/customer/auth/authenticate',
          data: data
      );
      if(response.data?['status'] == 'success' ){
        // print(response.data);
        return LocUser.fromJson(response.data!['data']);

      }
      throw response.data?['message'];
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }
}

final loginRegRepoProvider = Provider((ref) => LoginRegisterRepository(read: ref.read));