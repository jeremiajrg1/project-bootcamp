import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/view/UI_Welcome_Screen.dart';
import 'package:taniku/view/loginfix.dart';
import 'package:taniku/viewmodel/register_vewmodel.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({Key? key}) : super(key: key);

  @override
  State<RegistScreen> createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen> {
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final text2Controller = TextEditingController();
  final text3Controller = TextEditingController();
  final text4Controller = TextEditingController();

  // bool checkGan = false;
  // String pilihGender = 'male';
  // List<String> golDarahList = ["O","A","B","O-","A+", "B-"];
  // var pilihGoldar;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterViewModel>(
        create: (context) => RegisterViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer<RegisterViewModel>(
              builder: (context, viewModel, child) {
                return Scaffold(
                    body: Container(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 40),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/umb.png", width: 100, height: 100,),
                                const SizedBox(height: 20,),
                                TextFormField(
                                  controller: textController,
                                  decoration: const InputDecoration(
                                      labelText: "Nama",
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          )
                                      )
                                  ),
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Data Masih Kosong";
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10,),
                                TextFormField(
                                  controller: text2Controller,
                                  decoration: const InputDecoration(
                                      labelText: "Mobile",
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          )
                                      )
                                  ),
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Data Masih Kosong";
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                SizedBox(height: 16,),
                                TextFormField(
                                  controller: text3Controller,
                                  decoration: const InputDecoration(
                                      labelText: "password",
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(6)),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          )
                                      )
                                  ),
                                  // validator: (value) {
                                  //   if (value!.isEmpty){
                                  //     return "Data masih Kosong";
                                  //   }
                                  //   return null;
                                  // }
                                ),
                                const SizedBox(height: 10,),
                                TextFormField(
                                  controller: text4Controller,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      labelText: "confirm password",
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(6)),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          )
                                      )

                                  ),
                                  // validator: (value) {
                                  //   if (value!.isEmpty){
                                  //     return "Data Masih Kosong";
                                  //   }
                                  //   return null;
                                  // }
                                ),
                                SizedBox(height: 16,),
                                // const SizedBox(height: 15,),
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
                                //     value:'male',
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
                                Container(
                                  width: 480,
                                  height: 40,
                                  child: ElevatedButton(
                                      onPressed: () {

                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginFix()));
                                      },
                                      child: Text("Register")
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: <Widget> [
                                    Expanded(child: Divider(thickness: 2, color: Colors.grey,)),
                                    const SizedBox(height: 10,),
                                    Text("Or"),
                                    const SizedBox(height: 10,),
                                    Expanded(child: Divider(thickness: 2, color: Colors.grey,))
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                ElevatedButton(
                                    onPressed: () async {
                                      String name = textController.text.toString();
                                      String mobile = text2Controller.text.toString();
                                      String password = text3Controller.text.toString();
                                      String confirm_password = text4Controller.text.toString();
                                      viewModel.register(name, mobile, password, confirm_password, context);
                                      // setState(() {
                                      //   if (_formKey.currentState!.validate()) {
                                      //     print("Fullname adalah => " + textController.text);
                                      //     print("Email adalah => " + text2Controller.text);
                                      //     print("Password adalah => " + text3Controller.text);
                                      //     print("Persetujuan => " + checkGan.toString());
                                      //     print("Gender => " + pilihGender.toString());
                                      //     print("Golongan darah => " + pilihGoldar.toString());
                                      //   }
                                      // });
                                    }, child: Text("Sign Up For Login")),
                                const SizedBox(height: 10,),
                                OutlinedButton(onPressed: () {
                                  Navigator.pop(context);
                                },
                                  child: Text("Sign up With Google"),
                                  style: OutlinedButton.styleFrom(
                                    primary: Colors.lightBlue,
                                    shape: StadiumBorder(),
                                    shadowColor: Colors.white70,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text("By Sign up you the"), Text("Terms of Service and Policy", style: TextStyle(color: Colors.blue),),
                                SizedBox(height: 20,),
                                Text("Already Have Account? Login", style: TextStyle(fontSize: 12),)
                              ],
                            )
                        ),
                      ),
                    )
                );
              }
          );
        }
      ),
    );
  }
}
