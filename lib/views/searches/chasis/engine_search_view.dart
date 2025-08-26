import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:get/get.dart';
import 'package:legal_vehicle_recovery_managment_app/views/dashboard%20view/dashboard_view.dart';

class ChassisOrEngineNoSearchView extends StatelessWidget {
  const ChassisOrEngineNoSearchView({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightScaffoldBackgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              HeaderAsAppBar(text: "Engine/Chassis Search", isbackicon: true),
              const SizedBox(height: 16),

              // Search Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Chassis or Engine No.",
                          // prefixIcon: Icon(
                          //   Icons.search,
                          //   color: AppColors.primary,
                          // ),
                          suffixIcon: Icon(Icons.mic),
                          filled: false,
                          fillColor: AppColors.kLightElevated,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(1),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.primary,
                              width: 1,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          // Implement search logic if needed
                        },
                      ),
                    ),
                    Expanded(flex: 1, child: Icon(Icons.search)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.filter_list_outlined),
              ),

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
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Chassis No",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,

                          "Vehicle Make",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,

                          "Engine No",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
