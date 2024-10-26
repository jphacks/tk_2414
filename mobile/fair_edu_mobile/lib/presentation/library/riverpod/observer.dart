import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogProviderObserver extends ProviderObserver {
  const LogProviderObserver({
    bool providerUpdated = false,
    bool providerDisposed = false,
    List<String> ignoreProviderNames = const <String>[],
  })  : _providerUpdated = providerUpdated,
        _providerDisposed = providerDisposed,
        _ignoreProviderNames = ignoreProviderNames;

  final bool _providerUpdated;
  final bool _providerDisposed;
  final List<String> _ignoreProviderNames;

  @override
  void didUpdateProvider(
    provider,
    previousValue,
    newValue,
    container,
  ) {
    if (kReleaseMode || !_providerUpdated) {
      return;
    }
    if (_ignoreProviderNames.any((e) => provider.name?.startsWith(e) == true)) {
      return;
    }
    if (kDebugMode) {
      debugPrint('''{
  "provider": "${provider.name ?? provider.runtimeType}",
  "argument": "${provider.argument}",
  "newValue": "$newValue"
}''');
    }
  }

  @override
  void didDisposeProvider(provider, container) {
    if (kReleaseMode || !_providerDisposed) {
      return;
    }
    if (_ignoreProviderNames.any((e) => provider.name?.startsWith(e) == true)) {
      return;
    }
    if (kDebugMode) {
      debugPrint('''{
  "provider": "${provider.name ?? provider.runtimeType}",
  "argument": "${provider.argument}",
  "newValue": "disposed"
}''');
    }
    super.didDisposeProvider(provider, container);
  }
}
