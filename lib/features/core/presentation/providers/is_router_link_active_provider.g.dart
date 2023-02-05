// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_router_link_active_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$isRouterLinkActiveHash() =>
    r'8ade344113b969f79a97e9de275ba4cd0b33ddc1';

/// See also [isRouterLinkActive].
class IsRouterLinkActiveProvider extends AutoDisposeProvider<bool> {
  IsRouterLinkActiveProvider(
    this.appLocation,
  ) : super(
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

typedef IsRouterLinkActiveRef = AutoDisposeProviderRef<bool>;

/// See also [isRouterLinkActive].
final isRouterLinkActiveProvider = IsRouterLinkActiveFamily();

class IsRouterLinkActiveFamily extends Family<bool> {
  IsRouterLinkActiveFamily();

  IsRouterLinkActiveProvider call(
    AppLocations appLocation,
  ) {
    return IsRouterLinkActiveProvider(
      appLocation,
    );
  }

  @override
  AutoDisposeProvider<bool> getProviderOverride(
    covariant IsRouterLinkActiveProvider provider,
  ) {
    return call(
      provider.appLocation,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'isRouterLinkActiveProvider';
}
