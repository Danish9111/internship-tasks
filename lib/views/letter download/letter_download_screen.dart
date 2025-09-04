import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:legal_vehicle_recovery_managment_app/views/custom_appbar.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/custom_search_bar.dart';
import 'package:legal_vehicle_recovery_managment_app/widgets/custom_table.dart';

class LetterDownloadView extends StatefulWidget {
  const LetterDownloadView({super.key});

  @override
  State<LetterDownloadView> createState() => _LetterDownloadViewState();
}

class _LetterDownloadViewState extends State<LetterDownloadView> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> vehicleSearchData = [
      {
        "RegNo": "KA02KR5555",
        "model": "TVS Ntorq 125",
        "Requested On": '15-5-2025',
        "status": TableTextButton(onPressed: () {}),
      },
      {
        "RegNo": "KA03JL8888",
        "model": "KTM Duke 200 BS6",
        "Requested On": '15-5-2025',
        "status": TableTextButton(onPressed: () {}),
      },
      {
        "RegNo": "KA05MN4321",
        "model": "Suzuki Access 125",
        "Requested On": '15-5-2025',
        "status": TableTextButton(onPressed: () {}),
      },
      {
        "RegNo": "KA11EV9999",
        "model": "Royal Enfield Classic 350",
        "Requested On": '15-5-2025',
        "status": TableTextButton(onPressed: () {}),
      },
      {
        "RegNo": "KA22HL5555",
        "model": "Suzuki Burgman Street 125",
        "Requested On": '15-5-2025',
        "status": TableTextButton(onPressed: () {}),
      },
      {
        "RegNo": "KA27TP7777",
        "model": "Jawa Perak",
        "Requested On": '15-5-2025',
        "status": TableTextButton(onPressed: () {}),
      },
      {
        "RegNo": "KA30X1234",
        "model": "Honda Activa 6G",
        "Requested On": '15-5-2025',
        "status": TableTextButton(onPressed: () {}),
      },
    ];
    return Scaffold(
      backgroundColor: AppColors.lightScaffoldBackgroundColor,

      appBar: CustomAppBar(title: 'letter Download'),
      body: Column(
        children: [
          SizedBox(height: 10),
          CustomSearchWidget(hintText: 'Search Letter'),
          SizedBox(height: 10),
          CustomTable(
            //as widths of columns in custom table are adjustable
            columnWidths: [120, 150, 100, 100],
            headerColor: AppColors.primary.withOpacity(.8),
            data: vehicleSearchData,

            headers: ['RegNo', 'model', 'Requested On', 'status'],
          ),
        ],
      ),
    );
  }
}

class TableTextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TableTextButton({
    super.key,
    // required this.text,
    // required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          backgroundColor: Colors.lightBlueAccent.withOpacity(0.1),
          minimumSize: const Size(0, 28), // keeps it small
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onPressed,
        child: Text(
          'Download',
          style: TextStyle(
            fontSize: 12,
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
