import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:taniku/view/UI_Welcome_Screen.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/login_viewmodel.dart';

class LoginFix extends StatefulWidget {
  const LoginFix({Key? key}) : super(key: key);

  @override
  State<LoginFix> createState() => _LoginFixState();
}

class _LoginFixState extends State<LoginFix> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_stat_ic_notification');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidRecieveLocalNotification);
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        print('on message ${notification}');
        displayNotification(notification);
      }
    });

    if (Platform.isIOS) {
      _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }

    _firebaseMessaging.getToken().then((String? token) async {
      assert(token != null);
      print("fcm_token => " + token.toString());
    });

    _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true
    );

  }

  Future displayNotification(RemoteNotification notification) async{
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'channelid', 'flutterfcm',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      notification.title,
      notification.body,
      platformChannelSpecifics,
      payload: 'hello',);
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }

  Future onDidRecieveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          CupertinoAlertDialog(
            title: Text(title!),
            content: Text(body!),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text('Ok'),
                onPressed: () async {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          ),
    );
  }

  // bool checkGan = false;
  // String pilihGender = 'male';
  // List<String> golDarahList = ["O","A","B","O-","A+", "B-"];
  // var pilihGoldar;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
        create: (context) => LoginViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer<LoginViewModel>(
            builder: (context, viewModel, child) {
              return Scaffold(
                // resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                    title: Text("gasgan"),
                  ),
                  body: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Center(
                          // constraints: const BoxConstraints.expand(),
                          // padding: EdgeInsets.only(top: 20),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/umb.png", width: 100, height: 100,),
                                const SizedBox(height: 10,),
                                SizedBox(
                                  width: 280,
                                  height: 40,
                                  child: TextFormField(
                                    controller: usernameController,
                                    decoration: const InputDecoration(
                                        labelText: "Email",
                                        icon: Icon(Icons.people),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(6)),
                                            borderSide: BorderSide(
                                              color: Colors.blue,
                                            )
                                        )
                                    ),
                                    // validator: (value) {
                                    //   if (value!.isEmpty) {
                                    //     return "Username masih kosong";
                                    //   }
                                    //   return null;
                                    // },
                                  ),
                                ),
                                SizedBox(height: 16,),
                                SizedBox(
                                    width: 280,
                                    height: 40,
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: passwordController,
                                      decoration: const InputDecoration(
                                          labelText: "Password",
                                          icon: Icon(Icons.password),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(6)),
                                            borderSide: BorderSide(
                                              color: Colors.blue,
                                            ),
                                          )
                                      ),
                                      // validator: (value) {
                                      //   if (value!.isEmpty) {
                                      //     return "Password belum diisi";
                                      //   }
                                      //   return null;
                                      // },
                                    )
                                ),
                                // SizedBox(height: 16,),
                                // Text("Check-in"),
                                // SizedBox(height: 10,),
                                // CheckboxListTile(
                                //   title: Text("Setuju Gan"),
                                //   value: checkGan,
                                //   onChanged: (newValue) {
                                //     setState(() {
                                //       checkGan = newValue!;
                                //       print(newValue);
                                //     });
                                //   },
                                //   controlAffinity: ListTileControlAffinity.leading,
                                // ),
                                // SizedBox(height: 10,),
                                // Text("Pilih Gender"),
                                // ListTile(
                                //   leading: Radio<String> (
                                //     value: 'male',
                                //     groupValue: pilihGender,
                                //     onChanged: (value){
                                //       setState(() {
                                //         pilihGender = value!;
                                //       });
                                //     },
                                //   ),
                                //   title: Text("Male"),
                                // ),
                                // ListTile(
                                //   leading: Radio<String> (
                                //     value: 'female',
                                //     groupValue: pilihGender,
                                //     onChanged: (value) {
                                //       setState(() {
                                //         pilihGender = value!;
                                //       });
                                //     },
                                //   ),
                                //   title: Text("Female"),
                                // ),
                                // SizedBox(height: 10,),
                                // DropdownButton(
                                //   isExpanded: true,
                                //   hint: Text("Silahkan pilih golongan darah"),
                                //   value: pilihGoldar,
                                //   onChanged: (newValue) {
                                //     setState(() {
                                //       print(newValue.toString());
                                //       pilihGoldar = newValue;
                                //     });
                                //   },
                                //   items: golDarahList.map((String value){
                                //     return DropdownMenuItem(
                                //         value: value,
                                //         child: Text(value)
                                //     );
                                //   }).toList(),
                                // ),
                                SizedBox(height: 24,),
                                SizedBox(
                                  width: 200,
                                  height: 40,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        String username = usernameController.text.toString();
                                        String password = passwordController.text.toString();

                                        viewModel.login(username, password, context);
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                                        // setState(() {
                                        //   if (_formKey.currentState!.validate()) {
                                        //     print("text 1 value => " + textController.text);
                                        //     print("text 2 value => " + text2Controller.text);
                                        //     print("text 3 value => " + checkGan.toString());
                                        //     print("text 4 value => " + pilihGender.toString());
                                        //     print("text 5 value => " + pilihGoldar.toString());
                                        //   }
                                        //   else {
                                        //     print("Lengkapi Data");
                                        //     showDialog(
                                        //         context: context,
                                        //         builder: (_) =>
                                        //             AlertDialog(
                                        //               title: Text('Informasi'),
                                        //               content: Text(
                                        //                   'Silahkan Lengkapi Data Anda'),
                                        //               actions: [
                                        //                 TextButton(
                                        //                   child: Text("OK"),
                                        //                   onPressed: () {
                                        //                     Navigator.pop(context);
                                        //                   },
                                        //                 ),
                                        //               ],
                                        //             )
                                        //     );
                                        //   }
                                        // });
                                      },
                                      child: Text("Login")
                                  ),
                                )
                              ]
                          ),
                        ),
                      )
                  )
              );
            }
          );
        }
      ),
    );
  }
}
