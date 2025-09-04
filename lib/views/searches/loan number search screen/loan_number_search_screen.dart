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
      "Loan No.": "LN10001",
      "Chassis No.": "MD634KE42L9C78901",
      "Make": "Maruti Swift VXI",
      "Engine No.": "D13A567890",
    },
    {
      "Loan No.": "LN10002",
      "Chassis No.": "MD634KE42L9C78901",
      "Make": "Bajaj Pulsar 220F",
      "Engine No.": "ENG98765P220",
    },
    {
      "Loan No.": "LN10003",
      "chassisNo": "ME4JF508JK1234567",
      "Make": "Honda Activa 125",
      "Engine No.": "ACTIVAENG123",
    },
    {
      "Loan No.": "LN10004",
      "Chassis No.": "MD2A18AZ7KC987654",
      "Make": "Royal Enfield Meteor",
      "Engine No.": "RE350ENG777",
    },
    {
      "Loan No.": "LN10005",
      "Chassis No.": "MALA851CLJM456789",
      "Make": "Hyundai i20 Sportz",
      "Engine No.": "KAPPAENG234",
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
            //customize as needed
            columnWidths: [80, 100, 100, 100],
            headerColor: AppColors.primary.withOpacity(.8),
            data: loanSearchData,
            //header name should match keys in maps above or data may disapear from table
            headers: ['Loan No.', 'Chassis No.', 'Make', 'Engine No.'],
          ),
        ],
      ),
    );
  }
}
