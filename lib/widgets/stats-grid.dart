import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStatCard('Total Cases', '1.81 M', Colors.orange),
                _buildStatCard('Deaths', '105 K', Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard('Recovered', '391 K', Colors.green),
                _buildStatCard('Active', '1.31 M', Colors.lightBlue),
                _buildStatCard('Critical', 'N/A', Colors.purple),
              ],
            ),
          )
        ],
      ),
    );
  }
  
  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
