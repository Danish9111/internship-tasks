import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/views/custom_appbar.dart';
import 'package:legal_vehicle_recovery_managment_app/views/description_bar.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/custom_search_widget.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';

class CameraSearchView extends StatefulWidget {
  const CameraSearchView({super.key});

  @override
  State<CameraSearchView> createState() => _CameraSearchViewState();
}

class _CameraSearchViewState extends State<CameraSearchView> {
  final List<Map<String, dynamic>> cameraSearchData = [
    {"vehicleNo": "KA44W2168", "matcehd": false},
    {"vehicleNo": "KA05JK9090", "matched": false},
    {"vehicleNo": "KA12PQ6789", "matched": true},
    {"vehicleNo": "KA09ZZ1234", "matched": false},
    {"vehicleNo": "KA18GH4321", "matched": true},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightScaffoldBackgroundColor,

      appBar: CustomAppBar(title: 'Camera Search'),
      body: Column(
        children: [
          SizedBox(height: 20),
          CustomSearchWidget(hintText: 'Search'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                    child: Icon(Icons.camera_alt, size: 40),
                  ),
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Implement Camera Functionality...'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          DescriptionBar(text1: 'Vehicle No.', text2: 'Matched?'),

          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: cameraSearchData.length,
              itemBuilder: (context, index) {
                final vehicle = cameraSearchData[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.kLightElevated,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        textAlign: TextAlign.center,

                        vehicle['vehicleNo'] ?? '',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(cameraSearchData[0]["matched"].toString()),
                      Text(''),
                      Text(''),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
