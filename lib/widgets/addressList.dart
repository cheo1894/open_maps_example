import 'package:flutter/material.dart';

class AddressList extends StatelessWidget {
  const AddressList({super.key, required this.resultSearch});

  final List resultSearch;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(
          children:
              resultSearch.map((e) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: Colors.black)),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.location_on_outlined),
                    title: Text(e['display_name']),
                    trailing: Icon(Icons.navigation_outlined),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
