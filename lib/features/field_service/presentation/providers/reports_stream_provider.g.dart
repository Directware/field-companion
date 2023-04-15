// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_stream_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportsStreamHash() => r'7900e202d23ae082077489a5e6f7c164194277e6';

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

typedef ReportsStreamRef = AutoDisposeStreamProviderRef<List<Report>>;

/// See also [reportsStream].
@ProviderFor(reportsStream)
const reportsStreamProvider = ReportsStreamFamily();

/// See also [reportsStream].
class ReportsStreamFamily extends Family<AsyncValue<List<Report>>> {
  /// See also [reportsStream].
  const ReportsStreamFamily();

  /// See also [reportsStream].
  ReportsStreamProvider call({
    required DateTime month,
    bool withSurroundingWeekdays = false,
  }) {
    return ReportsStreamProvider(
      month: month,
      withSurroundingWeekdays: withSurroundingWeekdays,
    );
  }

  @override
  ReportsStreamProvider getProviderOverride(
    covariant ReportsStreamProvider provider,
  ) {
    return call(
      month: provider.month,
      withSurroundingWeekdays: provider.withSurroundingWeekdays,
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
  String? get name => r'reportsStreamProvider';
}

/// See also [reportsStream].
class ReportsStreamProvider extends AutoDisposeStreamProvider<List<Report>> {
  /// See also [reportsStream].
  ReportsStreamProvider({
    required this.month,
    this.withSurroundingWeekdays = false,
  }) : super.internal(
          (ref) => reportsStream(
            ref,
            month: month,
            withSurroundingWeekdays: withSurroundingWeekdays,
          ),
          from: reportsStreamProvider,
          name: r'reportsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportsStreamHash,
          dependencies: ReportsStreamFamily._dependencies,
          allTransitiveDependencies:
              ReportsStreamFamily._allTransitiveDependencies,
        );

  final DateTime month;
  final bool withSurroundingWeekdays;

  @override
  bool operator ==(Object other) {
    return other is ReportsStreamProvider &&
        other.month == month &&
        other.withSurroundingWeekdays == withSurroundingWeekdays;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);
    hash = _SystemHash.combine(hash, withSurroundingWeekdays.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
