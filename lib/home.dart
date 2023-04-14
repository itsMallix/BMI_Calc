import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'login.dart';
import 'db.dart';

class homePage extends StatelessWidget {
  TextEditingController _beratController = TextEditingController();
  TextEditingController _tinggiController = TextEditingController();
  //###############################################################

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0x0ff8653F7),
        title: Text('Hello $myUname'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BMICalc(),
    );
  }
}

class BMICalc extends StatefulWidget {
  @override
  State<BMICalc> createState() => _BMICalcState();
}

class _BMICalcState extends State<BMICalc> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiSum = 0;

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;
    setState(() {
      _bmiSum = weight / ((height / 100) * (height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            //KEY bial perlu
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  'KALKUALTOR BMI',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0x0ff242424),
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  //validator
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Berat Badan'),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  //validator
                  keyboardType: TextInputType.number,
                  controller: _heightController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Tinggi Badan'),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Hasil : ${_bmiSum.toStringAsFixed(2)}",
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _calculateBMI,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0x0ffF86366),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('Hitung'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
