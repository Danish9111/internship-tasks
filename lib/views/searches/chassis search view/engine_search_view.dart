import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:get/get.dart';
import 'package:legal_vehicle_recovery_managment_app/views/dashboard%20view/dashboard_view.dart';
import 'package:legal_vehicle_recovery_managment_app/views/description_bar.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/custom_search_widget.dart';

class ChassisOrEngineNoSearchView extends StatefulWidget {
  const ChassisOrEngineNoSearchView({super.key});

  @override
  State<ChassisOrEngineNoSearchView> createState() =>
      _ChassisOrEngineNoSearchViewState();
}

class _ChassisOrEngineNoSearchViewState
    extends State<ChassisOrEngineNoSearchView> {
  final List<Map<String, String>> vehicles = const [
    {"chassis": "CH12345678", "make": "Toyota Corolla", "engine": "EN98765432"},
    {"chassis": "CH87654321", "make": "Honda Civic", "engine": "EN12345678"},
    {"chassis": "CH56781234", "make": "Suzuki Swift", "engine": "EN56781234"},
    {"chassis": "CH12345678", "make": "Toyota Corolla", "engine": "EN98765432"},
    {"chassis": "CH87654321", "make": "Honda Civic", "engine": "EN12345678"},
    {"chassis": "CH56781234", "make": "Suzuki Swift", "engine": "EN56781234"},
    {"chassis": "CH12345678", "make": "Toyota Corolla", "engine": "EN98765432"},
    {"chassis": "CH87654321", "make": "Honda Civic", "engine": "EN12345678"},
    {"chassis": "CH56781234", "make": "Suzuki Swift", "engine": "EN56781234"},
    {"chassis": "CH12345678", "make": "Toyota Corolla", "engine": "EN98765432"},
    {"chassis": "CH87654321", "make": "Honda Civic", "engine": "EN12345678"},
    {"chassis": "CH56781234", "make": "Suzuki Swift", "engine": "EN56781234"},
    {"chassis": "CH12345678", "make": "Toyota Corolla", "engine": "EN98765432"},
    {"chassis": "CH87654321", "make": "Honda Civic", "engine": "EN12345678"},
    {"chassis": "CH56781234", "make": "Suzuki Swift", "engine": "EN56781234"},
    // Add more sample vehicles or fetch from API
  ];
  String selectedValue = 'By Number';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24), // Adjust the radius as needed
          ),
        ),
        backgroundColor: AppColors.primary.withValues(alpha: 0.8),
        title: Text(
          "Chassis or Engine Search",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.lightScaffoldBackgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              // HeaderAsAppBar(text: "Engine/Chassis Search", isbackicon: true),
              const SizedBox(height: 16),
              CustomSearchWidget(),

              // Search Field

              // Header Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DescriptionBar(
                    text1: 'Chassis No.',
                    text2: 'Make',
                    text3: 'Engine No.',
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // List of Vehicles
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: vehicles.length,
                  itemBuilder: (context, index) {
                    final vehicle = vehicles[index];
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

                              vehicle['chassis'] ?? '',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,

                              vehicle['make'] ?? '',
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
        ),
      ),
    );
  }
}
