import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:get/state_manager.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:get/get.dart';

class CustomSearchWidget extends StatefulWidget {
  final String? hintText;

  const CustomSearchWidget({super.key, required this.hintText});

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
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: AppColors.kLightElevated,

                    border: Border.all(color: Colors.black87),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(),
                          inputFormatters: [FourDigitFormatter()],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: widget.hintText,
                            hintStyle: TextStyle(color: AppColors.kGrey),

                            filled: false,
                            fillColor: AppColors.kLightElevated,
                          ),
                          onChanged: (value) {
                            // Implement search logic if needed
                          },
                        ),
                      ),
                      SizedBox(width: 4),

                      ///between two fields
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                Get.toNamed('/settings');
                              },
                              icon: Icon(Icons.settings, color: Colors.grey),
                            ),
                            filled: false,
                            fillColor: AppColors.kLightElevated,
                            hintText: 'ABCD',
                            hintStyle: TextStyle(color: Colors.grey),
                            // enabledBorder: OutlineInputBorder(
                          ),

                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(width: 10),
              // Expanded(
              //   flex: 1,
              //   child: Container(
              //     height: 50,
              //     decoration: BoxDecoration(
              //       color: Colors.green,

              //       borderRadius: BorderRadius.all(Radius.circular(10)),
              //     ),
              //     child: IconButton(
              //       icon: Icon(Icons.search, color: Colors.white),
              //       onPressed: () {},
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(height: 20),

        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //   child: DropdownButton<String>(
        //     dropdownColor: Colors.white,
        //     value: selectedValue, // the current selected item
        //     onChanged: (String? newValue) {
        //       setState(() {
        //         selectedValue = newValue!;
        //       });
        //     },
        //     items: <String>['By Number', 'By Make', 'By Engine', 'By Chassis']
        //         .map<DropdownMenuItem<String>>((String value) {
        //           return DropdownMenuItem<String>(
        //             value: value,
        //             child: Text(
        //               value,
        //               style: TextStyle(color: AppColors.blackTextColor),
        //             ),
        //           );
        //         })
        //         .toList(),
        //   ),
        // ),
      ],
    );
  }
}

class FourDigitFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    if (newText.length > 4) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    return newValue;
  }
}
