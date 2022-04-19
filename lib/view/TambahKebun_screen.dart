import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/tambahkebun_viewmodel.dart';

class TambahKebunScreen extends StatefulWidget {
  const TambahKebunScreen({Key? key}) : super(key: key);

  @override
  State<TambahKebunScreen> createState() => _TambahKebunScreenState();
}

class _TambahKebunScreenState extends State<TambahKebunScreen> {

  final dataAlamatController = TextEditingController();
  var selectedProvinsi;
  var selectedKabKota;
  var selectedKec;
  var selectedKel;



  @override
  Widget build(BuildContext context) {
    const maxLines = 5;
    return ChangeNotifierProvider<TambahKebunViewModel>(
      create: (context) => TambahKebunViewModel(context),
      child: Builder(
          builder: (context){
            return Consumer<TambahKebunViewModel>(
                builder: (context, viewModel, child){
                  return DefaultTabController(
                    length: 4,
                    child: Scaffold(
                      resizeToAvoidBottomInset: false,
                      body: NestedScrollView(
                        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            new SliverAppBar(
                                backgroundColor: Colors.green,
                                title: Text('Tambah Kebun', style: TextStyle(
                                  color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.bold,
                                ),),
                                pinned: true,
                                floating: true,
                                bottom: TabBar(
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(18)),
                                      color: Colors.deepOrange),
                                  isScrollable: true,
                                  tabs: [
                                    Tab(child: Text("Alamat", style: TextStyle(
                                      fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins",
                                    ),),),
                                    Tab(child: Text("Kebun", style: TextStyle(
                                      fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins",
                                    ),),),
                                    Tab(child: Text("Dokumen", style: TextStyle(
                                      fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins",
                                    ),),),
                                    Tab(child: Text("Sertifikat", style: TextStyle(
                                      fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins",
                                    ),),),
                                  ],
                                )
                            ),
                          ];
                        },
                        body: TabBarView(
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Container(
                                margin: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Alamat',
                                              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(2, -4),
                                                child: const Text(
                                                  '*',
                                                  //superscript is usually smaller in size
                                                  textScaleFactor: 1,
                                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                    SizedBox(height: 8,),
                                    SizedBox(
                                      height: maxLines * 24.0,
                                      child: TextFormField(
                                        maxLines: maxLines,
                                        controller: dataAlamatController,
                                        decoration: const InputDecoration(
                                          // labelText: "Alamat",
                                          hintText: "Deskripsi", hintStyle: TextStyle(
                                          fontFamily: "Poppins",
                                        ),
                                          //   contentPadding:
                                          // EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                            borderSide: BorderSide(color: Colors.grey, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                            borderSide: BorderSide(color: Colors.grey, width: 2),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "RT Tidak Boleh Kosong !";
                                          } else {
                                            return null;
                                          }
                                        },
                                        // style: TextStyle(
                                        //   // height: 3.5,
                                        // ),
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                  children: [
                                                    const TextSpan(
                                                      text: 'RT',
                                                      style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                    WidgetSpan(
                                                      child: Transform.translate(
                                                        offset: const Offset(2, -4),
                                                        child: const Text(
                                                          '*',
                                                          //superscript is usually smaller in size
                                                          textScaleFactor: 1,
                                                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                            const SizedBox(height: 8,),
                                            SizedBox(
                                              width: 180,
                                              height: 50,
                                              child: TextFormField(
                                                style: const TextStyle(color: Colors.black45),
                                                controller: dataAlamatController,
                                                decoration: const InputDecoration(
                                                  //   // labelText: "Alamat",
                                                  //   hintText: "RT", hintStyle: TextStyle(
                                                  //   fontFamily: "Poppins",
                                                  // ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(32)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 2),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(32)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 2),
                                                  ),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "RW Tidak Boleh Kosong !";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                  children: [
                                                    const TextSpan(
                                                      text: 'RW',
                                                      style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                    WidgetSpan(
                                                      child: Transform.translate(
                                                        offset: const Offset(2, -4),
                                                        child: const Text(
                                                          '*',
                                                          //superscript is usually smaller in size
                                                          textScaleFactor: 1,
                                                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                            const SizedBox(height: 8,),
                                            SizedBox(
                                              width: 180,
                                              height: 50,
                                              child: TextFormField(
                                                style: const TextStyle(color: Colors.black45),
                                                controller: dataAlamatController,
                                                decoration: const InputDecoration(
                                                  //   // labelText: "Alamat",
                                                  //   hintText: "RT", hintStyle: TextStyle(
                                                  //   fontFamily: "Poppins",
                                                  // ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(32)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 2),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(32)),
                                                    borderSide: BorderSide(color: Colors.grey, width: 2),
                                                  ),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Alamat Tidak Boleh Kosong !";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],),
                                    SizedBox(height: 8,),
                                    // PROVINSI //
                                    RichText(
                                      text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Provinsi',
                                              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(2, -4),
                                                child: const Text(
                                                  '*',
                                                  //superscript is usually smaller in size
                                                  textScaleFactor: 1,
                                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                    DropdownButtonFormField(
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                            borderSide: BorderSide(color: Colors.grey, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                            borderSide: BorderSide(color: Colors.grey, width: 2),
                                          ),
                                        ),
                                        // borderRadius: BorderRadius.all(Radius.circular(32)),
                                        hint: Text("Pilih Provinsi"),
                                        isExpanded: true,
                                        value: selectedProvinsi,
                                        items: viewModel.dataProvinsi.map((value) {
                                          return DropdownMenuItem(
                                              value: value.provinsiId.toString(),
                                              child: Text (value.provinsiName.toString())
                                          );
                                        }).toList(),
                                        onChanged: (newValue){
                                          setState(() {
                                            // print(newValue.toString());
                                            selectedProvinsi = newValue!;
                                            selectedKabKota = null;
                                            selectedKec = null;
                                            selectedKel = null;
                                          });
                                          viewModel.getKabupaten(selectedProvinsi, context);
                                        }),
                                    SizedBox(height: 8,),
                                    // KABUPATEN / KOTA //
                                    RichText(
                                      text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Kabupaten/Kota',
                                              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(2, -4),
                                                child: const Text(
                                                  '*',
                                                  //superscript is usually smaller in size
                                                  textScaleFactor: 1,
                                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                    DropdownButtonFormField(
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                            borderSide: BorderSide(color: Colors.grey, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                            borderSide: BorderSide(color: Colors.grey, width: 2),
                                          ),
                                        ),
                                        // borderRadius: BorderRadius.all(Radius.circular(32)),
                                        hint: Text("Pilih Kabupaten/Kota"),
                                        isExpanded: true,
                                        value: selectedKabKota,
                                        items: viewModel.dataKabupaten.map((value) {
                                          return DropdownMenuItem(
                                              value: value.kabupatenKotaId.toString(),
                                              child: Text (value.kabupatenKotaName.toString())
                                          );
                                        }).toList(),
                                        onChanged: (newValue){
                                          setState(() {
                                            // print(newValue.toString());
                                            selectedKabKota = newValue!;
                                            selectedKec = null;
                                            selectedKel = null;
                                          });
                                          viewModel.getKecamatan(selectedKabKota, context);
                                        }),
                                    SizedBox(height: 8,),
                                    // KECAMATAN //
                                    RichText(
                                      text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Kecamatan',
                                              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(2, -4),
                                                child: const Text(
                                                  '*',
                                                  //superscript is usually smaller in size
                                                  textScaleFactor: 1,
                                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                    DropdownButtonFormField(
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                            borderSide: BorderSide(color: Colors.grey, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                            borderSide: BorderSide(color: Colors.grey, width: 2),
                                          ),
                                        ),
                                        // borderRadius: BorderRadius.all(Radius.circular(32)),
                                        hint: Text("Pilih Kecamatan"),
                                        isExpanded: true,
                                        value: selectedKec,
                                        items: viewModel.dataKecamatan.map((value) {
                                          return DropdownMenuItem(
                                              value: value.kecamatanId.toString(),
                                              child: Text (value.kecamatanName.toString())
                                          );
                                        }).toList(),
                                        onChanged: (newValue){
                                          setState(() {
                                            // print(newValue.toString());
                                            selectedKec = newValue!;
                                            selectedKel = null;
                                          });
                                          viewModel.getKelurahan(selectedKec, context);
                                        }),
                                    SizedBox(height: 8,),
                                    // KELURAHAN //
                                    RichText(
                                      text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Kelurahan',
                                              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(2, -4),
                                                child: const Text(
                                                  '*',
                                                  //superscript is usually smaller in size
                                                  textScaleFactor: 1,
                                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                    DropdownButtonFormField(
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                            borderSide: BorderSide(color: Colors.grey, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                            borderSide: BorderSide(color: Colors.grey, width: 2),
                                          ),
                                        ),
                                        // borderRadius: BorderRadius.all(Radius.circular(32)),
                                        hint: Text("Pilih Kelurahan"),
                                        isExpanded: true,
                                        value: selectedKel,
                                        items: viewModel.dataKelurahan.map((value) {
                                          return DropdownMenuItem(
                                              value: value.kelurahanDesaId.toString(),
                                              child: Text (value.kelurahanDesaName.toString())
                                          );
                                        }).toList(),
                                        onChanged: (newValue){
                                          setState(() {
                                            print(newValue.toString());
                                            selectedKel = newValue!;
                                            // selectedProvinsi = null;
                                            // selectedKabKota = null;
                                            // selectedKec = null;
                                          });
                                          // viewModel.getKelurahan(selectedKec, context);
                                        }),
                                    SizedBox(height: 8,),
                                    // KODE POS //
                                    RichText(
                                      text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Kode Pos',
                                              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(2, -4),
                                                child: const Text(
                                                  '*',
                                                  //superscript is usually smaller in size
                                                  textScaleFactor: 1,
                                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                    DropdownButtonFormField(
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(32)),
                                          borderSide: BorderSide(color: Colors.grey, width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(32)),
                                          borderSide: BorderSide(color: Colors.grey, width: 2),
                                        ),
                                      ),
                                      // borderRadius: BorderRadius.all(Radius.circular(32)),
                                      hint: Text("Pilih Kode Pos"),
                                      isExpanded: true,
                                      value: selectedKel,
                                      items: viewModel.dataKelurahan.map((value) {
                                        return DropdownMenuItem(
                                          value: value.kelurahanDesaId.toString(),
                                          child: Text (value.kodePos.toString()),
                                        );
                                      }).toList(),
                                      onChanged: null,
                                      //     (newValue){
                                      //   // setState(() {
                                      //   //   // print(newValue.toString());
                                      //   //   selectedKel = newValue;
                                      //   // });
                                      //   // viewModel.getKelurahan(selectedKec, context);
                                      // }
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(width: 2.0, color: Colors.orange),
                                          ),
                                          child: TextButton(
                                            child: const Text(
                                              'Kembali',
                                              style: TextStyle(color: Colors.orange),
                                            ),
                                            onPressed: () {

                                            },
                                          ),
                                        ),
                                        // SizedBox(
                                        //     width: 150,
                                        //     height: 50,
                                        //     child: OutlinedButton(
                                        //         style: OutlinedButton.styleFrom(
                                        //           side: BorderSide(width: 1.0, color: Colors.orange),
                                        //         ),
                                        //         onPressed: () {
                                        //         },
                                        //         child: const Text("Batal", style: TextStyle(color: Colors.orange),)
                                        //     )
                                        // ),
                                        Container(
                                          // margin: EdgeInsets.all(20),
                                          width: 150,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [Colors.orange, Colors.deepOrange],
                                              begin: FractionalOffset.bottomLeft,
                                              end: FractionalOffset.topRight,
                                            ),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: TextButton(
                                            child: const Text(
                                              'Selanjutnya',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            onPressed: () {

                                            },
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Container(
                                    //   margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //     children: [
                                    //       Column(
                                    //         children: [
                                    //           RichText(
                                    //             text: TextSpan(
                                    //                 children: [
                                    //                   const TextSpan(
                                    //                     text: 'RT',
                                    //                     style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                    //                   ),
                                    //                   WidgetSpan(
                                    //                     child: Transform.translate(
                                    //                       offset: const Offset(2, -4),
                                    //                       child: const Text(
                                    //                         '*',
                                    //                         //superscript is usually smaller in size
                                    //                         textScaleFactor: 1,
                                    //                         style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                    //                       ),
                                    //                     ),
                                    //                   )
                                    //                 ]),
                                    //           ),
                                    //           TextFormField(
                                    //             // controller: dataAlamatController,
                                    //             decoration: const InputDecoration(
                                    //               enabledBorder: OutlineInputBorder(
                                    //                 borderRadius: BorderRadius.all(Radius.circular(32)),
                                    //                 borderSide: BorderSide(color: Colors.grey, width: 2),
                                    //               ),
                                    //               focusedBorder: OutlineInputBorder(
                                    //                 borderRadius: BorderRadius.all(Radius.circular(32)),
                                    //                 borderSide: BorderSide(color: Colors.grey, width: 2),
                                    //               ),
                                    //             ),
                                    //             validator: (value) {
                                    //               if (value!.isEmpty) {
                                    //                 return "Alamat Tidak Boleh Kosong !";
                                    //               } else {
                                    //                 return null;
                                    //               }
                                    //             },
                                    //             style: TextStyle(
                                    //               // height: 3.5,
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //       Container(
                                    //         margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                    //         child: Column(
                                    //           children: [
                                    //             RichText(
                                    //               text: TextSpan(
                                    //                   children: [
                                    //                     const TextSpan(
                                    //                       text: 'RW',
                                    //                       style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                    //                     ),
                                    //                     WidgetSpan(
                                    //                       child: Transform.translate(
                                    //                         offset: const Offset(2, -4),
                                    //                         child: const Text(
                                    //                           '*',
                                    //                           //superscript is usually smaller in size
                                    //                           textScaleFactor: 1,
                                    //                           style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                    //                         ),
                                    //                       ),
                                    //                     )
                                    //                   ]),
                                    //             ),
                                    //             TextFormField(
                                    //               // controller: dataAlamatController,
                                    //               decoration: const InputDecoration(
                                    //                 enabledBorder: OutlineInputBorder(
                                    //                   borderRadius: BorderRadius.all(Radius.circular(32)),
                                    //                   borderSide: BorderSide(color: Colors.grey, width: 2),
                                    //                 ),
                                    //                 focusedBorder: OutlineInputBorder(
                                    //                   borderRadius: BorderRadius.all(Radius.circular(32)),
                                    //                   borderSide: BorderSide(color: Colors.grey, width: 2),
                                    //                 ),
                                    //               ),
                                    //               validator: (value) {
                                    //                 if (value!.isEmpty) {
                                    //                   return "Alamat Tidak Boleh Kosong !";
                                    //                 } else {
                                    //                   return null;
                                    //                 }
                                    //               },
                                    //               style: TextStyle(
                                    //                 // height: 3.5,
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            Icon(Icons.flight, size: 350),
                            Icon(Icons.directions_transit, size: 350),
                            Icon(Icons.directions_car, size: 350),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
