import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_beauty_salon/src/models/client/client_model.dart';
import 'package:my_beauty_salon/src/pages/client/controllers/client_controller.dart';
import 'package:my_beauty_salon/src/pages/client/controllers/client_state.dart';

import '../../core/ui/state/base_state.dart';

class ClientListPage extends StatefulWidget {
  const ClientListPage({Key? key}) : super(key: key);

  @override
  State<ClientListPage> createState() => _ClientListPageState();
}

class _ClientListPageState extends BaseState<ClientListPage, ClientController> {
  @override
  void onReady() {
    super.onReady();

    controller.getAllClients();
  }

  Future<void> callClientRegistration({ClientModel? client}) async {
    final result = await Navigator.of(context)
        .pushNamed('/client/registration', arguments: client);

    if (result is ClientModel) {
      controller.save(result);
      controller.getAllClients();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClientController, ClientState>(
      listener: (context, state) {
        if (state.status == ClientStatus.initial) {
          closeLoader();
        }
        if (state.status == ClientStatus.loading) {
          showLoader();
        }
        if (state.status == ClientStatus.success) {
          closeLoader();
        }

        if (state.status == ClientStatus.error) {
          closeLoader();
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => callClientRegistration(),
          child: const Icon(Icons.add),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Client'),
              pinned: false,
              floating: true,
            ),
            BlocSelector<ClientController, ClientState, List<ClientModel>>(
              selector: (state) => state.clientList,
              builder: (context, clientList) => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    final client = clientList[index];
                    return ListTile(
                      onTap: () => callClientRegistration(client: client),
                      title: Text(client.name),
                    );
                  },
                  childCount: clientList.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
