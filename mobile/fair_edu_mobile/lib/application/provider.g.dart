// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMaterialListUseCaseHash() =>
    r'62679b9b69cebfb78be18cda8aef8c20d927e106';

/// See also [getMaterialListUseCase].
@ProviderFor(getMaterialListUseCase)
final getMaterialListUseCaseProvider =
    AutoDisposeProvider<IGetMaterialListUseCase>.internal(
  getMaterialListUseCase,
  name: r'getMaterialListUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMaterialListUseCaseHash,
  dependencies: <ProviderOrFamily>[materialRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    materialRepositoryProvider,
    ...?materialRepositoryProvider.allTransitiveDependencies
  },
);

typedef GetMaterialListUseCaseRef
    = AutoDisposeProviderRef<IGetMaterialListUseCase>;
String _$getHeadLineUseCaseHash() =>
    r'79b1170bbfc9dbac0feb087f6d457911de27cdde';

/// See also [getHeadLineUseCase].
@ProviderFor(getHeadLineUseCase)
final getHeadLineUseCaseProvider =
    AutoDisposeProvider<IGetHeadLineUseCase>.internal(
  getHeadLineUseCase,
  name: r'getHeadLineUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getHeadLineUseCaseHash,
  dependencies: <ProviderOrFamily>[lectureRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    lectureRepositoryProvider,
    ...?lectureRepositoryProvider.allTransitiveDependencies
  },
);

typedef GetHeadLineUseCaseRef = AutoDisposeProviderRef<IGetHeadLineUseCase>;
String _$listChatUseCaseHash() => r'3737cd209fac50a67da7df007c18d4119b37e720';

/// See also [listChatUseCase].
@ProviderFor(listChatUseCase)
final listChatUseCaseProvider = AutoDisposeProvider<IListChatUseCase>.internal(
  listChatUseCase,
  name: r'listChatUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listChatUseCaseHash,
  dependencies: <ProviderOrFamily>[messageRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    messageRepositoryProvider,
    ...?messageRepositoryProvider.allTransitiveDependencies
  },
);

typedef ListChatUseCaseRef = AutoDisposeProviderRef<IListChatUseCase>;
String _$getMessageUseCaseHash() => r'a6ed1b829bd7e6ed36816f8b5da9ec3944669abf';

/// See also [getMessageUseCase].
@ProviderFor(getMessageUseCase)
final getMessageUseCaseProvider =
    AutoDisposeProvider<IGetMessageUseCase>.internal(
  getMessageUseCase,
  name: r'getMessageUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMessageUseCaseHash,
  dependencies: <ProviderOrFamily>[messageRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    messageRepositoryProvider,
    ...?messageRepositoryProvider.allTransitiveDependencies
  },
);

typedef GetMessageUseCaseRef = AutoDisposeProviderRef<IGetMessageUseCase>;
String _$postMessageUseCaseHash() =>
    r'2905d95578bf9be76e6a4f2edc04b7b7dbb38f70';

/// See also [postMessageUseCase].
@ProviderFor(postMessageUseCase)
final postMessageUseCaseProvider =
    AutoDisposeProvider<IPostMessageUseCase>.internal(
  postMessageUseCase,
  name: r'postMessageUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postMessageUseCaseHash,
  dependencies: <ProviderOrFamily>[lectureRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    lectureRepositoryProvider,
    ...?lectureRepositoryProvider.allTransitiveDependencies
  },
);

typedef PostMessageUseCaseRef = AutoDisposeProviderRef<IPostMessageUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
