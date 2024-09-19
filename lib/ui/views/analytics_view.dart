import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_link_space/ui/widgets/custom_app_bar.dart';
import 'package:my_link_space/ui/widgets/r_sub_header_text.dart';
import 'package:my_link_space/utils/context_extension.dart';

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, int> linkClicks = {
      'Facebook': 50,
      'Twitter': 30,
      'Instagram': 20,
      'Linkedin': 32,
    };

    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text(context.localizations.analytics),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                ),
                RAnalyticsCol(
                  color: Colors.purple,
                  label: context.localizations.clicks,
                ),
                RAnalyticsCol(
                  color: Colors.red,
                  label: context.localizations.subscibers,
                ),
                RAnalyticsCol(
                  color: Colors.orange,
                  label: context.localizations.revenue,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            RSubHeaderText(text: context.localizations.socialIcons),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            SizedBox(
              height: 200,
              child: SocialLinkPieChart(linkClicks: linkClicks),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialLinkPieChart extends StatelessWidget {
  final Map<String, int> linkClicks;
  final List<Color> colors = [
    Colors.orange,
    Colors.red,
    Colors.purple,
    Colors.blue,
  ];

  SocialLinkPieChart({required this.linkClicks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: PieChart(
            PieChartData(
              sections: _buildPieChartSections(),
              centerSpaceRadius: 32,
              sectionsSpace: 1,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        _buildLegend(),
      ],
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    List<PieChartSectionData> sections = [];
    int totalClicks = linkClicks.values.reduce((a, b) => a + b);

    int colorIndex = 0;

    linkClicks.forEach((link, clicks) {
      final double percentage = (clicks / totalClicks) * 100;
      sections.add(
        PieChartSectionData(
          color: colors[colorIndex % colors.length],
          value: clicks.toDouble(),
          title: '${percentage.toStringAsFixed(1)}%',
          radius: 50,
          titleStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
      colorIndex++;
    });

    return sections;
  }

  Widget _buildLegend() {
    int colorIndex = 0;
    return Wrap(
      spacing: 10,
      // runSpacing: 10,
      children: linkClicks.keys.map((link) {
        final color = colors[colorIndex % colors.length];
        colorIndex++;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              FontAwesomeIcons.solidCircle,
              size: 12,
              color: color,
            ),
            SizedBox(width: 4),
            Text(
              link,
              style: TextStyle(fontSize: 12),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class RAnalyticsCol extends StatelessWidget {
  const RAnalyticsCol({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RAnalyticsRow(
          color: color,
          label: label,
        ),
        Text("N/A"),
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
