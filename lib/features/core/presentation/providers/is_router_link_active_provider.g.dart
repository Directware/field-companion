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
    AppLocations appLocation,
  ) : this._internal(
          (ref) => isRouterLinkActive(
            ref as IsRouterLinkActiveRef,
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
          appLocation: appLocation,
        );

  IsRouterLinkActiveProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appLocation,
  }) : super.internal();

  final AppLocations appLocation;

  @override
  Override overrideWith(
    bool Function(IsRouterLinkActiveRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsRouterLinkActiveProvider._internal(
        (ref) => create(ref as IsRouterLinkActiveRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appLocation: appLocation,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsRouterLinkActiveProviderElement(this);
  }

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

mixin IsRouterLinkActiveRef on AutoDisposeProviderRef<bool> {
  /// The parameter `appLocation` of this provider.
  AppLocations get appLocation;
}

class _IsRouterLinkActiveProviderElement
    extends AutoDisposeProviderElement<bool> with IsRouterLinkActiveRef {
  _IsRouterLinkActiveProviderElement(super.provider);

  @override
  AppLocations get appLocation =>
      (origin as IsRouterLinkActiveProvider).appLocation;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
