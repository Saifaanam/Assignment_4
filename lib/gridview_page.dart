import 'package:flutter/material.dart';

class GridviewPage extends StatelessWidget {
  final List<Map<String, String>> countries = [
    {
      "name": "Canada",
      "image": "assets/images/canada.png",
      "desc": "CAD is the official currency of Canada.",
    },
    {
      "name": "USA",
      "image": "assets/images/usa.png",
      "desc": "USD is the most widely used currency in the world.",
    },
    {
      "name": "United Kingdom",
      "image": "assets/images/uk.png",
      "desc": "GBP is the official currency of the United Kingdom.",
    },
    {
      "name": "Bangladesh",
      "image": "assets/images/bangladesh.png",
      "desc": "BDT is the currency of Bangladesh.",
    },
    {
      "name": "Japan",
      "image": "assets/images/japan.png",
      "desc": "JPY is the official currency of Japan.",
    },
    {
      "name": "Australia",
      "image": "assets/images/australia.png",
      "desc": "AUD is the official currency of Australia.",
    },
  ];

  void showCountryDetails(BuildContext context, Map<String, String> country) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(country['name']!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(country['image']!, width: 100),
            SizedBox(height: 10),
            Text(country['desc']!),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(), child: Text("Close"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: countries.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final country = countries[index];
          return InkWell(
            onTap: () => showCountryDetails(context, country),
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    country['image']!,
                    width: 120,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    country['name']!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
