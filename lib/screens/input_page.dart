import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_data_app/components/bottomContainer_bottom.dart';
import 'package:health_data_app/components/reusable_bg.dart';
import 'package:health_data_app/screens/form_page.dart';
import 'package:intl/intl.dart';
import '../Components/Icon_Content.dart';
import '../constants.dart';
// import 'Results_Page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  late String selectedGender = 'male';
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        )) ??
        selectedDate!;
    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('DATA'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'male';
                      });
                    },
                    child: ReusableBg(
                      colour: selectedGender == 'male'
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      cardChild: IconContent(
                          myicon: FontAwesomeIcons.mars, text: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'female';
                      });
                    },
                    child: ReusableBg(
                      colour: selectedGender == 'female'
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      cardChild: IconContent(
                          myicon: FontAwesomeIcons.venus, text: 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableBg(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Date of Birth',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    selectedDate == null
                        ? 'Choose date of birth'
                        : DateFormat('dd MMMM yyyy').format(selectedDate!),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      'CHOOSE',
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
            text: 'NEXT',
            onTap: () {
              var date = DateFormat('dd MMMM yyyy').format(selectedDate!);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormPage(
                      selectedGender: selectedGender, selectedDate: date),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
