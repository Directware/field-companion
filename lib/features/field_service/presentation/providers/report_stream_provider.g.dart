// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_stream_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportStreamHash() => r'255359a19dd2b554a226b47c67b92bf1adf32069';

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

typedef ReportStreamRef = AutoDisposeStreamProviderRef<Report?>;

/// See also [reportStream].
@ProviderFor(reportStream)
const reportStreamProvider = ReportStreamFamily();

/// See also [reportStream].
class ReportStreamFamily extends Family<AsyncValue<Report?>> {
  /// See also [reportStream].
  const ReportStreamFamily();

  /// See also [reportStream].
  ReportStreamProvider call({
    required DateTime date,
  }) {
    return ReportStreamProvider(
      date: date,
    );
  }

  @override
  ReportStreamProvider getProviderOverride(
    covariant ReportStreamProvider provider,
  ) {
    return call(
      date: provider.date,
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
  String? get name => r'reportStreamProvider';
}

/// See also [reportStream].
class ReportStreamProvider extends AutoDisposeStreamProvider<Report?> {
  /// See also [reportStream].
  ReportStreamProvider({
    required this.date,
  }) : super.internal(
          (ref) => reportStream(
            ref,
            date: date,
          ),
          from: reportStreamProvider,
          name: r'reportStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportStreamHash,
          dependencies: ReportStreamFamily._dependencies,
          allTransitiveDependencies:
              ReportStreamFamily._allTransitiveDependencies,
        );

  final DateTime date;

  @override
  bool operator ==(Object other) {
    return other is ReportStreamProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
