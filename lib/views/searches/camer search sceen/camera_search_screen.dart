import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/views/custom_appbar.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/custom_search_bar.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:legal_vehicle_recovery_managment_app/widgets/custom_table.dart';

class CameraSearchView extends StatefulWidget {
  const CameraSearchView({super.key});

  @override
  State<CameraSearchView> createState() => _CameraSearchViewState();
}

class _CameraSearchViewState extends State<CameraSearchView> {
  final List<Map<String, dynamic>> cameraSearchData = [
    {"Vehicle No": "KA44W2168", "Matched": true},
    {"Vehicle No": "KA05JK9090", "Matched": false},
    {"Vehicle No": "KA05JK9090", "Matched": false},
    {"Vehicle No": "KA05JK9090", "Matched": false},
    {"Vehicle No": "KA05JK9090", "Matched": false},
    {"Vehicle No": "KA05JK9090", "Matched": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightScaffoldBackgroundColor,
      appBar: CustomAppBar(title: 'Camera Search'),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CustomSearchWidget(hintText: 'Search'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 150,
                width: double.infinity,
                child: Center(
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(Icons.camera_alt, size: 40),
                  ),
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Implement Camera Functionality...'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          CustomTable(
            headers: ["Vehicle No", "Matched"],
            data: cameraSearchData,
            headerColor: AppColors.primary.withOpacity(.8),
            defaultColumnWidth: 180,
            columnWidths: [200, 100],
          ),
        ],
      ),
    );
  }
}
