import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:get/get.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/custom_search_widget.dart';
import 'package:legal_vehicle_recovery_managment_app/views/description_bar.dart';

class VehicleSearchView extends StatefulWidget {
  const VehicleSearchView({super.key});

  @override
  State<VehicleSearchView> createState() => _VehicleSearchViewState();
}

class _VehicleSearchViewState extends State<VehicleSearchView> {
  // 🔎 Vehicle Search Dummy Data
  final List<Map<String, String>> vehicleSearchData = [
    {"vehicleNo": "KA02KR5555", "model": "TVS Ntorq 125"},
    {"vehicleNo": "KA03JL8888", "model": "KTM Duke 200 BS6"},
    {"vehicleNo": "KA05MN4321", "model": "Suzuki Access 125"},
    {"vehicleNo": "KA11EV9999", "model": "Royal Enfield Classic 350"},
    {"vehicleNo": "KA22HL5555", "model": "Suzuki Burgman Street 125"},
    {"vehicleNo": "KA27TP7777", "model": "Jawa Perak"},
    {"vehicleNo": "KA30X1234", "model": "Honda Activa 6G"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightScaffoldBackgroundColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24), // Adjust the radius as needed
          ),
        ),
        backgroundColor: AppColors.primary.withValues(alpha: 0.8),
        title: Text(
          "Vehicle Search",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          CustomSearchWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DescriptionBar(text1: 'Vehicle No', text2: 'Model'),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: vehicleSearchData.length,
              itemBuilder: (context, index) {
                final vehicle = vehicleSearchData[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.kLightElevated,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,

                          vehicle['vehicleNo'] ?? '',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,

                          vehicle['model'] ?? '',
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,

                          vehicle['engine'] ?? '',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
