import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/views/custom_appbar.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/custom_search_widget.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';

class LoanNumberSearchView extends StatefulWidget {
  const LoanNumberSearchView({super.key});

  @override
  State<LoanNumberSearchView> createState() => _LoanNumberSearchViewState();
}

class _LoanNumberSearchViewState extends State<LoanNumberSearchView> {
  final List<Map<String, String>> loanSearchData = [
    {
      "loanNo": "LN10001",
      "chassisNo": "M",
      "make": "Maruti Swift VXI",
      "engineNo": "D13A567890",
    },
    {
      "loanNo": "LN10002",
      "chassisNo": "MD634KE42L9C78901",
      "make": "Bajaj Pulsar 220F",
      "engineNo": "ENG98765P220",
    },
    {
      "loanNo": "LN10003",
      "chassisNo": "ME4JF508JK1234567",
      "make": "Honda Activa 125",
      "engineNo": "ACTIVAENG123",
    },
    {
      "loanNo": "LN10004",
      "chassisNo": "MD2A18AZ7KC987654",
      "make": "Royal Enfield Meteor",
      "engineNo": "RE350ENG777",
    },
    {
      "loanNo": "LN10005",
      "chassisNo": "MALA851CLJM456789",
      "make": "Hyundai i20 Sportz",
      "engineNo": "KAPPAENG234",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightScaffoldBackgroundColor,

      appBar: CustomAppBar(title: 'Loan Number Search'),
      body: Column(
        children: [
          SizedBox(height: 20),
          CustomSearchWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Loan No.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,

                      'Chassis No.',

                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Vehicle No.',

                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Engine No.',

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
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: loanSearchData.length,
              itemBuilder: (context, index) {
                final vehicle = loanSearchData[index];
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

                        vehicle['loanNo'] ?? '',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,

                        vehicle['make'] ?? '',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,

                        vehicle['engineNo'] ?? '',
                        style: TextStyle(
                          color: AppColors.kDarkElevated,
                          fontWeight: FontWeight.w600,
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
