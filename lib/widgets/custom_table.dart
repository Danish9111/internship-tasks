import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<Map<String, dynamic>> data; // Each row's data
  final List<String> headers; // Dynamic headers
  final double defaultColumnWidth; // Default width
  final Color headerColor;
  final bool useFlex; // flag: true → flex, false → fixed
  final List<double>? columnWidths; // optional per-column widths

  const CustomTable({
    super.key,
    required this.data,
    required this.headers,
    this.defaultColumnWidth = 170,
    this.headerColor = const Color(0xFF2196F3), // default blue
    this.useFlex = false, // default: fixed widths
    this.columnWidths, // optional: e.g. [2, 1, 1]
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.hardEdge,
              child: Table(
                border: const TableBorder(
                  left: BorderSide.none,
                  right: BorderSide.none,
                  horizontalInside: BorderSide(color: Colors.grey, width: 1),
                ),

                // Dynamically assign column widths
                columnWidths: {
                  for (int i = 0; i < headers.length; i++)
                    i: useFlex
                        ? FlexColumnWidth(
                            columnWidths != null && i < columnWidths!.length
                                ? columnWidths![i]
                                : 1, // default flex = 1
                          )
                        : FixedColumnWidth(
                            columnWidths != null && i < columnWidths!.length
                                ? columnWidths![i]
                                : defaultColumnWidth, // default pixel width
                          ),
                },

                children: [
                  // Header row
                  TableRow(
                    decoration: BoxDecoration(
                      color: headerColor.withOpacity(.8),
                    ),
                    children: headers
                        .map(
                          (title) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),

                  // Data rows
                  ...data.map(
                    (row) => TableRow(
                      children: headers.map((key) {
                        final value = row[key] ?? '';
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: value is Widget
                              ? value // Render directly if it's a widget (Icon, IconButton, etc.)
                              : Text(
                                  value.toString(),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
