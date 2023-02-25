import 'package:flutter/material.dart';
import 'package:my_beauty_salon/src/data/client/external/client_hive_datasource_impl.dart';
import 'package:my_beauty_salon/src/data/client/infra/datasources/client_hive_datasource.dart';
import 'package:my_beauty_salon/src/pages/client/client_list_page.dart';
import 'package:my_beauty_salon/src/pages/client/client_registration_page.dart';
import 'package:my_beauty_salon/src/pages/client/controllers/client_controller.dart';
import 'package:provider/provider.dart';

import '../../../data/client/infra/repositories/client_repository.dart';
import '../../../data/client/infra/repositories/client_repository_impl.dart';
import '../../../models/client/client_model.dart';

class ClientRouter {
  ClientRouter._();

  static Widget get clientList => MultiProvider(
        providers: [
          Provider<ClientDatasource>(
            create: (context) => ClientHiveDatasourceImpl(context.read()),
          ),
          Provider<ClientRepository>(
            create: (context) => ClientRepositoryImpl(context.read()),
          ),
          Provider(
            create: ((context) => ClientController(
                  context.read(),
                )),
          ),
        ],
        child: const ClientListPage(),
      );

  static Widget get clientRegistration => MultiProvider(
        providers: [
          Provider<ClientDatasource>(
            create: (context) => ClientHiveDatasourceImpl(context.read()),
          ),
          Provider<ClientRepository>(
            create: (context) => ClientRepositoryImpl(context.read()),
          ),
          Provider(
            create: ((context) => ClientController(
                  context.read(),
                )),
          ),
        ],
        builder: (context, child) {
          final client =
              ModalRoute.of(context)!.settings.arguments as ClientModel?;
          return ClientRegistrationPage(
            client: client,
          );
        },
      );
}
