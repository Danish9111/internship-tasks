import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/views/custom_appbar.dart';

class VehicleDetailsPage extends StatelessWidget {
  const VehicleDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy backend data
    final vehicleData = {
      "Registration No.": "KA44W2168",
      "Model": "Swift Dzire",
      "Chassis No.": "CH123456",
      "Engine No.": "EN987654",
      "Allocation": "Allocated",
      "Agreement ID": "AGR56789",
      "Username": "John Doe",
      "EMI Amount": "12,500",
      "POS": "POS123",
      "Total": "4,50,000",
      "CBC Charges": "500",
      "Brackets": "2",
      "Bank": "HDFC Bank",
      "Product Name": "Car Loan",
      "Address": "MG Road, Bangalore",
      "Confirmer No.": "+91 9876543210",
    };
    return Scaffold(
      backgroundColor: AppColors.lightScaffoldBackgroundColor,
      appBar: CustomAppBar(title: 'Vehicle Details'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vehicle details card
            Card(
              elevation: 2,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "Vehicle Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...vehicleData.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Text(
                                entry.key,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const Text(": "),
                            Expanded(child: Text(entry.value.toString())),
                            if (entry.key == "Agreement ID")
                              IconButton(
                                onPressed: () {
                                  // Copy Loan Number
                                },
                                icon: const Icon(Icons.copy, size: 20),
                                tooltip: "Copy Loan Number",
                              ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Input section
            const Text(
              "Location Details",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Enter Station Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.grey, // default border color
                    width: 1.2,
                  ),
                ),

                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(20),
                //   borderSide: const BorderSide(
                //     color: Colors.grey, // shown when not focused
                //     width: 1.2,
                //   ),
                // ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: AppColors.primary, // shown when focused
                    width: 1.5,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),

            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Enter City Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: AppColors.primary, // shown when focused
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Enter Pincode",
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(20),
                // ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: AppColors.primary, // shown when focused
                    width: 1.5,
                  ),
                ),

                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16),
            LetterActions(
              onSelectLetter: () => print("Select letter tapped"),
              onRequestLetter: () => print("Request letter tapped"),
              onShareWhatsapp: () => print("Share via WhatsApp"),
              onCallConfirmer: () => print("Call confirmer"),
            ),
          ],
        ),
      ),
    );
  }
}

class LetterActions extends StatelessWidget {
  final VoidCallback onSelectLetter;
  final VoidCallback onRequestLetter;
  final VoidCallback onShareWhatsapp;
  final VoidCallback onCallConfirmer;

  const LetterActions({
    super.key,
    required this.onSelectLetter,
    required this.onRequestLetter,
    required this.onShareWhatsapp,
    required this.onCallConfirmer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row: Select Letter + Request Letter
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: ElevatedButton(
                onPressed: onRequestLetter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  "Request Letter",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(Icons.attach_file, color: Colors.grey),
              ),
            ),
            // const SizedBox(width: 12),
          ],
        ),

        const SizedBox(height: 20),
        Divider(),
        const SizedBox(height: 20),

        // Row: WhatsApp + Call
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onShareWhatsapp,

                icon: const Icon(Icons.share, size: 18),
                label: const Text("Share on WhatsApp"),
                style: ElevatedButton.styleFrom(
                  // backgroundColor: const Color(0xFF25D366),
                  foregroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onCallConfirmer,
                icon: const Icon(Icons.call, size: 20),
                label: const Text("Call Confirmer"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary.withOpacity(.7),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
