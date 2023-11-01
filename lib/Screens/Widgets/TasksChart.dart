import 'package:data_band/Utils/TextStyle.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class TasksChart extends StatefulWidget {
  const TasksChart({Key? key}) : super(key: key);

  @override
  State<TasksChart> createState() => _TasksChartState();
}

class _TasksChartState extends State<TasksChart> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(text: S.of(context).TasksChartWidget_TasksCount,textStyle: Text_Style.textStyleBold(Colors.black87, 18)),
      legend: Legend(isVisible: true , overflowMode: LegendItemOverflowMode.wrap),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        PieSeries<GDPData, String>(
          dataSource: _chartData,
          xValueMapper: (GDPData data, _) => data.continent,
          yValueMapper: (GDPData data, _) => data.gdp,
         pointColorMapper: (GDPData data, _) {
         switch (data.continent) {
      case "Pending" || "قيد الانتظار" :
        return Colors.green [700] as Color;
        
         case "In Progress" || "جاري العمل":
        return Colors.amber[900] as Color;
        
         case "Open" || "قيد التقدم":
        return Colors.yellow[800] as Color;
        
         case "Completed" || "مكتمل":
        return Colors.blue;
        
         case "Canceled"|| "ملغي":
        return Colors.red[800] as Color;
        
         case "Rejected" || "مرفوض":
        return Colors.orange[900] as Color;
       
      default:
    }
         },
          enableTooltip: true,
          dataLabelSettings: DataLabelSettings(isVisible: true)
        )
      ],
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData("Pending", 5,),
      GDPData("In Progress", 3),
      GDPData("Open", 2),
      GDPData("Completed", 8),
      GDPData("Canceled", 2),
      GDPData("Rejected", 1),
    ];
    return chartData;
  }
}

class GDPData extends StatefulWidget {
  final String continent;
  final int gdp;

  GDPData(this.continent, this.gdp);
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}