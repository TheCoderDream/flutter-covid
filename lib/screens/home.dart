import 'package:covid/config/palette.dart';
import 'package:covid/config/styles.dart';
import 'package:covid/data.dart';
import 'package:covid/widgets/c-app-bar.dart';
import 'package:covid/widgets/drop-down.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCountry = 'USA';

  void setSelectedCountry(String? country) {
    setState(() {
      selectedCountry = country ?? 'USA';
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CAppBar(),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTest(screenHeight)
        ],
      ),
    );
  }
  
  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text(
                  'COVID-19',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
                CDropDown(
                    countries: const ['CN', 'FR', 'IN', 'IT', 'UK', 'USA'],
                    country: selectedCountry,
                    onChanged: setSelectedCountry
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.03,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Are you feeling sick?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01,),
                const Text(
                  'If you feel sick with any COVID-19 symptoms, please call or text us immediately for help',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20
                        ),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                      icon: Icon(Icons.phone, color: Colors.white,),
                      onPressed: () {},
                      label: Text('Call Now', style: Styles.buttonTextStyle,),
                    ),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20
                          ),
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                      icon: Icon(Icons.sms, color: Colors.white,),
                      onPressed: () {},
                      label: Text('Send SMS', style: Styles.buttonTextStyle),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Prevention Tips',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                 color: Colors.black
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _getPreventionTips(screenHeight)
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getPreventionTips(double screenHeight) {
    return prevention.map((e) =>
        Column(
          children: [
            Image.asset(
              e.keys.first,
              height: screenHeight * 0.12,
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              e.values.first,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            )
          ],
        )
    ).toList();
  }
  
  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
        ),
        padding: const EdgeInsets.all(10),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor]
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/own_test.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(
                  'Do your own test!',
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: screenHeight * 0.01,),
                const Text(
                  'Follow the instructions\nto do your own test.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0
                  ),
                  maxLines: 2,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
