import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zib/api/live.dart';
import 'package:zib/common/StoreController.dart';
import 'package:zib/component/BottomSheet/BaseSheet.dart';
import 'package:zib/main.dart';

class QuickLiveSheet extends BaseSheet {
  @override
  Widget layout(BuildContext? context) {
    return QuickLiveForm();
  }
}

class QuickLiveForm extends StatelessWidget {
  QuickLiveForm({super.key});

  var storage = Get.find<StoreController>();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // decoration: const BoxDecoration(color: Colors.white),
        child: FormBuilder(
          key: _formKey,
          initialValue: {
            'title': '直播标题-${DateFormat(DateFormats.zh_mo_d_h_m).format(DateTime.now())}',
            'startTime': DateTime.now(),
            'endTime': DateTime.now().add(const Duration(hours: 1)),
            'permission': '1', //谁可以观看该直播 1好友 2除开好友  3指定人员(将查询指定记录表) 4 任何人
            'interactionAllowed': true
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderTextField(
                // key: _emailFieldKey,
                decoration: const InputDecoration(
                    labelText: '标题', helperText: '标题用于展示和搜索', hintText: '输入直播标题'),
                name: 'title',
              ),
              FormBuilderDateTimePicker(
                name: 'startTime',
                firstDate: DateTime.now(),
                format: DateFormat(DateFormats.zh_y_mo_d_h_m),
                valueTransformer: (value) => value?.toString(),
                decoration: InputDecoration(
                  labelText: '开始时间',
                  helperText: '预计直播开始时间',
                  hintText: '点击选择时间',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {},
                  ),
                ),
              ),
              FormBuilderDateTimePicker(
                name: 'endTime',
                format: DateFormat(DateFormats.zh_y_mo_d_h_m),
                onChanged: (e) {
                  // print(_formKey.currentState?.fields['startTime']?.value);
                },
                valueTransformer: (value) => value?.toString(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(hours: 12)),
                decoration: InputDecoration(
                  labelText: '结束时间',
                  helperText: '预计直播结束时间',
                  hintText: '点击选择时间',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {},
                  ),
                ),
              ),
              FormBuilderDropdown(
                  decoration: const InputDecoration(
                    labelText: '观看权限',
                    helperText: '被选中的人员将拥有观看权限',
                    hintText: '点击选择时间',
                  ),
                  name: 'permission',
                  onChanged: (e) {},
                  items: [
                    const DropdownMenuItem(
                      value: '1',
                      child: Text("仅好友"),
                    ),
                    const DropdownMenuItem(
                      value: '2',
                      child: Text("除开好友"),
                    ),
                    DropdownMenuItem(
                      value: '3',
                      child: const Text("指定人员可观看"),
                      onTap: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (c) {
                              return const CupertinoAlertDialog();
                            });
                      },
                    ),
                    const DropdownMenuItem(
                      value: '4',
                      child: Text("任何人"),
                    )
                  ]),
              FormBuilderCheckbox(name: 'interactionAllowed', title: const Text('允许互动')),
              ElevatedButton(
                  onPressed: () async {
                    print(_formKey.currentState?.instantValue);
                    var userId = storage.user['userId'];
                    print('userId：$userId');
                    var p = {"mainSpeaker": userId, ...?_formKey.currentState?.instantValue};
                    logger.d(p);
                    createLiveRoom(p).then((value) {});
                  },
                  child: const Text('创建'))
            ],
          ),
        ),
      ),
    );
  }
}
