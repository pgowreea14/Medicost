import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medicalapp/screens/reminder/colo_extension.dart';
import 'package:medicalapp/screens/reminder/round_button.dart';

class SleepAddAlarmView extends StatefulWidget {
  final DateTime date;
  const SleepAddAlarmView({super.key, required this.date});

  @override
  State<SleepAddAlarmView> createState() => _SleepAddAlarmViewState();
}

class _SleepAddAlarmViewState extends State<SleepAddAlarmView> {
  bool positive = false;
  bool repeat = false;

  final TextEditingController medicineController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();
  DateTime selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TColor.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Add Reminder",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.more_vert,
                size: 24,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(20),
              height: media.width * 0.4,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  TColor.primaryColor2.withOpacity(0.4),
                  TColor.primaryColor1.withOpacity(0.4)
                ]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          "Add Your reminders\neach day",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 110,
                          height: 35,
                          child: RoundButton(
                            title: "Learn More",
                            fontSize: 12,
                            onPressed: () {},
                          ),
                        ),
                      ]),
                  Image.asset(
                    "assets/images/progress_each_photo.png",
                    width: media.width * 0.35,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Medicine input field with camera icon
            _buildTextFieldWithIcon(
              header: "Medicine",
              controller: medicineController,
              icon: Icons.camera_alt,
              onIconPressed: () {
                // Implement camera functionality
              },
            ),
            const SizedBox(height: 10),
            // Dosage input field
            _buildTextField(
              header: "Dosage",
              controller: dosageController,
            ),
            const SizedBox(height: 10),
            // Time input field
            _buildDateTimePicker(
              header: "Time",
              selectedDateTime: selectedDateTime,
              onDateTimeChanged: (DateTime dateTime) {
                setState(() {
                  selectedDateTime = dateTime;
                });
              },
            ),
            const SizedBox(height: 10),
            // Repeat toggle
            _buildRepeatToggle(
              header: "Repeat",
              value: repeat,
              onChanged: (bool value) {
                setState(() {
                  repeat = value;
                });
              },
            ),
            const Spacer(),
            RoundButton(title: "Add", onPressed: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon({
    required String header,
    required TextEditingController controller,
    required IconData icon,
    required VoidCallback onIconPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Set background color to white
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hintText: header,
                    hintStyle: const TextStyle(
                        color: Colors.grey), // Optional: adjust hint text color
                  ),
                ),
              ),
              IconButton(
                icon: Icon(icon),
                onPressed: onIconPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String header,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Set background color to white
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateTimePicker({
    required String header,
    required DateTime selectedDateTime,
    required ValueChanged<DateTime> onDateTimeChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Set background color to white
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              hintText: "${selectedDateTime.toLocal()}".split(' ')[0] +
                  ' ${TimeOfDay.fromDateTime(selectedDateTime).format(context)}',
            ),
            onTap: () async {
              DateTime? dateTime = await showDatePicker(
                context: context,
                initialDate: selectedDateTime,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (dateTime != null && dateTime != selectedDateTime) {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(selectedDateTime),
                );
                if (time != null) {
                  setState(() {
                    selectedDateTime = DateTime(
                      dateTime.year,
                      dateTime.month,
                      dateTime.day,
                      time.hour,
                      time.minute,
                    );
                    onDateTimeChanged(selectedDateTime);
                  });
                }
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRepeatToggle({
    required String header,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Text(
                value ? "Repeat Enabled" : "Repeat Disabled",
                style: TextStyle(
                  color: TColor.black,
                ),
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ],
    );
  }
}
