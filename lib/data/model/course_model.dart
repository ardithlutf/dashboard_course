import 'dart:ui';

class DashboardCard {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double percent;
  final String backImage;
  final Color color;

  DashboardCard({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.percent,
    required this.backImage,
    required this.color,
  });
}
