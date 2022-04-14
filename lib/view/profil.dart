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
                body: Center(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("assets/profil.jpg"),
                            radius: 50,
                            backgroundColor: Colors.black54,
                          ),
                          const SizedBox(height: 16,),
                          Text("Nama", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(viewModel.dataProfil.nama.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          SizedBox(height: 16,),
                          Text("Nama Bank", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(viewModel.dataProfil.bankName.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          SizedBox(height: 16,),
                          Text("Mobile", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(viewModel.dataProfil.mobile.toString(), style: const TextStyle(fontSize: 18)),
                          SizedBox(height: 100,),
                          SizedBox(
                            height: 40,
                            width: 300,
                              child: ElevatedButton(
                                  onPressed: (){
                                    SharedPreferenceService().removeSharedPref();
                                    Navigator.pop(context);
                                  }, child: Text("Logout gan!"))
                          ),

                        ],
                      ),
                    ),
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
