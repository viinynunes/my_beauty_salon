import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:my_beauty_salon/src/models/client/client_model.dart';
import '../infra/datasources/client_hive_datasource.dart';

class ClientHiveDatasourceImpl implements ClientDatasource {
  final HiveInterface _hive;

  ClientHiveDatasourceImpl(this._hive);

  @override
  Future<List<ClientModel>> getAllClients() async {
    await Future.delayed(const Duration(seconds: 1));
    final clientBox = await _hive.openBox<ClientModel>('client');

    List<ClientModel> clientList = [];

    for (var c in clientBox.values) {
      clientList.add(c);
    }

    clientBox.close();

    return clientList;
  }

  @override
  Future<ClientModel> saveOrUpdate({required ClientModel client}) async {
    final clientBox = await _hive.openBox<ClientModel>('client');

    client.id ??= DateTime.now().toString();

    clientBox.put(client.id, client);

    clientBox.close();
    log('Client Saved');

    return client;
  }
}
