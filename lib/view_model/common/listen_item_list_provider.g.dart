// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listen_item_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listenItemListHash() => r'b8dff62b4a609c104733321f3ce0b60c3d16e371';

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

abstract class _$ListenItemList
    extends BuildlessAutoDisposeAsyncNotifier<List<ListenItem>> {
  late final String keyword;

  FutureOr<List<ListenItem>> build(
    String keyword,
  );
}

/// See also [ListenItemList].
@ProviderFor(ListenItemList)
const listenItemListProvider = ListenItemListFamily();

/// See also [ListenItemList].
class ListenItemListFamily extends Family<AsyncValue<List<ListenItem>>> {
  /// See also [ListenItemList].
  const ListenItemListFamily();

  /// See also [ListenItemList].
  ListenItemListProvider call(
    String keyword,
  ) {
    return ListenItemListProvider(
      keyword,
    );
  }

  @override
  ListenItemListProvider getProviderOverride(
    covariant ListenItemListProvider provider,
  ) {
    return call(
      provider.keyword,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listenItemListProvider';
}

/// See also [ListenItemList].
class ListenItemListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ListenItemList, List<ListenItem>> {
  /// See also [ListenItemList].
  ListenItemListProvider(
    String keyword,
  ) : this._internal(
          () => ListenItemList()..keyword = keyword,
          from: listenItemListProvider,
          name: r'listenItemListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listenItemListHash,
          dependencies: ListenItemListFamily._dependencies,
          allTransitiveDependencies:
              ListenItemListFamily._allTransitiveDependencies,
          keyword: keyword,
        );

  ListenItemListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.keyword,
  }) : super.internal();

  final String keyword;

  @override
  FutureOr<List<ListenItem>> runNotifierBuild(
    covariant ListenItemList notifier,
  ) {
    return notifier.build(
      keyword,
    );
  }

  @override
  Override overrideWith(ListenItemList Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListenItemListProvider._internal(
        () => create()..keyword = keyword,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        keyword: keyword,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ListenItemList, List<ListenItem>>
      createElement() {
    return _ListenItemListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListenItemListProvider && other.keyword == keyword;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, keyword.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListenItemListRef
    on AutoDisposeAsyncNotifierProviderRef<List<ListenItem>> {
  /// The parameter `keyword` of this provider.
  String get keyword;
}

class _ListenItemListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ListenItemList,
        List<ListenItem>> with ListenItemListRef {
  _ListenItemListProviderElement(super.provider);

  @override
  String get keyword => (origin as ListenItemListProvider).keyword;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
