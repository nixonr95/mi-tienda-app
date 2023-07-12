// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clientRepositoryHash() => r'33a1874e2fecb76982edbc4179941513c1e311d2';

/// See also [clientRepository].
@ProviderFor(clientRepository)
final clientRepositoryProvider =
    AutoDisposeFutureProvider<ClientRepository>.internal(
  clientRepository,
  name: r'clientRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clientRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClientRepositoryRef = AutoDisposeFutureProviderRef<ClientRepository>;
String _$clientsHash() => r'63460d0b7aef603605a17d4e5a5e6977352880e8';

/// See also [clients].
@ProviderFor(clients)
final clientsProvider = AutoDisposeFutureProvider<List<Client>>.internal(
  clients,
  name: r'clientsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clientsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClientsRef = AutoDisposeFutureProviderRef<List<Client>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
