import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ViewModel extends ChangeNotifier {
  final Reader read;
  dynamic error;
  bool isLoading = false;

  ViewModel(this.read);

  bool get caughtError => error != null;
}