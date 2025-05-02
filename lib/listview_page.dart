import 'package:flutter/material.dart';

class ListviewPage extends StatelessWidget {
  const ListviewPage({super.key});

  final List<Map<String, dynamic>> conversions = const [
    {'cad': 10, 'bdt': 875.0},
    {'cad': 25, 'bdt': 2187.5},
    {'cad': 50, 'bdt': 4375.0},
    {'cad': 100, 'bdt': 8750.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6FF),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 186, 176, 233),
        title: const Text("Conversion History"),
      ),
      body: ListView.separated(
        itemCount: conversions.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = conversions[index];
          return ListTile(
            leading: const Icon(Icons.monetization_on_outlined,
                color: Colors.deepPurple),
            title: Text(
              "${item['cad']} CAD → ${item['bdt']} BDT",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("Manual entry"),
            trailing: const Icon(Icons.history),
          );
        },
      ),
    );
  }
}
