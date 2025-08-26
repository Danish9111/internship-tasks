import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:legal_vehicle_recovery_managment_app/views/searches/chassis%20search%20view/engine_search_view.dart';
import 'package:legal_vehicle_recovery_managment_app/widgets/custom_button.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  bool hasDataChanged = true; // TODO: Replace with API state
  int totalCases = 500; // TODO: Fetch from backend

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
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary.withValues(alpha: 0.8),
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HeaderAsAppBar(text: "Dashboard"),
              SizedBox(height: 10),
              // CASES INFO CARD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  color: AppColors.kLightElevated,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "No. of Cases Uploaded",
                          style: TextStyle(
                            color: AppColors.blackTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "$totalCases",
                          style: const TextStyle(
                            color: AppColors.blackTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // GRID BUTTONS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.2,
                  children: [
                    _DashboardTile(
                      title: "Vehicle Search",
                      icon: Icons.directions_car,
                      onTap: () => Get.toNamed("/vehicle-search"),
                    ),
                    _DashboardTile(
                      title: "Chassis/Engine No",
                      icon: Icons.confirmation_number,
                      onTap: () {
                        Get.to(() => ChassisOrEngineNoSearchView());
                      },
                    ),
                    _DashboardTile(
                      title: "Camera Search",
                      icon: Icons.camera_alt,
                      onTap: () => Get.toNamed("/camera-search"),
                    ),
                    _DashboardTile(
                      title: "Letter Download",
                      icon: Icons.download,
                      onTap: () => Get.toNamed("/letter-download"),
                    ),
                    _DashboardTile(
                      title: "Loan Number Search",
                      icon: Icons.numbers,
                      onTap: () => Get.toNamed("/loan-number-search"),
                    ),
                    _DashboardTile(
                      title: "Sync Status",
                      icon: hasDataChanged ? Icons.sync : Icons.sync_disabled,
                      color: hasDataChanged ? Colors.green : Colors.red,
                      onTap: () =>
                          Get.toNamed("/sync-status"), // maybe show details
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // SYNC BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomElevatedButton(
                  text: "Sync Data",
                  color: hasDataChanged ? Colors.green : Colors.red,
                  onTap: () {
                    setState(() {
                      // TODO: Implement sync function
                      hasDataChanged = !hasDataChanged; // just toggle for demo
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class HeaderAsAppBar extends StatelessWidget {
//   final String text;
//   final bool isbackicon;
//   const HeaderAsAppBar({
//     super.key,
//     required this.text,
//     this.isbackicon = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: AppColors.primary.withValues(alpha: 0.8),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//       ),
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: isbackicon
//                   ? Align(
//                       alignment: AlignmentGeometry.centerLeft,
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.back();
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 5),
//                           child: Icon(Icons.arrow_back, color: Colors.white),
//                         ),
//                       ),
//                     )
//                   : SizedBox(),
//             ),

//             Text(
//               textAlign: TextAlign.center,
//               text,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24,
//               ),
//             ),
//             Expanded(child: SizedBox()),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _DashboardTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const _DashboardTile({
    required this.title,
    required this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kLightElevated,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color ?? AppColors.primary),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.blackTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
