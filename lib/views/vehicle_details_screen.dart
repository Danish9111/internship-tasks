import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:legal_vehicle_recovery_managment_app/views/custom_appbar.dart';
import 'package:flutter/services.dart';

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

      //added as by myself as client focused on Loan ,Vehicle No copy buttons
      "Loan No.": "LN10001",
      "Vehicle No.": "VH2023001",

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
      appBar: const CustomAppBar(title: 'Vehicle Details'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VehicleDetailsCard(vehicleData: vehicleData),
            const SizedBox(height: 24),
            const LocationInputSection(),
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

class VehicleDetailsCard extends StatelessWidget {
  final Map<String, String> vehicleData;
  const VehicleDetailsCard({super.key, required this.vehicleData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
            ...vehicleData.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 20,
                      child: Text(
                        entry.key,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Text(": "),
                    Expanded(child: Text(entry.value)),
                    if (entry.key == "Loan No.")
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: entry.value));
                          showAppSnackBar(context, "Loan Number copied!");
                        },
                        icon: const Icon(
                          Icons.copy,
                          size: 20,
                          color: Colors.blue,
                        ),
                        tooltip: "Copy Loan Number",
                      ),
                    if (entry.key == 'Vehicle No.')
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: entry.value));
                          showAppSnackBar(context, "Vehicle Number copied!");
                        },
                        icon: const Icon(
                          Icons.copy,
                          size: 20,
                          color: Colors.blue,
                        ),
                        tooltip: "Copy Loan Number",
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showAppSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: const TextStyle(fontSize: 14)),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      duration: const Duration(seconds: 2),
    ),
  );
}

class LocationInputSection extends StatelessWidget {
  const LocationInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Location Details",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 12),
        CustomTextField(label: "Enter Station Name"),
        const SizedBox(height: 12),
        CustomTextField(label: "Enter City Name"),
        const SizedBox(height: 12),
        CustomTextField(
          label: "Enter Pincode",
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  const CustomTextField({super.key, required this.label, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
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
        // Row: Request Letter + Select Letter
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
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: CircleIconButton(
                icon: Icons.attach_file,
                onTap: onSelectLetter,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),
        const Divider(),
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

class CircleIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const CircleIconButton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 2,
      child: InkWell(
        customBorder: const CircleBorder(),
        splashColor: Colors.grey.withOpacity(0.3),
        onTap: onTap,
        child: SizedBox(
          height: 50,
          width: 50,
          child: Icon(icon, color: Colors.grey),
        ),
      ),
    );
  }
}
