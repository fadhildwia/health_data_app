import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_data_app/Components/Reusable_Bg.dart';
import 'package:health_data_app/components/bottomContainer_bottom.dart';
import 'package:health_data_app/constants.dart';

class ProfilePage extends StatelessWidget {
  final String resultText;
  final String bmi;
  final String advise;
  final Color textColor;
  final String height;
  final String weight;
  final String bodyFat;
  final String muscleMass;
  final String visceralFat;
  final String basalMetabolism;
  final String selectedGender;
  final String selectedDate;

  ProfilePage({
    required this.textColor,
    required this.resultText,
    required this.bmi,
    required this.advise,
    required this.height,
    required this.weight,
    required this.bodyFat,
    required this.muscleMass,
    required this.visceralFat,
    required this.basalMetabolism,
    required this.selectedGender,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('PROFILE'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Your Profile',
                style: ktitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableBg(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: int.parse(height) > 0,
                    child: Text(
                      'Height: $height cm',
                      style: kBodyTextStyle,
                    ),
                  ),
                  Visibility(
                    visible: int.parse(weight) > 0,
                    child: Text(
                      'Weight: $weight kg',
                      style: kBodyTextStyle,
                    ),
                  ),
                  Visibility(
                    visible: int.parse(bodyFat) > 0,
                    child: Text(
                      'Body Fat: $bodyFat %',
                      style: kBodyTextStyle,
                    ),
                  ),
                  Visibility(
                    visible: int.parse(muscleMass) > 0,
                    child: Text(
                      'Muscle Mass: $muscleMass kg',
                      style: kBodyTextStyle,
                    ),
                  ),
                  Visibility(
                    visible: int.parse(visceralFat) > 0,
                    child: Text(
                      'Visceral Fat: $visceralFat',
                      style: kBodyTextStyle,
                    ),
                  ),
                  Visibility(
                    visible: int.parse(basalMetabolism) > 0,
                    child: Text(
                      ' Basal Metabolism: $basalMetabolism kcal',
                      style: kBodyTextStyle,
                    ),
                  ),
                  Text(
                    resultText,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi,
                    style: kBMITextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Table(
                      border: TableBorder.all(),
                      children: const [
                        // Header Row
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Category',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'BMI Range',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        // Row for Underweight
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Underweight'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Less than 18.5'),
                            ),
                          ],
                        ),
                        // Row for Normal
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Normal'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('18.5 - 22.9'),
                            ),
                          ],
                        ),
                        // Row for Overweight
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Overweight'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('23.0 - 24.9'),
                            ),
                          ],
                        ),
                        // Row for Obesity
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Obesity'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('25.0 and above'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
