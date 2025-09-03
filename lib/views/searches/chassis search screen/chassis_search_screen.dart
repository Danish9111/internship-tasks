import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';

import 'package:legal_vehicle_recovery_managment_app/views/searches/custom_search_bar.dart';
import 'package:legal_vehicle_recovery_managment_app/widgets/custom_table.dart';

class ChassisOrEngineNoSearchView extends StatefulWidget {
  const ChassisOrEngineNoSearchView({super.key});

  @override
  State<ChassisOrEngineNoSearchView> createState() =>
      _ChassisOrEngineNoSearchViewState();
}

class _ChassisOrEngineNoSearchViewState
    extends State<ChassisOrEngineNoSearchView> {
  // final List<Map<String, String>> vehicles = const [
  //   {"chassis": "CH12345678", "make": "Toyota Corolla", "engine": "EN98765432"},
  //   {"chassis": "CH87654321", "make": "Honda Civic", "engine": "EN12345678"},
  //   {"chassis": "CH56781234", "make": "Suzuki Swift", "engine": "EN56781234"},
  //   {"chassis": "CH12345678", "make": "Toyota Corolla", "engine": "EN98765432"},
  //   {"chassis": "CH87654321", "make": "Honda Civic", "engine": "EN12345678"},
  //   {"chassis": "CH56781234", "make": "Suzuki Swift", "engine": "EN56781234"},
  //   {"chassis": "CH12345678", "make": "Toyota Corolla", "engine": "EN98765432"},
  //   {"chassis": "CH87654321", "make": "Honda Civic", "engine": "EN12345678"},
  //   {"chassis": "CH56781234", "make": "Suzuki Swift", "engine": "EN56781234"},
  //   {"chassis": "CH12345678", "make": "Toyota Corolla", "engine": "EN98765432"},
  //   {"chassis": "CH87654321", "make": "Honda Civic", "engine": "EN12345678"},
  //   {"chassis": "CH56781234", "make": "Suzuki Swift", "engine": "EN56781234"},
  //   {"chassis": "CH12345678", "make": "Toyota Corolla", "engine": "EN98765432"},
  //   {"chassis": "CH87654321", "make": "Honda Civic", "engine": "EN12345678"},
  //   {"chassis": "CH56781234", "make": "Suzuki Swift", "engine": "EN56781234"},
  //   // Add more sample vehicles or fetch from API
  // ];
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
              CustomSearchWidget(hintText: 'Chassis No...'),

              const SizedBox(height: 8),

              // List of Vehicles
              CustomTable(
                headerColor: AppColors.primary.withOpacity(.8),
                data: [
                  {
                    "Chassis No.": "CH12345678",
                    "Make": "Toyota Corolla",
                    "Engine No.": "EN98765432",
                  },
                  {
                    "Chassis No.": "CH87654321",
                    "Make": "Honda Civic",
                    "Engine No.": "EN12345678",
                  },
                  {
                    "Chassis No.": "CH56781234",
                    "Make": "Suzuki Swift",
                    "Engine No.": "EN56781234",
                  },
                  {
                    "Chassis No.": "CH12345678",
                    "Make": "Toyota Corolla",
                    "Engine No.": "EN98765432",
                  },
                  {
                    "Chassis No.": "CH87654321",
                    "Make": "Honda Civic",
                    "Engine No.": "EN12345678",
                  },
                  {
                    "Chassis No.": "CH56781234",
                    "Make": "Suzuki Swift",
                    "Engine No.": "EN56781234",
                  },
                  {
                    "Chassis No.": "CH12345678",
                    "Make": "Toyota Corolla",
                    "Engine No.": "EN98765432",
                  },

                  // Add more sample vehicles or fetch from API
                ],
                headers: ["Chassis No.", "Make", "Engine No."],
                columnWidths: [150, 100, 100],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
