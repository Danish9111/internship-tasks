import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SimpleSettingsPageState();
}

class _SimpleSettingsPageState extends State<SettingsPage> {
  bool _searchOffline = true;
  bool _twoColumnsVehicleList = true;
  bool _hyphenatedVehicleNo = true;
  bool _keepFilterTerm = true;
  bool _scrollToTop = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Search offline"),
            value: _searchOffline,
            activeThumbColor: Colors.amber,
            onChanged: (v) => setState(() => _searchOffline = v),
          ),
          Divider(),
          SwitchListTile(
            title: const Text("Two columns vehicle list"),
            value: _twoColumnsVehicleList,
            activeThumbColor: Colors.amber,

            onChanged: (v) => setState(() => _twoColumnsVehicleList = v),
          ),
          SwitchListTile(
            title: const Text("Hyphenated vehicle no"),
            value: _hyphenatedVehicleNo,
            activeThumbColor: Colors.amber,

            onChanged: (v) => setState(() => _hyphenatedVehicleNo = v),
          ),
          SwitchListTile(
            title: const Text("Keep filter term on search"),
            value: _keepFilterTerm,
            activeThumbColor: Colors.amber,

            onChanged: (v) => setState(() => _keepFilterTerm = v),
          ),
          SwitchListTile(
            title: const Text("Scroll to top on search"),
            value: _scrollToTop,
            activeThumbColor: Colors.amber,
            tileColor: Colors.transparent, // removes background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ), // removes border radius if any
            // contentPadding: EdgeInsets.zero, // removes internal padding
            onChanged: (v) => setState(() => _scrollToTop = v),
          ),
        ],
      ),
    );
  }
}
