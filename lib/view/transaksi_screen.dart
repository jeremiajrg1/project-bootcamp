import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/transaksi_viewmodel.dart';

class TransaksiScreen extends StatefulWidget {
  const TransaksiScreen({Key? key}) : super(key: key);

  @override
  State<TransaksiScreen> createState() => _TransaksiScreenState();
}

class _TransaksiScreenState extends State<TransaksiScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TransaksiViewModel>(
        create: (context) => TransaksiViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer<TransaksiViewModel>(
            builder: (context, viewMoodel, child) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Daftar Transaksi"),
                ),
                body: Container(
                  margin: EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: viewMoodel.dataTransaksi.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  height: 250,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    elevation: 15,
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.network(viewMoodel.dataTransaksi[index].foto.toString(), height: 70, width: 70,),
                                          const SizedBox(height: 8,),
                                          Text(viewMoodel.dataTransaksi[index].namaPabrik.toString()),
                                          SizedBox(width: 80,),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text("Kuota"),
                                                  const SizedBox(width: 12,),
                                                  Text(viewMoodel.dataTransaksi[index].kuota.toString()+"KG"),
                                                  SizedBox(height: 8,),
                                                  Text(viewMoodel.dataTransaksi[index].harga.toString()),
                                                  SizedBox(height: 8,),
                                                  Text("Kuota Terisi"),
                                                  SizedBox(height: 8,),
                                                  Text(viewMoodel.dataTransaksi[index].koutaTerisi.toString()+"/10"),
                                                ],
                                              )
                                            ],
                                          )
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
