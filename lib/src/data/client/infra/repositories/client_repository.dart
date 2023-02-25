import 'package:my_beauty_salon/src/models/client/client_model.dart';

abstract class ClientRepository {
  Future<ClientModel> saveOrUpdate({required ClientModel client});

  Future<List<ClientModel>> getAllClients();
}
