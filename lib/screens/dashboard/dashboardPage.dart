import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalapp/constants/constants.dart';
import 'package:medicalapp/model/contrastMode.dart';
import 'package:medicalapp/screens/reminder/sleep_schedule_view.dart';
import 'package:medicalapp/utils/appBar_utils.dart';
import 'package:provider/provider.dart';

import '../../components/new/CategoryCard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final fontStyle = Provider.of<FontStyleProvider>(context).getTextStyle();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 253, 251),
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: ResponsiveContainer(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dashboard",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 24,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the detail page when a card is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SleepScheduleView(),
                      ),
                    );
                  },
                  child: CategoryCard(
                    category: categoryList[index],
                  ),
                );
              },
              itemCount: categoryList.length,
            ),
          ],
        ),
      ),
    );
  }
}

class ResponsiveContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xff92A3FD),
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: BoxConstraints(
        minHeight: 100.0, // Set the minimum height here
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              maxLines: null, // Allows the TextField to grow vertically
              minLines: 1, // Minimum height when there is no text
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(
                    255, 255, 255, 255), // Change background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: Colors.green), // Change border color
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Colors.green), // Border color when enabled
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Colors.yellow), // Border color when focused
                ),
                hintText: 'Hello, Patient',
                prefixIcon: AvatarGlow(
                  animate: true,
                  glowColor: Color.fromARGB(255, 228, 231, 38),
                  duration: const Duration(milliseconds: 2000),
                  repeat: true,
                  child: IconButton(
                    icon: Icon(true ? Icons.mic : Icons.mic_none),
                    onPressed: () {
                      // Your mic button action
                    },
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.send,
                    size: 18,
                  ),
                  onPressed: () {
                    // Your send button action
                  },
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            width: 0.5,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Center(
              child: Text(
                "SEND ALERT",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
