import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                          ),
                          const SizedBox(height: 16,),
                          Text(viewModel.dataProfil.bankName.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          SizedBox(height: 16,),
                          Text(viewModel.dataProfil.id.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
