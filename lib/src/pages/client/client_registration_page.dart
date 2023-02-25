import 'package:flutter/material.dart';
import 'package:my_beauty_salon/src/models/client/client_model.dart';
import 'package:my_beauty_salon/src/pages/client/controllers/client_controller.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/state/base_state.dart';

class ClientRegistrationPage extends StatefulWidget {
  const ClientRegistrationPage({Key? key, this.client}) : super(key: key);

  final ClientModel? client;

  @override
  State<ClientRegistrationPage> createState() => _ClientRegistrationPageState();
}

class _ClientRegistrationPageState
    extends BaseState<ClientRegistrationPage, ClientController> {
  final nameEC = TextEditingController();
  final phoneEC = TextEditingController();
  final secondaryPhoneEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final nameFocus = FocusNode();

  @override
  void onReady() {
    super.onReady();

    if (widget.client != null) {
      nameEC.text = widget.client!.name;
      phoneEC.text = widget.client!.phone ?? '';
      secondaryPhoneEC.text = widget.client!.phone2 ?? '';
    }

    nameFocus.requestFocus();
  }

  @override
  void dispose() {
    nameEC.dispose();
    phoneEC.dispose();
    secondaryPhoneEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.client != null ? nameEC.text : 'Novo Cliente'),
        actions: [
          IconButton(
            onPressed: () {
              nameEC.clear();
              phoneEC.clear();
              secondaryPhoneEC.clear();
              nameFocus.requestFocus();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Nome *', style: textTheme.titleLarge),
                    TextFormField(
                      controller: nameEC,
                      focusNode: nameFocus,
                      decoration: InputDecoration(
                        hintText: 'Digite o nome do cliente',
                        hintStyle: textTheme.bodyMedium,
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Nome do cliente é obrigatório'),
                        Validatorless.min(
                          2,
                          'É necessário pelo menos 2 caracteres',
                        )
                      ]),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Telefone', style: textTheme.titleLarge),
                    TextFormField(
                      controller: phoneEC,
                      decoration: InputDecoration(
                        hintText: 'Digite o telefone do cliente',
                        hintStyle: textTheme.bodyMedium,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Telefone Secundário', style: textTheme.titleLarge),
                    TextFormField(
                      controller: secondaryPhoneEC,
                      decoration: InputDecoration(
                        hintText: 'Digite o telefone secundário do cliente',
                        hintStyle: textTheme.bodyMedium,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width * .9,
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    final valid = formKey.currentState?.validate() ?? false;

                    if (valid) {
                      Navigator.pop(
                        context,
                        ClientModel(
                            id: widget.client?.id,
                            name: nameEC.text,
                            phone: phoneEC.text,
                            phone2: secondaryPhoneEC.text),
                      );
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
