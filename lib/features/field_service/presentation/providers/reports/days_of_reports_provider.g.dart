// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'days_of_reports_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$daysOfReportsHash() => r'54acb0ca723728fa72ae1a334a30ed8145ee48b2';

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

/// See also [daysOfReports].
@ProviderFor(daysOfReports)
const daysOfReportsProvider = DaysOfReportsFamily();

/// See also [daysOfReports].
class DaysOfReportsFamily extends Family<List<DateTime>> {
  /// See also [daysOfReports].
  const DaysOfReportsFamily();

  /// See also [daysOfReports].
  DaysOfReportsProvider call({
    required DateTime month,
    int firstDayOfWeek = 1,
  }) {
    return DaysOfReportsProvider(
      month: month,
      firstDayOfWeek: firstDayOfWeek,
    );
  }

  @override
  DaysOfReportsProvider getProviderOverride(
    covariant DaysOfReportsProvider provider,
  ) {
    return call(
      month: provider.month,
      firstDayOfWeek: provider.firstDayOfWeek,
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
  String? get name => r'daysOfReportsProvider';
}

/// See also [daysOfReports].
class DaysOfReportsProvider extends AutoDisposeProvider<List<DateTime>> {
  /// See also [daysOfReports].
  DaysOfReportsProvider({
    required DateTime month,
    int firstDayOfWeek = 1,
  }) : this._internal(
          (ref) => daysOfReports(
            ref as DaysOfReportsRef,
            month: month,
            firstDayOfWeek: firstDayOfWeek,
          ),
          from: daysOfReportsProvider,
          name: r'daysOfReportsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$daysOfReportsHash,
          dependencies: DaysOfReportsFamily._dependencies,
          allTransitiveDependencies:
              DaysOfReportsFamily._allTransitiveDependencies,
          month: month,
          firstDayOfWeek: firstDayOfWeek,
        );

  DaysOfReportsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
    required this.firstDayOfWeek,
  }) : super.internal();

  final DateTime month;
  final int firstDayOfWeek;

  @override
  Override overrideWith(
    List<DateTime> Function(DaysOfReportsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DaysOfReportsProvider._internal(
        (ref) => create(ref as DaysOfReportsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        month: month,
        firstDayOfWeek: firstDayOfWeek,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<DateTime>> createElement() {
    return _DaysOfReportsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DaysOfReportsProvider &&
        other.month == month &&
        other.firstDayOfWeek == firstDayOfWeek;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);
    hash = _SystemHash.combine(hash, firstDayOfWeek.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DaysOfReportsRef on AutoDisposeProviderRef<List<DateTime>> {
  /// The parameter `month` of this provider.
  DateTime get month;

  /// The parameter `firstDayOfWeek` of this provider.
  int get firstDayOfWeek;
}

class _DaysOfReportsProviderElement
    extends AutoDisposeProviderElement<List<DateTime>> with DaysOfReportsRef {
  _DaysOfReportsProviderElement(super.provider);

  @override
  DateTime get month => (origin as DaysOfReportsProvider).month;
  @override
  int get firstDayOfWeek => (origin as DaysOfReportsProvider).firstDayOfWeek;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
