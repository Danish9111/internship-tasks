import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:legal_vehicle_recovery_managment_app/views/auth%20views/login_view.dart';
import 'package:legal_vehicle_recovery_managment_app/views/auth%20views/signup_view.dart';
import 'package:legal_vehicle_recovery_managment_app/views/dashboard view/dashboard_view.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/chassis search view/engine_search_view.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/camera search view/camera_search_view.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/vehicle search view/vehicle_search_view.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/loan number search view/loan_number_search_view.dart';
import 'package:legal_vehicle_recovery_managment_app/views/letter download/letter_download_view.dart';
import 'package:legal_vehicle_recovery_managment_app/views/sync%20status%20view/sync_status.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.kDarkElevated,
          labelStyle: const TextStyle(color: AppColors.kGrey),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      initialRoute: '/register',
      getPages: [
        GetPage(name: '/login', page: () => const LoginView()),
        GetPage(name: '/register', page: () => const RegisterView()),
        GetPage(name: '/vehicle-search', page: () => const VehicleSearchView()),
        GetPage(name: '/camera-search', page: () => const CameraSearchView()),
        GetPage(
          name: '/loan-number-search',
          page: () => const LoanNumberSearchView(),
        ),
        GetPage(
          name: '/letter-download',
          page: () => const LetterDownloadView(),
        ),
        GetPage(name: '/sync-status', page: () => const SyncStatusView()),

        GetPage(
          name: '/chassis-search',
          page: () => const ChassisOrEngineNoSearchView(),
        ),
        GetPage(name: '/dashboard', page: () => const DashboardView()),
        // Add other routes here
      ],
    );
  }
}
