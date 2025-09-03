import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/views/custom_appbar.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/custom_search_bar.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:legal_vehicle_recovery_managment_app/widgets/custom_table.dart';

class LoanNumberSearchView extends StatefulWidget {
  const LoanNumberSearchView({super.key});

  @override
  State<LoanNumberSearchView> createState() => _LoanNumberSearchViewState();
}

class _LoanNumberSearchViewState extends State<LoanNumberSearchView> {
  final List<Map<String, String>> loanSearchData = [
    {
      "loanNo": "LN10001",
      "chassisNo": "MD634KE42L9C78901",
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
          CustomSearchWidget(hintText: 'Loan Number'),

          SizedBox(height: 10),
          CustomTable(
            columnWidths: [80],
            headerColor: AppColors.primary.withOpacity(.8),
            data: loanSearchData,
            headers: ['loanNo', 'chassisNo', 'make', 'engineNo'],
          ),
        ],
      ),
    );
  }
}
