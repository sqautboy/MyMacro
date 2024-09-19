import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManualPage extends StatelessWidget {
  const ManualPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          padding: const EdgeInsets.only(left: 12.0),
          icon: const Icon(Icons.arrow_back, color: Colors.black), // 뒤로가기 아이콘 색상 변경
          onPressed: () => Navigator.of(context).pop(), // 뒤로가기 기능
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Enter Your Diet Option',
              style: GoogleFonts.robotoCondensed(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Text(
              'CARB',
              style: GoogleFonts.robotoCondensed(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.grey[700],
              ),
            ),
            _buildInputField('Enter Carb (g)', TextEditingController()),
            const SizedBox(height: 52),
            Text(
              'PROTEIN',
              style: GoogleFonts.robotoCondensed(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.grey[700],
              ),
            ),
            _buildInputField('Enter Protein (g)', TextEditingController()),
            const SizedBox(height: 52),
            Text(
              'FAT',
              style: GoogleFonts.robotoCondensed(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.grey[700],
              ),
            ),
            _buildInputField('Enter Fat (g)', TextEditingController()),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 100, right: 100),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.robotoCondensed(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.grey[700],
          ),
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
