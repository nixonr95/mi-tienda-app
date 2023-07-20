// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$billRepositoryHash() => r'14a0c3a9ab51b71ae53c4be3fa101fbb69573b09';

/// See also [billRepository].
@ProviderFor(billRepository)
final billRepositoryProvider =
    AutoDisposeFutureProvider<BillRepository>.internal(
  billRepository,
  name: r'billRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$billRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BillRepositoryRef = AutoDisposeFutureProviderRef<BillRepository>;
String _$billsHash() => r'e58fdce94c168e7aa66a0156b297f60794923694';

/// See also [bills].
@ProviderFor(bills)
final billsProvider = AutoDisposeFutureProvider<List<Bill>>.internal(
  bills,
  name: r'billsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$billsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BillsRef = AutoDisposeFutureProviderRef<List<Bill>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
