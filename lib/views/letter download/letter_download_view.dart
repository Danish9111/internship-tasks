import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:legal_vehicle_recovery_managment_app/views/custom_appbar.dart';
import 'package:legal_vehicle_recovery_managment_app/views/description_bar.dart';

class LetterDownloadView extends StatefulWidget {
  const LetterDownloadView({super.key});

  @override
  State<LetterDownloadView> createState() => _LetterDownloadViewState();
}

class _LetterDownloadViewState extends State<LetterDownloadView> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> vehicleSearchData = [
      {"RegNo": "KA02KR5555", "model": "TVS Ntorq 125"},
      {"RegNo": "KA03JL8888", "model": "KTM Duke 200 BS6"},
      {"RegNo": "KA05MN4321", "model": "Suzuki Access 125"},
      {"RegNo": "KA11EV9999", "model": "Royal Enfield Classic 350"},
      {"RegNo": "KA22HL5555", "model": "Suzuki Burgman Street 125"},
      {"RegNo": "KA27TP7777", "model": "Jawa Perak"},
      {"RegNo": "KA30X1234", "model": "Honda Activa 6G"},
    ];
    return Scaffold(
      backgroundColor: AppColors.lightScaffoldBackgroundColor,

      appBar: CustomAppBar(title: 'letter Download'),
      body: Column(
        children: [
          SizedBox(height: 10),
          DescriptionBar(text1: 'Reg#', text2: 'loan No.', text3: 'status'),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,

                          vehicle['RegNo'] ?? '',
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
                      Flexible(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.download,
                            size: 20,
                            color: Colors.lightBlueAccent,
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
