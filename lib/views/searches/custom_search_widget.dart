import 'package:flutter/material.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';

class CustomSearchWidget extends StatefulWidget {
  const CustomSearchWidget({super.key});

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  String selectedValue = 'By Number';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Chassis or Engine No.",
                    // prefixIcon: Icon(
                    //   Icons.search,
                    //   color: AppColors.primary,
                    // ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mic),
                    ),
                    filled: false,
                    fillColor: AppColors.kLightElevated,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(1),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 1,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    // Implement search logic if needed
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(icon: Icon(Icons.search), onPressed: () {}),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: DropdownButton<String>(
            dropdownColor: Colors.white,
            value: selectedValue, // the current selected item
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: <String>['By Number', 'By Make', 'By Engine', 'By Chassis']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: AppColors.blackTextColor),
                    ),
                  );
                })
                .toList(),
          ),
        ),
      ],
    );
  }
}
