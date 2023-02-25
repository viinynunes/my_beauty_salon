import 'package:flutter/material.dart';

class ServiceSelectorWidget extends StatefulWidget {
  const ServiceSelectorWidget({Key? key, required this.icon, required this.onIconPressed}) : super(key: key);

  final IconData icon;
  final VoidCallback onIconPressed;

  @override
  State<ServiceSelectorWidget> createState() => _ServiceSelectorWidgetState();
}

class _ServiceSelectorWidgetState extends State<ServiceSelectorWidget> {
  var selectedService = 'AAA';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButton<String>(
            value: selectedService,
            items: getItems(),
            iconSize: 0,
            onChanged: (text) {
              setState(() {
                selectedService = text!;
              });
            },
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget.onIconPressed;
            });
          },
          icon: Icon(widget.icon),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getItems() {
    return [
      DropdownMenuItem(
        value: 'AAA',
        child: Text('AAA'),
      ),
      DropdownMenuItem(
        value: 'BBB',
        child: Text('BBB'),
      ),
      DropdownMenuItem(
        value: 'CCC',
        child: Text('CCC'),
      ),
    ];
  }
}
