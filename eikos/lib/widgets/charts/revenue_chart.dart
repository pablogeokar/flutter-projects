import 'package:eikos/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class RevenueChart extends StatelessWidget {
  const RevenueChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        // color: const Color(
        //   0xFFE6F0F9,
        // ), // Fundo azul claro ajustado para a tonalidade da imagem
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Revenue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A202C),
                ),
              ),
              Text(
                'Last 7 days VS prior week',
                style: TextStyle(fontSize: 12, color: Color(0xFF4A5568)),
              ),
            ],
          ),

          const SizedBox(height: 5),

          // Chart
          Expanded(child: _buildChart()),
        ],
      ),
    );
  }

  Widget _buildChart() {
    final List<RevenueData> currentWeekData = [
      RevenueData(DateTime(2024, 2, 14), 15000),
      RevenueData(DateTime(2024, 2, 15), 11000),
      RevenueData(DateTime(2024, 2, 16), 16000),
      RevenueData(DateTime(2024, 2, 17), 15000),
      RevenueData(DateTime(2024, 2, 18), 18200),
      RevenueData(DateTime(2024, 2, 19), 17000),
      RevenueData(DateTime(2024, 2, 20), 15500),
    ];

    final List<RevenueData> previousWeekData = [
      RevenueData(DateTime(2024, 2, 7), 14000),
      RevenueData(DateTime(2024, 2, 8), 15000),
      RevenueData(DateTime(2024, 2, 9), 15800),
      RevenueData(DateTime(2024, 2, 10), 16500),
      RevenueData(DateTime(2024, 2, 11), 17000),
      RevenueData(DateTime(2024, 2, 12), 17500),
      RevenueData(DateTime(2024, 2, 13), 16000),
    ];

    return SfCartesianChart(
      margin: const EdgeInsets.all(0),
      plotAreaBorderWidth: 0,
      backgroundColor: Colors.transparent,
      // backgroundColor: const Color(
      //   0xFFE6F0F9,
      // ), // Mesmo fundo azul claro ajustado
      legend: Legend(isVisible: false),
      trackballBehavior: TrackballBehavior(enable: false),
      // Tooltip personalizado
      tooltipBehavior: TooltipBehavior(
        enable:
            false, // Desativado porque usaremos a anotação fixa em vez do tooltip
      ),
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat('MMM d'),
        interval: 1,
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
        labelStyle: const TextStyle(color: Color(0xFF4A5568), fontSize: 10),
      ),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 20000,
        interval: 5000,
        labelFormat: '{value}',
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        majorGridLines: MajorGridLines(
          width: 0.8,
          color: Colors.grey.withOpacity(0.25),
        ),
        labelStyle: const TextStyle(color: Color(0xFF4A5568), fontSize: 10),
        axisLabelFormatter: (AxisLabelRenderDetails details) {
          return ChartAxisLabel(
            details.value == 0 ? '0' : '${(details.value / 1000).toInt()}k',
            details.textStyle,
          );
        },
      ),
      series: <CartesianSeries<RevenueData, DateTime>>[
        // Linha da semana anterior - linha preta (colocada primeiro para ficar atrás)
        SplineSeries<RevenueData, DateTime>(
          dataSource: previousWeekData,
          xValueMapper: (RevenueData data, _) => data.date,
          yValueMapper: (RevenueData data, _) => data.revenue,
          name: 'Previous Week',
          color: Colors.black,
          width: 2,
          markerSettings: MarkerSettings(
            isVisible: true,
            height: 8,
            width: 8,
            color: Colors.white,
            borderColor: Colors.black,
            borderWidth: 2,
            shape: DataMarkerType.circle,
          ),
        ),

        // Linha da semana atual - linha azul (colocada por último para ficar na frente)
        SplineSeries<RevenueData, DateTime>(
          dataSource: currentWeekData,
          xValueMapper: (RevenueData data, _) => data.date,
          yValueMapper: (RevenueData data, _) => data.revenue,
          name: 'Current Week',
          color: const Color(0xFF63B3ED),
          width: 3,
          markerSettings: MarkerSettings(
            isVisible: true,
            height: 8,
            width: 8,
            color: Colors.white,
            borderColor: const Color(0xFF63B3ED),
            borderWidth: 2,
            shape: DataMarkerType.circle,
          ),
        ),
      ],
      annotations: <CartesianChartAnnotation>[
        CartesianChartAnnotation(
          widget: Stack(
            clipBehavior: Clip.none,
            children: [
              // Caixa de tooltip
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Feb 18: \$18,255.70',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Feb 7: \$12,785.24',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              // Ponta do tooltip
              Positioned(
                bottom: -8,
                left: 0,
                right: 0,
                child: Center(
                  child: ClipPath(
                    clipper: TriangleClipper(),
                    child: Container(width: 16, height: 8, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          coordinateUnit: CoordinateUnit.point,
          x: DateTime(2024, 2, 15),
          y: 19500,
          horizontalAlignment: ChartAlignment.center,
          verticalAlignment: ChartAlignment.far,
        ),
      ],
    );
  }
}

class RevenueData {
  final DateTime date;
  final double revenue;

  RevenueData(this.date, this.revenue);
}

/// Classe para criar o recorte triangular na parte inferior do tooltip
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:intl/intl.dart';

// class RevenueChart extends StatelessWidget {
//   const RevenueChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             spreadRadius: 0,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Revenue',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//               ),
//               Text(
//                 'Last 7 days VS prior week',
//                 style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//               ),
//             ],
//           ),

//           const SizedBox(height: 16),

//           // Legend
//           Row(
//             children: [
//               _buildLegendItem(
//                 'Feb 14: \$18,255.70',
//                 Colors.black,
//                 Colors.white,
//               ),
//               const SizedBox(width: 8),
//               _buildLegendItem(
//                 'Feb 7: \$12,785.24',
//                 const Color(0xFFF2F4F7),
//                 Colors.black,
//                 hasBorder: true,
//               ),
//             ],
//           ),

//           const SizedBox(height: 16),

//           // Chart
//           Expanded(child: _buildChart()),
//         ],
//       ),
//     );
//   }

//   Widget _buildLegendItem(
//     String text,
//     Color backgroundColor,
//     Color textColor, {
//     bool hasBorder = false,
//   }) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(4),
//         border: hasBorder ? Border.all(color: Colors.grey) : null,
//       ),
//       child: Text(text, style: TextStyle(color: textColor, fontSize: 12)),
//     );
//   }

//   Widget _buildChart() {
//     final List<RevenueData> currentWeekData = [
//       RevenueData(DateTime(2024, 2, 14), 15000),
//       RevenueData(DateTime(2024, 2, 15), 11000),
//       RevenueData(DateTime(2024, 2, 16), 16000),
//       RevenueData(DateTime(2024, 2, 17), 15000),
//       RevenueData(DateTime(2024, 2, 18), 18000),
//       RevenueData(DateTime(2024, 2, 19), 17000),
//       RevenueData(DateTime(2024, 2, 20), 12000),
//     ];

//     final List<RevenueData> previousWeekData = [
//       RevenueData(DateTime(2024, 2, 7), 11000),
//       RevenueData(DateTime(2024, 2, 8), 12000),
//       RevenueData(DateTime(2024, 2, 9), 10000),
//       RevenueData(DateTime(2024, 2, 10), 16000),
//       RevenueData(DateTime(2024, 2, 11), 14000),
//       RevenueData(DateTime(2024, 2, 12), 13000),
//       RevenueData(DateTime(2024, 2, 13), 14000),
//     ];

//     return SfCartesianChart(
//       margin: const EdgeInsets.only(top: 10),
//       primaryXAxis: DateTimeAxis(
//         dateFormat: DateFormat('MMM d'),
//         interval: 1,
//         majorGridLines: const MajorGridLines(width: 0),
//         labelStyle: TextStyle(color: Colors.grey[600], fontSize: 10),
//       ),
//       primaryYAxis: NumericAxis(
//         numberFormat: NumberFormat('##k'),
//         majorGridLines: MajorGridLines(
//           width: 1,
//           color: Colors.grey.withOpacity(0.3),
//         ),
//         labelStyle: TextStyle(color: Colors.grey[600], fontSize: 10),
//         minimum: 0,
//         maximum: 20000,
//         interval: 5000,
//         axisLabelFormatter: (AxisLabelRenderDetails details) {
//           return ChartAxisLabel(
//             '${(details.value / 1000).toInt()}k',
//             details.textStyle,
//           );
//         },
//       ),
//       tooltipBehavior: TooltipBehavior(
//         enable: true,
//         format: 'point.x : \$point.y',
//         header: '',
//       ),
//       series: <CartesianSeries<RevenueData, DateTime>>[
//         // Current week line
//         AreaSeries<RevenueData, DateTime>(
//           dataSource: currentWeekData,
//           xValueMapper: (RevenueData data, _) => data.date,
//           yValueMapper: (RevenueData data, _) => data.revenue,
//           name: 'Current Week',
//           color: const Color(0xFF6C9FFF).withOpacity(0.5),
//           borderColor: const Color(0xFF6C9FFF),
//           borderWidth: 3,
//           markerSettings: const MarkerSettings(
//             isVisible: true,
//             height: 8,
//             width: 8,
//             color: Colors.white,
//             borderColor: Color(0xFF6C9FFF),
//             borderWidth: 2,
//           ),
//         ),

//         // Previous week line
//         LineSeries<RevenueData, DateTime>(
//           dataSource: previousWeekData,
//           xValueMapper: (RevenueData data, _) => data.date,
//           yValueMapper: (RevenueData data, _) => data.revenue,
//           name: 'Previous Week',
//           color: Colors.black,
//           width: 2,
//           dashArray: <double>[4, 4],
//           markerSettings: const MarkerSettings(
//             isVisible: true,
//             height: 8,
//             width: 8,
//             color: Colors.white,
//             borderColor: Colors.black,
//             borderWidth: 2,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class RevenueData {
//   final DateTime date;
//   final double revenue;

//   RevenueData(this.date, this.revenue);
// }
//   final double revenue;

//   RevenueData(this.date, this.revenue);
// }
