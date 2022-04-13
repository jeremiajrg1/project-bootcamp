import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/detail_viewmodel.dart';

class DetailScreen extends StatefulWidget {
  String kebun_id;
  DetailScreen({Key? key, required this.kebun_id}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailViewModel>(
        create: (context) => DetailViewModel(context, widget.kebun_id),
      child: Builder(
        builder: (context) {
          return Consumer<DetailViewModel>(
            builder: (context, viewModel, child) {
              return Scaffold(
                appBar: AppBar(
                    title: Text("Detail")
                ),
                body: Center(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                              return Card(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text("Alamat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                            Text(
                                              "${viewModel.dataDetailKebun[index].alamat.toString()}, ${viewModel.dataDetailKebun[index].kelurahanName.toString()},"
                                                  "${viewModel.dataDetailKebun[index].kecamatanName.toString()}, ${viewModel.dataDetailKebun[index].kabupatenKotaName.toString()},"
                                                  "${viewModel.dataDetailKebun[index].provinsiName.toString()}, ${viewModel.dataDetailKebun[index].kodePos.toString()}",
                                              style: const TextStyle(
                                                fontSize: 16, color: Colors.grey
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text("Luas Kebun", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                Text(viewModel.dataDetailKebun[index].luasKebun.toString()+" HA", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                SizedBox(height: 8,),
                                                const Text("Tipe Lahan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                Text(viewModel.dataDetailKebun[index].statusLahanName.toString(), style: TextStyle(fontSize: 16, color: Colors.grey),),
                                                SizedBox(height: 8,),
                                                const Text("Jumlah Pohon", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                Text(viewModel.dataDetailKebun[index].jumlahPohon.toString(), style: TextStyle(fontSize: 16, color: Colors.grey),),
                                              ],
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text("Jenis Bibit", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                  Text(viewModel.dataDetailKebun[index].jenisBibitName.toString(), style: const TextStyle(fontSize: 16, color: Colors.grey)),
                                                  const SizedBox(height: 8,),
                                                  const Text("Tahun Tanam", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                  Text(viewModel.dataDetailKebun[index].tahunTanamId.toString(), style: const TextStyle(fontSize: 16, color: Colors.grey)),
                                                  const SizedBox(height: 8,),
                                                  const Text("Jumlah Pohon", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                  Text(viewModel.dataDetailKebun[index].potensiProduksi.toString()+" Ton/Bulan", style: const TextStyle(fontSize: 16, color: Colors.grey)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        margin: const EdgeInsets.only(left: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text("Foto Kebun", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 16),
                                        child: Column(
                                          children: const [
                                            Icon(Icons.credit_card_rounded, size: 120,)
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 16,)
                                    ],
                                  ),
                                ),
                              );
                              },
                            itemCount: viewModel.dataDetailKebun.length,
                          ),
                          const SizedBox(height: 16,),
                          Card(
                            child: Container(
                              margin: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Dokumen", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 16,),
                                  ListView.builder(
                                      itemCount: viewModel.dataDokumen.length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                          height: 80,
                                          width: double.infinity,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: const [
                                                      Icon(Icons.credit_card_rounded, size: 60,)
                                                    ],
                                                  ),
                                                  const SizedBox(width: 12,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(viewModel.dataDokumen[index].dokumenName.toString(), style: const TextStyle(fontSize: 16),),
                                                      Text(viewModel.dataDokumen[index].nomor.toString(), style: const TextStyle(fontSize: 16, color: Colors.green),)
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const Expanded(child: Divider(thickness: 2,))
                                            ],
                                          ),
                                        );
                                      }
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16,),
                          Card(
                            child: Container(
                              margin: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Sertifikasi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 16,),
                                  ListView.builder(
                                      itemCount: viewModel.dataSertifikat.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                          height: 80,
                                          width: double.infinity,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: const [
                                                      Icon(Icons.credit_card_rounded, size: 60,)
                                                    ],
                                                  ),
                                                  const SizedBox(width: 12,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(viewModel.dataSertifikat[index].sertifikasiName.toString(), style: const TextStyle(fontSize: 16),),
                                                      Text(viewModel.dataSertifikat[index].sertifikasiNo.toString(), style: const TextStyle(fontSize: 16, color: Colors.green),)
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const Expanded(child: Divider(thickness: 2,))
                                            ],
                                          ),
                                        );
                                      }
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16,),
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
