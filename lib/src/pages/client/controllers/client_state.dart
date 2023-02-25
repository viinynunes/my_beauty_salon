// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:my_beauty_salon/src/models/client/client_model.dart';

enum ClientStatus { initial, loading, success, error }

class ClientState extends Equatable {
  final ClientStatus status;
  final List<ClientModel> clientList;

  const ClientState({
    required this.status,
    required this.clientList,
  });

  const ClientState.initial()
      : status = ClientStatus.initial,
        clientList = const [];

  @override
  List<Object?> get props => [status, clientList];

  ClientState copyWith({
    ClientStatus? status,
    List<ClientModel>? clientList,
  }) {
    return ClientState(
      status: status ?? this.status,
      clientList: clientList ?? this.clientList,
    );
  }
}
