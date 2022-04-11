import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/view/detail_screen.dart';
import 'package:taniku/view/screen_new.dart';
import 'package:taniku/viewmodel/home_viewmodel.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                return Scaffold(
                    appBar: AppBar(
                      title: const Text("Contoh List"),
                    ),
                    body: Container(
                      margin: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            //--------------- ListView Horizontal ---------------------
                            const Text("Data Bulan Horizontal",
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 16,),
                            SizedBox(
                                width: double.infinity,
                                height: 220,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: viewModel.dataHome.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => ScreenNew(
                                            judul: viewModel.dataHome[index].newsImage.toString(),
                                            isi: viewModel.dataHome[index].newsDate.toString(),
                                              title: viewModel.dataHome[index].newsTitle.toString()),
                                        )
                                        // print("data : ${viewModel.dataHome[index].newsTitle
                                        //     .toString()}");
                                        );
                                      },
                                      child: Container(
                                          width: 150,
                                          alignment: Alignment.center,
                                          child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            elevation: 15,
                                            child: Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.only(left: 12),
                                              child: Column(
                                                children: [
                                                  Image.network(viewModel.dataHome[index].newsImage.toString()),
                                                  const SizedBox(height: 16,),
                                                  Text(viewModel.dataHome[index].newsDate
                                                      .toString(), style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold)),
                                                  const SizedBox(height: 8,),
                                                  Text(viewModel.dataHome[index].newsTitle.toString()),
                                                  Text(viewModel.dataHome[index].newsId.toString()),
                                                ],
                                              ),
                                            ),
                                          )
                                      ),
                                    );
                                  },
                                )
                            ),
                            SizedBox(height: 16,),
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.green,
                              height: 40,
                              width: double.infinity,
                              child: Text(
                                "Kebun Petani", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: (){
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) => DetailScreen(
                                      //         alamat: viewModel.dataKebun[index].alamat.toString(),
                                      //         luasKebun: viewModel.dataKebun[index].luasKebun.toString(),
                                      //         TipeLahan: viewModel.dataKebun[index].,
                                      //         JumlahPohon: JumlahPohon,
                                      //         jenisbibit: jenisbibit,
                                      //         tahuntanam: tahuntanam,
                                      //         produksi: produksi)))
                                      // print("Warna :${dataListVertical[index].color.toString()}");
                                    },
                                    child: Container(
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12.0)
                                        ),
                                        elevation: 15,
                                        child: Container(
                                            margin: const EdgeInsets.all(8),
                                            child: SingleChildScrollView(
                                              child: Row(
                                                children: [
                                                  const SizedBox(width: 12,),
                                                  Container(
                                                    margin: const EdgeInsets.all(8),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Luas Kebun:"),
                                                        Text(viewModel.dataKebun[index].luasKebun.toString()),
                                                        SizedBox(height: 8,),
                                                        Text("Jumlah pohon"),
                                                        Text(viewModel.dataKebun[index].jumlahPohon.toString()),
                                                        SizedBox(height: 8,),
                                                        Text("Tahun Tanam"),
                                                        Text(viewModel.dataKebun[index].tahunTanamId.toString()),
                                                        SizedBox(height: 16,),
                                                        Row(
                                                          children: [
                                                            Text("Lokasi"),
                                                            SizedBox(width: 8,),
                                                            Text(viewModel.dataKebun[index].alamat.toString()),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                        ),
                                      ),
                                    )
                                );
                              },
                              itemCount: viewModel.dataKebun.length,
                            ),

                            //-------------------- ListView Vertical ---------------------
                        //     SizedBox(height: 16,),
                        //     const Text("List Kebun",
                        //       style: TextStyle(fontWeight: FontWeight.bold),),
                        //     const SizedBox(height: 16,),
                        //     ListView.builder(
                        //       shrinkWrap: true,
                        //       physics: const NeverScrollableScrollPhysics(),
                        //       itemBuilder: (context, index) {
                        //         return Card(
                        //           child: Container(
                        //             margin: const EdgeInsets.all(8),
                        //             child: Row(
                        //               children: [
                        //                 Column(
                        //                   crossAxisAlignment: CrossAxisAlignment.start,
                        //                   children: [
                        //                     Text(viewModel.dataKebun[index].luasKebun.toString(),
                        //                         style: const TextStyle(fontSize: 16,
                        //                             fontWeight: FontWeight.bold)),
                        //                     const SizedBox(height: 8,),
                        //                     Text(viewModel.dataKebun[index].jumlahPohon.toString()),
                        //                   ],
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //         );
                        //       },
                        //       itemCount: viewModel.dataKebun.length,
                        //     ),
                        //   ],
                        // ),
                      ]
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
