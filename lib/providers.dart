import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ProviderLogger extends ProviderObserver {
  static final Logger logger = Logger();

  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    logger.d(
    '''
    {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "$newValue"
    }
    ''');
  }
}

final loggerProvider = Provider<Logger>((ref) => Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    printEmojis: true,
  ),
));

final appThemeStateProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

