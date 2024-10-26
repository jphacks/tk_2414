// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listHeadLineControllerHash() =>
    r'5840aa3be772a86e0032f99faade8ed7ee486ebd';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ListHeadLineController
    extends BuildlessAutoDisposeAsyncNotifier<List<HeadLineEntity>> {
  late final UuidValue lectureId;

  FutureOr<List<HeadLineEntity>> build({
    required UuidValue lectureId,
  });
}

/// See also [ListHeadLineController].
@ProviderFor(ListHeadLineController)
const listHeadLineControllerProvider = ListHeadLineControllerFamily();

/// See also [ListHeadLineController].
class ListHeadLineControllerFamily
    extends Family<AsyncValue<List<HeadLineEntity>>> {
  /// See also [ListHeadLineController].
  const ListHeadLineControllerFamily();

  /// See also [ListHeadLineController].
  ListHeadLineControllerProvider call({
    required UuidValue lectureId,
  }) {
    return ListHeadLineControllerProvider(
      lectureId: lectureId,
    );
  }

  @override
  ListHeadLineControllerProvider getProviderOverride(
    covariant ListHeadLineControllerProvider provider,
  ) {
    return call(
      lectureId: provider.lectureId,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    getHeadLineUseCaseProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    getHeadLineUseCaseProvider,
    ...?getHeadLineUseCaseProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listHeadLineControllerProvider';
}

/// See also [ListHeadLineController].
class ListHeadLineControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ListHeadLineController,
        List<HeadLineEntity>> {
  /// See also [ListHeadLineController].
  ListHeadLineControllerProvider({
    required UuidValue lectureId,
  }) : this._internal(
          () => ListHeadLineController()..lectureId = lectureId,
          from: listHeadLineControllerProvider,
          name: r'listHeadLineControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listHeadLineControllerHash,
          dependencies: ListHeadLineControllerFamily._dependencies,
          allTransitiveDependencies:
              ListHeadLineControllerFamily._allTransitiveDependencies,
          lectureId: lectureId,
        );

  ListHeadLineControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lectureId,
  }) : super.internal();

  final UuidValue lectureId;

  @override
  FutureOr<List<HeadLineEntity>> runNotifierBuild(
    covariant ListHeadLineController notifier,
  ) {
    return notifier.build(
      lectureId: lectureId,
    );
  }

  @override
  Override overrideWith(ListHeadLineController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListHeadLineControllerProvider._internal(
        () => create()..lectureId = lectureId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lectureId: lectureId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ListHeadLineController,
      List<HeadLineEntity>> createElement() {
    return _ListHeadLineControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListHeadLineControllerProvider &&
        other.lectureId == lectureId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lectureId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListHeadLineControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<HeadLineEntity>> {
  /// The parameter `lectureId` of this provider.
  UuidValue get lectureId;
}

class _ListHeadLineControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ListHeadLineController,
        List<HeadLineEntity>> with ListHeadLineControllerRef {
  _ListHeadLineControllerProviderElement(super.provider);

  @override
  UuidValue get lectureId =>
      (origin as ListHeadLineControllerProvider).lectureId;
}

String _$getMaterialListControllerHash() =>
    r'df127f1e367fc77cd84f43a275cc95acdca75557';

abstract class _$GetMaterialListController
    extends BuildlessAutoDisposeAsyncNotifier<List<SegmentEntity>> {
  late final UuidValue lectureId;

  FutureOr<List<SegmentEntity>> build({
    required UuidValue lectureId,
  });
}

/// See also [GetMaterialListController].
@ProviderFor(GetMaterialListController)
const getMaterialListControllerProvider = GetMaterialListControllerFamily();

/// See also [GetMaterialListController].
class GetMaterialListControllerFamily
    extends Family<AsyncValue<List<SegmentEntity>>> {
  /// See also [GetMaterialListController].
  const GetMaterialListControllerFamily();

  /// See also [GetMaterialListController].
  GetMaterialListControllerProvider call({
    required UuidValue lectureId,
  }) {
    return GetMaterialListControllerProvider(
      lectureId: lectureId,
    );
  }

  @override
  GetMaterialListControllerProvider getProviderOverride(
    covariant GetMaterialListControllerProvider provider,
  ) {
    return call(
      lectureId: provider.lectureId,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    getMaterialListUseCaseProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    getMaterialListUseCaseProvider,
    ...?getMaterialListUseCaseProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getMaterialListControllerProvider';
}

/// See also [GetMaterialListController].
class GetMaterialListControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GetMaterialListController,
        List<SegmentEntity>> {
  /// See also [GetMaterialListController].
  GetMaterialListControllerProvider({
    required UuidValue lectureId,
  }) : this._internal(
          () => GetMaterialListController()..lectureId = lectureId,
          from: getMaterialListControllerProvider,
          name: r'getMaterialListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMaterialListControllerHash,
          dependencies: GetMaterialListControllerFamily._dependencies,
          allTransitiveDependencies:
              GetMaterialListControllerFamily._allTransitiveDependencies,
          lectureId: lectureId,
        );

  GetMaterialListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lectureId,
  }) : super.internal();

  final UuidValue lectureId;

  @override
  FutureOr<List<SegmentEntity>> runNotifierBuild(
    covariant GetMaterialListController notifier,
  ) {
    return notifier.build(
      lectureId: lectureId,
    );
  }

  @override
  Override overrideWith(GetMaterialListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetMaterialListControllerProvider._internal(
        () => create()..lectureId = lectureId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lectureId: lectureId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GetMaterialListController,
      List<SegmentEntity>> createElement() {
    return _GetMaterialListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMaterialListControllerProvider &&
        other.lectureId == lectureId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lectureId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMaterialListControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<SegmentEntity>> {
  /// The parameter `lectureId` of this provider.
  UuidValue get lectureId;
}

class _GetMaterialListControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GetMaterialListController,
        List<SegmentEntity>> with GetMaterialListControllerRef {
  _GetMaterialListControllerProviderElement(super.provider);

  @override
  UuidValue get lectureId =>
      (origin as GetMaterialListControllerProvider).lectureId;
}

String _$listChatControllerHash() =>
    r'70af203f147de7a3b1e76a7c34f79ac3d04a1fb5';

abstract class _$ListChatController
    extends BuildlessAutoDisposeAsyncNotifier<List<ChatEntity>> {
  late final UuidValue userId;
  late final UuidValue lectureId;

  FutureOr<List<ChatEntity>> build({
    required UuidValue userId,
    required UuidValue lectureId,
  });
}

/// See also [ListChatController].
@ProviderFor(ListChatController)
const listChatControllerProvider = ListChatControllerFamily();

/// See also [ListChatController].
class ListChatControllerFamily extends Family<AsyncValue<List<ChatEntity>>> {
  /// See also [ListChatController].
  const ListChatControllerFamily();

  /// See also [ListChatController].
  ListChatControllerProvider call({
    required UuidValue userId,
    required UuidValue lectureId,
  }) {
    return ListChatControllerProvider(
      userId: userId,
      lectureId: lectureId,
    );
  }

  @override
  ListChatControllerProvider getProviderOverride(
    covariant ListChatControllerProvider provider,
  ) {
    return call(
      userId: provider.userId,
      lectureId: provider.lectureId,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    listChatUseCaseProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    listChatUseCaseProvider,
    ...?listChatUseCaseProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listChatControllerProvider';
}

/// See also [ListChatController].
class ListChatControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ListChatController, List<ChatEntity>> {
  /// See also [ListChatController].
  ListChatControllerProvider({
    required UuidValue userId,
    required UuidValue lectureId,
  }) : this._internal(
          () => ListChatController()
            ..userId = userId
            ..lectureId = lectureId,
          from: listChatControllerProvider,
          name: r'listChatControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listChatControllerHash,
          dependencies: ListChatControllerFamily._dependencies,
          allTransitiveDependencies:
              ListChatControllerFamily._allTransitiveDependencies,
          userId: userId,
          lectureId: lectureId,
        );

  ListChatControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.lectureId,
  }) : super.internal();

  final UuidValue userId;
  final UuidValue lectureId;

  @override
  FutureOr<List<ChatEntity>> runNotifierBuild(
    covariant ListChatController notifier,
  ) {
    return notifier.build(
      userId: userId,
      lectureId: lectureId,
    );
  }

  @override
  Override overrideWith(ListChatController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListChatControllerProvider._internal(
        () => create()
          ..userId = userId
          ..lectureId = lectureId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        lectureId: lectureId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ListChatController, List<ChatEntity>>
      createElement() {
    return _ListChatControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListChatControllerProvider &&
        other.userId == userId &&
        other.lectureId == lectureId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, lectureId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListChatControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<ChatEntity>> {
  /// The parameter `userId` of this provider.
  UuidValue get userId;

  /// The parameter `lectureId` of this provider.
  UuidValue get lectureId;
}

class _ListChatControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ListChatController,
        List<ChatEntity>> with ListChatControllerRef {
  _ListChatControllerProviderElement(super.provider);

  @override
  UuidValue get userId => (origin as ListChatControllerProvider).userId;
  @override
  UuidValue get lectureId => (origin as ListChatControllerProvider).lectureId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
