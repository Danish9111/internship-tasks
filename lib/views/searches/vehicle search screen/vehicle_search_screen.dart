import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/custom_search_bar.dart';
import 'package:legal_vehicle_recovery_managment_app/widgets/custom_table.dart';

class VehicleSearchView extends StatefulWidget {
  const VehicleSearchView({super.key});

  @override
  State<VehicleSearchView> createState() => _VehicleSearchViewState();
}

class _VehicleSearchViewState extends State<VehicleSearchView> {
  // 🔎 Vehicle Search Dummy Data
  // final List<Map<String, String>> vehicleSearchData = [
  //   {"vehicleNo": "KA02KR5555", "model": "TVS Ntorq 125"},
  //   {"vehicleNo": "KA03JL8888", "model": "KTM Duke 200 BS6"},
  //   {"vehicleNo": "KA05MN4321", "model": "Suzuki Access 125"},
  //   {"vehicleNo": "KA11EV9999", "model": "Royal Enfield Classic 350"},
  //   {"vehicleNo": "KA22HL5555", "model": "Suzuki Burgman Street 125"},
  //   {"vehicleNo": "KA27TP7777", "model": "Jawa Perak"},
  //   {"vehicleNo": "KA30X1234", "model": "Honda Activa 6G"},
  // ];

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
          CustomSearchWidget(hintText: 'Vehicle No...'),

          SizedBox(height: 10),
          CustomTable(
            data: [
              {"vehicleNo": "KA02KR5555", "model": "TVS Ntorq 125"},
              {"vehicleNo": "KA03JL8888", "model": "KTM Duke 200 BS6"},
              {"vehicleNo": "KA05MN4321", "model": "Suzuki Access 125"},
              {"vehicleNo": "KA11EV9999", "model": "Royal Enfield Classic 350"},
              {"vehicleNo": "KA22HL5555", "model": "Suzuki Burgman Street 125"},
              {"vehicleNo": "KA27TP7777", "model": "Jawa Perak"},
              {"vehicleNo": "KA30X1234", "model": "Honda Activa 6G"},
            ],
            headers: ['vehicleNo', 'model'],
            headerColor: AppColors.primary.withOpacity(.8),
          ),
        ],
      ),
    );
  }
}
