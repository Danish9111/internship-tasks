import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:legal_vehicle_recovery_managment_app/views/custom_appbar.dart';

class SyncStatusView extends StatefulWidget {
  const SyncStatusView({super.key});

  @override
  State<SyncStatusView> createState() => _SyncStatusViewState();
}

class _SyncStatusViewState extends State<SyncStatusView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightScaffoldBackgroundColor,
      appBar: CustomAppBar(title: 'Sync Status'),
      body: Center(child: Text('Sync Status View')),
    );
  }
}
