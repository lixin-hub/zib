import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:window_manager/window_manager.dart';
import 'package:zib/api/index.dart';
import 'package:zib/common/Sp.dart';
import 'package:zib/common/StoreController.dart';
import 'package:zib/component/MyTextFiled.dart';

import '../component/OutlineIconLabelButton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? password;
  var store = Get.find<StoreController>();


  @override
  void initState() {
    super.initState();
    windowManager.setSize(const Size(800, 500));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(color: Color(0xffB5DADC)),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  alignment: Alignment.topCenter,
                  constraints: const BoxConstraints(maxWidth: 250, minWidth: 100),
                  decoration: const BoxDecoration(color: Color(0xffB5DADC)),
                  child: const Text(
                    "立即订阅，精彩即刻开启，学无止境，成就卓越！",
                    style: TextStyle(color: Colors.white),
                  ),
                ).expanded(),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40), bottomLeft: Radius.circular(40)),
                      color: Colors.white),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Create Account",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 30),
                        ).marginOnly(bottom: 30),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          OutlineIconLabelButton(
                              const Icon(Icons.wechat), const Text("Sign with wechat"), () {}),
                          OutlineIconLabelButton(
                              const Icon(Icons.g_translate), const Text("Sign with wechat"), () {})
                        ]),
                        const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "-OR-",
                              style: TextStyle(color: Colors.grey),
                            )).marginSymmetric(vertical: 30),
                        Container(
                          // color: Colors.blue,
                          width: 100,
                          // alignment: Alignment.center,
                          constraints: const BoxConstraints(
                            maxWidth: 100,
                            minWidth: 100,
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              MyTextFiled(
                                onChange: (value) {
                                  username = value;
                                },
                              ),
                              MyTextFiled(
                                onChange: (value) {
                                  password = value;
                                },
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                  onPressed: () async {
                                    print("$username $password");
                                    var r = await loginApi(username, password);
                                    var t = r["token"];
                                    if (t == null) {
                                      return;
                                    }
                                    store.token = t;
                                    var data = await userInfoApi();
                                    var userInfo = data['data']['userInfo'];
                                  },
                                  child: const Text("登录"))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ).expanded(flex: 3),
              ],
            ),
            Positioned(
                bottom: 20,
                left: 0,
                child: Image.asset(
                  'images/login.png',
                  width: 400,
                ))
          ],
        ),
      ),
    );
  }
}
