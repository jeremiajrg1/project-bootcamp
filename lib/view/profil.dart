import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/service/local/shared_pref_service.dart';
import 'package:taniku/viewmodel/profil_viewmodel.dart';
class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfilViewModel>(
        create: (context) => ProfilViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer<ProfilViewModel>(
            builder: (context, viewModel, child) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Profil"),
                  automaticallyImplyLeading: false,
                ),
                body: Container(
                  margin: const EdgeInsets.all(8),
                    child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage("assets/profil.jpg"),
                                      radius: 50,
                                      backgroundColor: Colors.black54,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: [
                                    Text(viewModel.dataProfil.nama.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(width: 130,),
                                Column(
                                  children: [
                                    ElevatedButton(
                                        onPressed: (){
                                          SharedPreferenceService().removeSharedPref();
                                          Navigator.pop(context);
                                        }, child: Text(">", style: TextStyle(fontSize: 20),),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.orange,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 18,),
                            Row(
                              children: [
                                Text("Kebun Saya", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                SizedBox(width: 120,),
                                ElevatedButton.icon(onPressed: (){}, icon: new Icon(Icons.add), label: Text("Tambah Kebun"), style: ElevatedButton.styleFrom(primary: Colors.orange),)
                              ],
                            )
                          ],
                        )
                    ),

                ),
              );
            }
          );
        }
      ),
    );
  }
}
