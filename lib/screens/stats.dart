import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covid/config/palette.dart';
import 'package:covid/config/styles.dart';
import 'package:covid/data.dart';
import 'package:covid/widgets/c-app-bar.dart';
import 'package:covid/widgets/covid-bar-chart.dart';
import 'package:covid/widgets/stats-grid.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(),
          _buildRegionTabBar(),
          _buildStatsTabBar(),
          const SliverPadding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: StatsGrid(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: CovidBarChart(
                covidCases: covidUSADailyNewCases
              ),
            ),
          )
        ],
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25)
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40,
              indicatorColor: Colors.white
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [
              Text('My Country'),
              Text('Global')
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: const [
              Text('Total'),
              Text('Today'),
              Text('Yesterday')
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }
}
