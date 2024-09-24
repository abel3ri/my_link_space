import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_link_space/core/view_models/link_view_model.dart';
import 'package:my_link_space/ui/widgets/custom_app_bar.dart';
import 'package:my_link_space/ui/widgets/r_labeld_circular_indicator.dart';
import 'package:my_link_space/ui/widgets/r_sub_header_text.dart';
import 'package:my_link_space/utils/context_extension.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final linkViewModel = Provider.of<LinkViewModel>(context);

    if (linkViewModel.isLoading) {
      return const RLabeledCircularIndicator(
        label: "Loading Analytics Data",
      );
    } else if (linkViewModel.links.isEmpty) {
      return Scaffold(
        appBar: CustomAppBar(
          context: context,
          title: Text(context.localizations.analytics),
        ),
        body: const Center(
          child: Text("There is no link to analyze!"),
        ),
      );
    }

    List<Map<String, dynamic>> links = linkViewModel.links
        .map((link) => {
              link.title: link.clickCount,
            })
        .toList();

    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text(context.localizations.analytics),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Center(
              child: Text(
                context.localizations.lifeTimeAnalytics,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RAnalyticsCol(
                  color: Colors.blue,
                  label: context.localizations.views,
                  value: const Text("N/A"),
                ),
                RAnalyticsCol(
                  color: Colors.purple,
                  label: context.localizations.clicks,
                  value: const Text("N/A"),
                ),
                RAnalyticsCol(
                  color: Colors.red,
                  label: context.localizations.subscibers,
                  value: const Text("N/A"),
                ),
                RAnalyticsCol(
                  color: Colors.orange,
                  label: context.localizations.revenue,
                  value: const Text("N/A"),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            RSubHeaderText(text: context.localizations.socialIcons),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: SocialLinkPieChart(links: links),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            RSubHeaderText(text: context.localizations.yourPerformance),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            ClicksBarChart(),
          ],
        ),
      ),
    );
  }
}

class SocialLinkPieChart extends StatelessWidget {
  final List<Map<String, dynamic>> links;

  const SocialLinkPieChart({super.key, required this.links});

  // Generate colors for each link only once
  List<Color> _generateColors(int count) {
    Random random = Random();
    return List.generate(count, (_) {
      return Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = _generateColors(links.length);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: PieChart(
            PieChartData(
              sections: _buildPieChartSections(colors),
              centerSpaceRadius: 32,
              sectionsSpace: 1,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        _buildLegend(colors),
      ],
    );
  }

  List<PieChartSectionData> _buildPieChartSections(List<Color> colors) {
    List<PieChartSectionData> sections = [];

    num totalClicks = links.fold(0, (sum, item) => sum + item.values.first);

    for (int i = 0; i < links.length; i++) {
      int clicks = links[i].values.first;

      final double percentage = (clicks / totalClicks) * 100;
      sections.add(
        PieChartSectionData(
          color: colors[i],
          value: clicks.toDouble(),
          title: '${percentage.toStringAsFixed(1)}%',
          radius: 50,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }

    return sections;
  }

  Widget _buildLegend(List<Color> colors) {
    return Wrap(
      spacing: 10,
      children: List.generate(links.length, (index) {
        final String title = links[index].keys.first;
        final Color color = colors[index];
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              FontAwesomeIcons.solidCircle,
              size: 12,
              color: color,
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        );
      }),
    );
  }
}

class RAnalyticsCol extends StatelessWidget {
  const RAnalyticsCol({
    super.key,
    required this.label,
    required this.color,
    required this.value,
  });

  final String label;
  final Color color;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RAnalyticsRow(
          color: color,
          label: label,
        ),
        value,
      ],
    );
  }
}

class RAnalyticsRow extends StatelessWidget {
  const RAnalyticsRow({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.solidCircle,
          size: 8,
          color: color,
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        Text(
          "$label:",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class ClicksBarChart extends StatelessWidget {
  final Map<String, int> clickData = {
    "Daily": 25,
    "Weekly": 22,
    "Monthly": 25,
  };

  ClicksBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(
                show: false,
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 0:
                          return const Text("Daily");
                        case 1:
                          return const Text("Weekly");
                        case 2:
                          return const Text("Monthly");
                        default:
                          return const Text("");
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 5, // Adjust this based on your data range
                    reservedSize: 28,
                    getTitlesWidget: (value, meta) {
                      return Text("${value.toInt()}");
                    },
                  ),
                ),
              ),
              barGroups: _buildBarChartGroups(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        _buildLegend(),
      ],
    );
  }

  List<BarChartGroupData> _buildBarChartGroups() {
    List<Color> colors = [
      _generateRandomColor(),
      _generateRandomColor(),
      _generateRandomColor()
    ];

    return [
      BarChartGroupData(
        x: 0, // For "Daily"
        barRods: [
          BarChartRodData(
            toY: clickData["Daily"]!.toDouble(),
            color: colors[0],
            width: 16,
          )
        ],
      ),
      BarChartGroupData(
        x: 1, // For "Weekly"
        barRods: [
          BarChartRodData(
            toY: clickData["Weekly"]!.toDouble(),
            color: colors[1],
            width: 16,
          )
        ],
      ),
      BarChartGroupData(
        x: 2, // For "Monthly"
        barRods: [
          BarChartRodData(
            toY: clickData["Monthly"]!.toDouble(),
            color: colors[2],
            width: 16,
          )
        ],
      ),
    ];
  }

  Color _generateRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  Widget _buildLegend() {
    return Wrap(
      spacing: 10,
      children: clickData.keys.map((title) {
        final Color color = _generateRandomColor();
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              FontAwesomeIcons.solidCircle,
              size: 12,
              color: color,
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        );
      }).toList(),
    );
  }
}
