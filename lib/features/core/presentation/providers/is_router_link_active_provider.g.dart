// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_router_link_active_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isRouterLinkActiveHash() =>
    r'8ade344113b969f79a97e9de275ba4cd0b33ddc1';

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

typedef IsRouterLinkActiveRef = AutoDisposeProviderRef<bool>;

/// See also [isRouterLinkActive].
@ProviderFor(isRouterLinkActive)
const isRouterLinkActiveProvider = IsRouterLinkActiveFamily();

/// See also [isRouterLinkActive].
class IsRouterLinkActiveFamily extends Family<bool> {
  /// See also [isRouterLinkActive].
  const IsRouterLinkActiveFamily();

  /// See also [isRouterLinkActive].
  IsRouterLinkActiveProvider call(
    AppLocations appLocation,
  ) {
    return IsRouterLinkActiveProvider(
      appLocation,
    );
  }

  @override
  IsRouterLinkActiveProvider getProviderOverride(
    covariant IsRouterLinkActiveProvider provider,
  ) {
    return call(
      provider.appLocation,
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
  String? get name => r'isRouterLinkActiveProvider';
}

/// See also [isRouterLinkActive].
class IsRouterLinkActiveProvider extends AutoDisposeProvider<bool> {
  /// See also [isRouterLinkActive].
  IsRouterLinkActiveProvider(
    this.appLocation,
  ) : super.internal(
          (ref) => isRouterLinkActive(
            ref,
            appLocation,
          ),
          from: isRouterLinkActiveProvider,
          name: r'isRouterLinkActiveProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isRouterLinkActiveHash,
          dependencies: IsRouterLinkActiveFamily._dependencies,
          allTransitiveDependencies:
              IsRouterLinkActiveFamily._allTransitiveDependencies,
        );

  final AppLocations appLocation;

  @override
  bool operator ==(Object other) {
    return other is IsRouterLinkActiveProvider &&
        other.appLocation == appLocation;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appLocation.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
