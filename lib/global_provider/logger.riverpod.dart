

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,
      ) {

    // 로그를 출력하지 않을 provider
    if(provider.name == 'pageIndexProvider'

        || provider.name == 'add name') {
      return;
    }
    debugPrint('''
{
  'provider observer'
  "🐔 provider": "${provider.name ?? provider.runtimeType}",
  "🐣 newValue": "${newValue.toString()}"
}''');
  }
}
