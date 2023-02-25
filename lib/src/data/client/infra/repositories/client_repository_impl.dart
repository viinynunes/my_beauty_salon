import 'package:my_beauty_salon/src/data/client/infra/datasources/client_hive_datasource.dart';
import 'package:my_beauty_salon/src/models/client/client_model.dart';

import './client_repository.dart';

class ClientRepositoryImpl implements ClientRepository {
  final ClientDatasource _datasource;

  ClientRepositoryImpl(this._datasource);

  @override
  Future<List<ClientModel>> getAllClients() async {
    return _datasource.getAllClients();
  }

  @override
  Future<ClientModel> saveOrUpdate({required ClientModel client}) async {
    return _datasource.saveOrUpdate(client: client);
  }
}
