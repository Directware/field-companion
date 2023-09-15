// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_reports_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$monthReportsHash() => r'33cc38dcf9aadd1f14d526fe6fa01a97e86bba1f';

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

/// See also [monthReports].
@ProviderFor(monthReports)
const monthReportsProvider = MonthReportsFamily();

/// See also [monthReports].
class MonthReportsFamily extends Family<List<Report>> {
  /// See also [monthReports].
  const MonthReportsFamily();

  /// See also [monthReports].
  MonthReportsProvider call({
    required DateTime month,
  }) {
    return MonthReportsProvider(
      month: month,
    );
  }

  @override
  MonthReportsProvider getProviderOverride(
    covariant MonthReportsProvider provider,
  ) {
    return call(
      month: provider.month,
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
  String? get name => r'monthReportsProvider';
}

/// See also [monthReports].
class MonthReportsProvider extends AutoDisposeProvider<List<Report>> {
  /// See also [monthReports].
  MonthReportsProvider({
    required DateTime month,
  }) : this._internal(
          (ref) => monthReports(
            ref as MonthReportsRef,
            month: month,
          ),
          from: monthReportsProvider,
          name: r'monthReportsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$monthReportsHash,
          dependencies: MonthReportsFamily._dependencies,
          allTransitiveDependencies:
              MonthReportsFamily._allTransitiveDependencies,
          month: month,
        );

  MonthReportsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
  }) : super.internal();

  final DateTime month;

  @override
  Override overrideWith(
    List<Report> Function(MonthReportsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MonthReportsProvider._internal(
        (ref) => create(ref as MonthReportsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        month: month,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Report>> createElement() {
    return _MonthReportsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MonthReportsProvider && other.month == month;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MonthReportsRef on AutoDisposeProviderRef<List<Report>> {
  /// The parameter `month` of this provider.
  DateTime get month;
}

class _MonthReportsProviderElement
    extends AutoDisposeProviderElement<List<Report>> with MonthReportsRef {
  _MonthReportsProviderElement(super.provider);

  @override
  DateTime get month => (origin as MonthReportsProvider).month;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
