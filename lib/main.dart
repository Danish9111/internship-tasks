import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:legal_vehicle_recovery_managment_app/views/auth%20views/login_view.dart';
import 'package:legal_vehicle_recovery_managment_app/views/auth%20views/signup_view.dart';
import 'package:legal_vehicle_recovery_managment_app/views/dashboard%20screen/dashboard_screen.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/chassis%20search%20screen/chassis_search_screen.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/camer%20search%20sceen/camera_search_screen.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/vehicle%20search%20screen/vehicle_search_screen.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/loan%20number%20search%20screen/loan_number_search_screen.dart';
import 'package:legal_vehicle_recovery_managment_app/views/letter%20download/letter_download_screen.dart';
// import 'package:legal_vehicle_recovery_managment_app/views/sync%20status%20view/sync_status.dart';
import 'package:legal_vehicle_recovery_managment_app/views/vehicle_details_screen.dart';
import 'package:legal_vehicle_recovery_managment_app/search_bar_settings.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // 🔥 Only in debug/profile
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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
        GetPage(name: '/sync-status', page: () => const VehicleDetailsPage()),

        GetPage(
          name: '/chassis-search',
          page: () => const ChassisOrEngineNoSearchView(),
        ),
        GetPage(name: '/dashboard', page: () => const DashboardView()),
        GetPage(name: '/settings', page: () => const SettingsPage()),
        // Add other routes here
      ],
    );
  }
}
