import 'package:flutter/material.dart';

import 'gender.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DateOfBirthSelector(),
//     );
//   }
// }

class DateOfBirthSelector extends StatefulWidget {
  @override
  _DateOfBirthSelectorState createState() => _DateOfBirthSelectorState();
}

class _DateOfBirthSelectorState extends State<DateOfBirthSelector> {
  int _selectedDay = 1;
  int _selectedMonth = 1;
  int _selectedYear = 2000;

  List<int> _days = List<int>.generate(31, (index) => index + 1);
  List<String> _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  List<int> _years = List<int>.generate(100, (index) => 2023 - index);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
                  SizedBox(width: 80,),
                  Text('Create account',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 75,),
              Text("What's your date of birth?",style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold),),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Day Wheel
                  _buildWheel(
                    items: _days.map((day) => day.toString()).toList(),
                    selectedItem: _selectedDay.toString(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDay = int.parse(value);
                      });
                    },
                  ),
                  // Month Wheel
                  _buildWheel(
                    items: _months,
                    selectedItem: _months[_selectedMonth - 1],
                    onChanged: (value) {
                      setState(() {
                        _selectedMonth = _months.indexOf(value) + 1;
                      });
                    },
                  ),
                  // Year Wheel
                  _buildWheel(
                    items: _years.reversed.map((year) => year.toString()).toList(),
                    selectedItem: _selectedYear.toString(),
                    onChanged: (value) {
                      setState(() {
                        _selectedYear = int.parse(value);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 70,),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (Context)=> genderSelector()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWheel({
    required List<String> items,
    required String selectedItem,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      height: 170,
      width: 85,
      child: Stack(
          children :[
            Center(
              child: Column(
                children: [
                  SizedBox(height: 42,),
                  Container(
                    height: 3.5,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                  SizedBox(height: 58,),
                  Container(
                    height: 3.5,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                ],
              ),
            ),
            ListWheelScrollView(
              itemExtent: 85,
              physics: FixedExtentScrollPhysics(),
              children: List<Widget>.generate(items.length, (index) {
                final item = items[index];
                final fontWeight = item == selectedItem ? FontWeight.bold : FontWeight.normal;
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18,bottom: 18),
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 19,color: Colors.white,fontWeight:fontWeight),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onSelectedItemChanged: (index) {
                onChanged(items[index]);
              },
              squeeze: 1.4,
              diameterRatio: 2.0,
              offAxisFraction: -1.0,
              perspective: 0.001,
            ),

          ]
      ),
    );
  }
}

