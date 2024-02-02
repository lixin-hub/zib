import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:zib/component/BottomSheet/BaseSheet.dart';

class QuickLiveSheet extends BaseSheet {
  @override
  Widget layout(BuildContext? context) {
    return QuickLiveForm();
  }
}

class QuickLiveForm extends StatelessWidget {
  QuickLiveForm({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        // decoration: const BoxDecoration(color: Colors.white),
        child: FormBuilder(
          key: _formKey,
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
                onChanged: (e) {
                  // print(_formKey.currentState?.fields['startTime']?.value);
                },
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
                  name: 'users',
                  initialValue: '1',
                  onChanged: (e) {},
                  items: const [
                    DropdownMenuItem(
                      value: '1',
                      child: Text("仅好友"),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Text("除开好友"),
                    ),
                    DropdownMenuItem(
                      child: Text("指定人员可观看"),
                      // value: '3',
                    ),
                    DropdownMenuItem(
                      value: '4',
                      child: Text("任何人"),
                    )
                  ]),
              FormBuilderCheckbox(
                  initialValue: true, name: 'allowInteraction', title: const Text('允许互动'))
            ],
          ),
        ),
      ),
    );
  }
}
