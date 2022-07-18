import 'package:app/auth/auth_user_model.dart';
import 'package:app/login_register/repository.dart';
import 'package:app/secure_storage.dart';
import 'package:app/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginRegViewModelProvider = ChangeNotifierProvider<LoginRegisterViewModel>((ref) {
  final repo = ref.read(loginRegRepoProvider);
  return LoginRegisterViewModel(ref: ref, repo: repo);
});

class LoginRegisterViewModel extends ChangeNotifier {
  ProviderReference ref;
  LoginRegisterRepository repo;

  bool isLoading = false;
  bool isSuccess = false;
  String errorMsg = '';

  String name = '';
  String email = '';
  String phone = '';
  LocUser? user;
  bool isLoginProcess = true;

  LoginRegisterViewModel({required this.ref, required this.repo});

  Future register(String name, String email, String phone) async {
    try {
      isLoading = true;
      isSuccess = false;
      isLoginProcess = false;
      notifyListeners();

      this.name = name;
      this.email = email;
      this.phone = phone;

      final data = {
        "customer_name" : name,
        "customer_email" : email,
        "customer_phone" : phone
      };
      await repo.register(data);
      isSuccess = true;
    } catch (e){
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future registerWithOtp(String mobile, String otp) async {
    try {
      isLoading = true;
      isSuccess = false;
      errorMsg = '';
      notifyListeners();

      final data = {
        "customer_name" : name,
        "customer_email" : email,
        "customer_phone" : phone,
        "otp" : otp,
      };
      await repo.registerWithOtp(data);
      isSuccess = true;
    } catch (e){
      errorMsg = 'Invalid otp';
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future sendOtp(String mobile) async {
    try {
      isLoading = true;
      isSuccess = false;
      isLoginProcess = true;
      errorMsg = '';
      notifyListeners();

      final data = {
        "customer_phone" : mobile,
      };
      await repo.sendOtp(data);
      isSuccess = true;
    } catch (e){
      errorMsg = 'Error in sending otp.';
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future verifyOtpAndLogin(String mobile, String otp) async {
    try {
      isLoading = true;
      isSuccess = false;
      errorMsg = '';
      notifyListeners();

      final data = {
        "phone_number" : mobile,
        "otp" : otp,
      };

      user = await repo.verifyOtpAndLogin(data);

      if(user != null){
        // final pref = ref.read(sharedPreferencesServiceProvider);
        // pref.setString('name', user!.name!);
        // pref.setString('email', user!.email!);
        // pref.setString('phone', user!.phone!);
        // pref.setString('token', user!.token!);

        final pref = ref.read(secureStorageServiceProvider);
        await pref.setString('id', user!.id!);
        await pref.setString('name', user!.name!);
        await pref.setString('phone', user!.phone!);
        await pref.setString('email', user!.email!);
        await pref.setString('token', user!.token!);

        print(user);

        isSuccess = true;
      } else {
        errorMsg = 'Invalid OTP';
      }

    } catch (e){
      errorMsg = e.toString();
      isSuccess = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}