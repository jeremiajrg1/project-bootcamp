import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/controller/TabBar_controller.dart';
import 'package:taniku/service/local/shared_pref_service.dart';
import 'package:taniku/view/TambahAlamat_screen.dart';
import 'package:taniku/view/TambahKebun_screen.dart';
import 'package:taniku/view/detail_screen.dart';
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
                                SizedBox(width: 110,),
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
                                ElevatedButton.icon(onPressed: () async
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => TabControllerss()));
                                },
                                  icon: new Icon(Icons.add), label: Text("Tambah Kebun"), style: ElevatedButton.styleFrom(primary: Colors.orange),)
                              ],
                            ),
                            SizedBox(height: 12,),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: viewModel.dataKebunProfil.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){},
                                    child: Container(
                                      child: Card(
                                        child: Container(
                                          margin: const EdgeInsets.all(4),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.all(12),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text('Luas Kebun' + viewModel.dataKebunProfil[index].luasKebun.toString() +' '+'Hektar', style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.green,
                                                          ),),
                                                          Container(
                                                            margin: EdgeInsets.only(left: 70),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                PopupMenuButton(
                                                                    onSelected: (value) {
                                                                      if (value == "Detail") {
                                                                        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                                                                            builder: (_) => DetailScreen(kebun_id: viewModel.dataKebunProfil[index].id.toString(),)
                                                                        ));
                                                                      } else if (value == "Ubah") {

                                                                      } else {

                                                                      }
                                                                    },
                                                                    elevation: 20,
                                                                    enabled: true,
                                                                    icon: Icon(Icons.more_horiz, color: Colors.deepOrange,),
                                                                    itemBuilder: (context) => [
                                                                      PopupMenuItem(child: Text("Lihat Detail"),
                                                                        onTap: (){},
                                                                        value: 'Detail',
                                                                      ),
                                                                      PopupMenuItem(child: Text("Ubah Data"),
                                                                        onTap: (){},
                                                                        value: 'Ubah',
                                                                      ),
                                                                      PopupMenuItem(child: Text("Hapus"),
                                                                        onTap: (){},
                                                                        value: 'Hapus',
                                                                      ),
                                                                    ],
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 8,),
                                              Text('Potensi Produk' +viewModel.dataKebunProfil[index].potensiProduksi.toString()+' '+'Kg/bulan',style:
                                              TextStyle(fontSize: 16,color: Colors.grey),),
                                              const SizedBox(height: 8,),
                                              Text('Kondisi lahan' +viewModel.dataKebunProfil[index].statusLahanId.toString(), style: TextStyle(
                                                fontSize: 16, color: Colors.grey,
                                              ),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            )
                          ],
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
