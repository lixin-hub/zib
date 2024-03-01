
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:zib/common/ThemeColors.dart';

class PagedDataTable extends StatefulWidget {
  const PagedDataTable({super.key});

  @override
  State<PagedDataTable> createState() => _PagedDataTableState();
}

class _PagedDataTableState extends State<PagedDataTable> {
  @override
  Widget build(BuildContext context) {
    var columns = [
      DataColumn2(
          label: Checkbox(
            value: false,
            onChanged: (bool? value) {},
          ),
          fixedWidth: 30),
      const DataColumn2(label: Text('封面')),
      const DataColumn2(label: Text('直播信息')),
      const DataColumn2(label: Text('直播开始时间')),
      const DataColumn2(label: Text('直播结束时间')),
      const DataColumn2(label: Text('直播时间')),
      const DataColumn2(label: Text('操作'))
    ];
    var data = List<DataRow2>.generate(10, (row) {
      return DataRow2(specificRowHeight: 100, cells: [
        DataCell(Checkbox(
          value: false,
          onChanged: (bool? value) {},
        )),
        DataCell(Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'images/banner.png',
                  fit: BoxFit.cover,
                  height: 100,
                )))),
        DataCell(
            Text("物理：宇宙的诞生1", style: ThemeColors.unSelectedMenuFontStyle.copyWith(fontSize: 14))),
        DataCell(Text(DateTime.now().toString(),
            style: ThemeColors.unSelectedMenuFontStyle.copyWith(fontSize: 14))),
        DataCell(Text(DateTime.now().toString(),
            style: ThemeColors.unSelectedMenuFontStyle.copyWith(fontSize: 14))),
        DataCell(Text(DateTime.now().toString(),
            style: ThemeColors.unSelectedMenuFontStyle.copyWith(fontSize: 14))),
        DataCell(IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {},
        ))
      ]);
    });
    return DataTable2(
      // headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey[850]!),
        headingTextStyle: const TextStyle(color: Colors.white),
        headingCheckboxTheme:
        const CheckboxThemeData(side: BorderSide(color: Colors.white, width: 2.0)),
        //checkboxAlignment: Alignment.topLeft,
        isHorizontalScrollBarVisible: true,
        isVerticalScrollBarVisible: true,
        columnSpacing: 12,
        horizontalMargin: 12,
        columns: columns,
        rows: data);
  }
}