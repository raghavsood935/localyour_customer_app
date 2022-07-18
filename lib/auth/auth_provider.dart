import 'package:app/auth/user_repository.dart';
import 'package:app/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_user_model.dart';

final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  final repo = ref.read(userRepositoryProvider);
  return AuthViewModel(ref: ref, repo: repo);
});

class AuthViewModel extends ChangeNotifier {
  late ProviderReference ref;
  late UserRepository repo;

  String? token;
  String name = '';
  String email = '';
  String phone = '';
  LocUser? user;
  bool isLoginProcess = true;

  AuthViewModel({required this.ref, required this.repo}){
    loadUserFromLocalStorage();
  }

  Future loadUserFromLocalStorage() async {

    final storageProvider = ref.read(secureStorageServiceProvider);
    try{
      token = await storageProvider.getString('token');
    } catch (e){
      token = null;
    }
    notifyListeners();
  }
}