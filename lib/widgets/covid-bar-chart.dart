import 'package:flutter/material.dart';

class CovidBarChart extends StatelessWidget {
  final List<double> covidCases;
  const CovidBarChart({Key? key, required this.covidCases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Daily New Cases',
              style:  TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}
