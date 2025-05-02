import 'package:flutter/material.dart';
import 'form_page.dart';
import 'converter_page.dart';
import 'listview_page.dart';
import 'gridview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItem = 0;

  final List<Widget> _widgetOptions = [
    FormPage(),
    ConverterPage(),
    ListviewPage(),
    GridviewPage(),
  ];

  void mySnackBar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  void myAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Hello!!!"),
          content: const Text("Do you want to delete?"),
          actions: [
            TextButton(
              onPressed: () {
                mySnackBar("Successful!!", context);
                Navigator.of(context).pop();
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                accountName: Text("Your Name"),
                accountEmail: Text("your.email@example.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/flutter.png"),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Form"),
              onTap: () {
                setState(() {
                  _selectedItem = 0;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.swap_horiz),
              title: const Text("Converter"),
              onTap: () {
                setState(() {
                  _selectedItem = 1;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("List View"),
              onTap: () {
                setState(() {
                  _selectedItem = 2;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.grid_view),
              title: const Text("Grid View"),
              onTap: () {
                setState(() {
                  _selectedItem = 3;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Currency Converter App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: _widgetOptions[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedItem,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Form"),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Converter"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: "Grid"),
        ],
        onTap: (int index) {
          setState(() {
            _selectedItem = index;
          });
        },
      ),
    );
  }
}
