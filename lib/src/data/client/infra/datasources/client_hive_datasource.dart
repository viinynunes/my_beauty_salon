import '../../../../models/client/client_model.dart';

abstract class ClientDatasource {
  Future<ClientModel> saveOrUpdate({required ClientModel client});

  Future<List<ClientModel>> getAllClients();
}
