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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
