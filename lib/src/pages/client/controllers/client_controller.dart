import 'package:bloc/bloc.dart';
import 'package:my_beauty_salon/src/models/client/client_model.dart';

import '../../../data/client/infra/repositories/client_repository.dart';
import 'client_state.dart';

class ClientController extends Cubit<ClientState> {
  final ClientRepository clientRepository;

  ClientController(this.clientRepository) : super(const ClientState.initial());

  void save(ClientModel client) {
    emit(state.copyWith(status: ClientStatus.loading));

    try {
      clientRepository.saveOrUpdate(client: client);

      emit(state.copyWith(status: ClientStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ClientStatus.error));
    }
  }

  void getAllClients() async {
    emit(state.copyWith(status: ClientStatus.loading));

    try {
      final clientList = await clientRepository.getAllClients();

      emit(
          state.copyWith(status: ClientStatus.success, clientList: clientList));
    } catch (e) {
      emit(state.copyWith(status: ClientStatus.error));
    }
  }
}
