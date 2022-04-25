import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/tambahsertifikat_viewmodel.dart';



class TambahSertifikat extends StatefulWidget {
  const TambahSertifikat({Key? key}) : super(key: key);

  @override
  State<TambahSertifikat> createState() => _TambahSertifikatState();
}

class _TambahSertifikatState extends State<TambahSertifikat> {
  final nomorSertifikatController = new TextEditingController();
  var selectedSertif;
  List<Map> listData = [];
  String? img64;
  String? foto;

  File? image;

  // get value => 'Gallery';
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    final dateController1 = TextEditingController();
    final dateController2 = TextEditingController();
    DateTime selectedDate = DateTime.now();
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1960),
          lastDate: DateTime(2050));
      if (picked != null && picked != selectedDate) {
        setState(() {
          // selectedDate = picked;
          dateController1.text = DateFormat('yyyy-MM-dd').format(picked);
        });
      }
    }
    Future<void> _selectDate2(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1960),
          lastDate: DateTime(2050));
      if (picked != null && picked != selectedDate) {
        setState(() {
          // selectedDate = picked;
          dateController2.text = DateFormat('yyyy-MM-dd').format(picked);
        });
      }
    }

    final double height = MediaQuery.of(context).size.height;
    final double widht = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider<TambahSertifikatViewModel>(
      create: (context) => TambahSertifikatViewModel(context),
      child: Builder(
          builder: (context){
            return Consumer<TambahSertifikatViewModel>(
                builder: (context, viewModel, child){
                  return Scaffold(
                    resizeToAvoidBottomInset: false,
                    // appBar: AppBar(
                    //   backgroundColor: Colors.green,
                    //   title: const Text('Tambah Kebun'),
                    // ),
                    body: Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 800,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(42),
                              // shape: BoxShape.rectangle,
                              border: Border.all(width: 2.0, color: Colors.deepOrange),
                            ),
                            child: TextButton(
                              child: const Text(
                                'Tambah Sertifikat',
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                              onPressed: () async {
                                setState(() {
                                  showDialog(context: (context), builder: (_)=>
                                      AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                        titlePadding: const EdgeInsets.all(0),
                                        title: Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 2),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                const Text("Tambah Sertifikat", style: TextStyle(color: Colors.white),),
                                                IconButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop();},
                                                    icon: const Icon(Icons.close, color: Colors.white,))
                                              ],),
                                          ),
                                        ),
                                        content: SingleChildScrollView(
                                          // height: 400,
                                          // width:  widht*10,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    children: [
                                                      const TextSpan(
                                                        text: 'Tipe Sertifikasi',
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
                                                width: 250,
                                                height: 60,
                                                child: DropdownButtonFormField(
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
                                                    hint: Text("Pilih Tipe Sertifikat"),
                                                    isExpanded: true,
                                                    // value: selectedProvinsi,
                                                    items: viewModel.DataSertif.map((value) {
                                                      return DropdownMenuItem(
                                                          value: value.sertifikasiId.toString(),
                                                          child: Text (value.sertifikasiName.toString())
                                                      );
                                                    }).toList(),
                                                    onChanged: (newValue){
                                                      setState(() {
                                                        // print(newValue.toString());
                                                        // selectedProvinsi = newValue!;
                                                        // selectedKabKota = null;
                                                        // selectedKec = null;
                                                        // selectedKel = null;
                                                      });
                                                      // viewModel.getKabKota(selectedProvinsi, context);
                                                    }),
                                              ),
                                              const SizedBox(height: 8,),
                                              RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    children: [
                                                      const TextSpan(
                                                        text: 'Nomor Sertifikasi',
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
                                                width: 250,
                                                height: 60,
                                                child: TextFormField(
                                                  keyboardType: TextInputType.number,
                                                  style: const TextStyle(color: Colors.black45),
                                                  // controller: dataAlamatController,
                                                  decoration: const InputDecoration(
                                                    hintText: "Nomor Sertifikasi", hintStyle: TextStyle(
                                                    fontFamily: "Poppins",
                                                  ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(32)),
                                                      borderSide: BorderSide(color: Colors.grey, width: 2),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(32)),
                                                      borderSide: BorderSide(color: Colors.grey, width: 2),
                                                    ),
                                                  ),
                                                  // validator: (value) {
                                                  //   if (value!.isEmpty) {
                                                  //     return "Data Tidak Boleh Kosong !";
                                                  //   } else {
                                                  //     return null;
                                                  //   }
                                                  // },
                                                ),
                                              ),
                                              const SizedBox(height: 8,),
                                              RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    children: [
                                                      const TextSpan(
                                                        text: 'Masa Berlaku',
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
                                                                text: 'Dari Tanggal',
                                                                style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                                              ),
                                                              WidgetSpan(
                                                                child: Transform.translate(
                                                                  offset: const Offset(2, -4),
                                                                ),
                                                              ),
                                                            ]),
                                                      ),
                                                      const SizedBox(height: 8,),
                                                      SizedBox(
                                                        width: 120,
                                                        child: TextFormField(
                                                          onTap: () {
                                                            setState(() {
                                                              _selectDate(context);
                                                            });
                                                          },
                                                          style: const TextStyle(color: Colors.black),
                                                          controller: dateController1,
                                                          decoration: InputDecoration(
                                                            focusedBorder: const OutlineInputBorder(
                                                                borderRadius: BorderRadius.all(Radius.circular(32)),
                                                                borderSide: BorderSide(color: Colors.black12, width: 0.0)
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius.all(Radius.circular(32)),
                                                                borderSide: BorderSide(color: Colors.black12, width: 0.0)
                                                            ),
                                                            hintText: "DD/MM/YYYY",
                                                            suffixIcon: IconButton(
                                                              icon: Icon(Icons.close),
                                                              onPressed: () {
                                                                dateController1.clear();
                                                                // setState(() {
                                                                //   Navigator.of(context).pop();
                                                                // });
                                                              },
                                                              color: Colors.black,
                                                            ),
                                                            labelStyle: const TextStyle(
                                                                color: Colors.grey
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                            children: [
                                                              const TextSpan(
                                                                text: 'Sampai Tanggal',
                                                                style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                                              ),
                                                              WidgetSpan(
                                                                child: Transform.translate(
                                                                  offset: const Offset(2, -4),
                                                                ),
                                                              ),
                                                            ]),
                                                      ),
                                                      const SizedBox(height: 8,),
                                                      SizedBox(
                                                        width: 120,
                                                        child: TextFormField(
                                                          onTap: () {
                                                            setState(() {
                                                              _selectDate2(context);
                                                            });
                                                          },
                                                          style: const TextStyle(color: Colors.black),
                                                          controller: dateController2,
                                                          decoration: InputDecoration(
                                                            focusedBorder: const OutlineInputBorder(
                                                                borderRadius: BorderRadius.all(Radius.circular(32)),
                                                                borderSide: BorderSide(color: Colors.black12, width: 0.0)
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius.all(Radius.circular(32)),
                                                                borderSide: BorderSide(color: Colors.black12, width: 0.0)
                                                            ),
                                                            hintText: "DD/MM/YYYY",
                                                            suffixIcon: IconButton(
                                                              icon: Icon(Icons.close),
                                                              onPressed: () {
                                                                dateController2.clear();
                                                                // setState(() {
                                                                //   Navigator.of(context).pop();
                                                                // });
                                                              },
                                                              color: Colors.black,
                                                            ),
                                                            labelStyle: const TextStyle(
                                                                color: Colors.grey
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8,),
                                              RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    children: [
                                                      const TextSpan(
                                                        text: 'Unggah Sertifikat',
                                                        style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                                      ),
                                                      WidgetSpan(
                                                        child: Transform.translate(
                                                          offset: const Offset(2, -4),
                                                        ),
                                                      )
                                                    ]),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(height: 16,),
                                                      Container(
                                                        height: height*0.1,
                                                        width: widht*0.4,
                                                        decoration: BoxDecoration(
                                                          color: Colors.transparent,
                                                        ),
                                                        child: image != null ?
                                                        Container(
                                                          height: 50,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                            // shape: BoxShape.rectangle,
                                                            image: DecorationImage(
                                                                image: new FileImage(image!), fit: BoxFit.cover),
                                                          ),
                                                        ) : Icon(Icons.photo_size_select_actual_outlined,
                                                          size: 50,
                                                          color: Colors.black,),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(16),
                                                          shape: BoxShape.rectangle,
                                                          border: Border.all(width: 2.0, color: Colors.deepOrange),
                                                        ),
                                                        child: TextButton(
                                                          child: const Text(
                                                            'Unggah',
                                                            style: TextStyle(color: Colors.deepOrange),
                                                          ),
                                                          onPressed: () async {
                                                            setState(() {
                                                              showDialog(
                                                                  context: context, builder: (_) =>
                                                                  AlertDialog(
                                                                    shape: const RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                                    title: Container(
                                                                      decoration: const BoxDecoration(
                                                                        // color: Colors.green,
                                                                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))),
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(0),
                                                                        child: Row(
                                                                          children: [
                                                                            const Text("Pilih Aksi", style: TextStyle(color: Colors.black),),
                                                                            // IconButton(
                                                                            //     onPressed: () {
                                                                            //       Navigator.of(context).pop();},
                                                                            //     icon: const Icon(Icons.close, color: Colors.white,))
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    content: SizedBox(
                                                                      width: 400,
                                                                      height: 100,
                                                                      child: Column(
                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          const Expanded(child: Divider(thickness: 2,color: Colors.red,)),
                                                                          TextButton(
                                                                            onPressed: (){
                                                                              pickImage(ImageSource.gallery);
                                                                            }, child: Text("Ambil Gambar dari Gallery",style:
                                                                          TextStyle(color: Colors.black),),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: (){
                                                                              pickImage(ImageSource.camera);
                                                                            }, child: Text("Ambil Gambar dari Camera",style:
                                                                          TextStyle(color: Colors.black),),
                                                                          ),
                                                                          // DropdownMenuItem(
                                                                          //   child: Text("Ambil Gambar dari Gallery"),
                                                                          //   value: 'Gallery',
                                                                          // ),
                                                                          // DropdownMenuItem(
                                                                          //   child: Text("Ambil Gambar dari Camera"),
                                                                          //   value: 'Camera',
                                                                          // ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ));
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [ Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                                width: 120,
                                                height: 50,
                                                child: OutlinedButton(
                                                    style: OutlinedButton.styleFrom(
                                                      side: const BorderSide(width: 1.0, color: Colors.orange),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32.0)
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Tidak, Ubah", style: TextStyle(color: Colors.orange),)
                                                )
                                            ),
                                            Container(
                                              // margin: EdgeInsets.all(20),
                                              width: 120,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  colors: [Colors.orange, Colors.deepOrange],
                                                  begin: FractionalOffset.bottomLeft,
                                                  end: FractionalOffset.topRight,
                                                ),
                                                borderRadius: BorderRadius.circular(32),
                                              ),
                                              child: TextButton(
                                                child: const Text('Ya,Benar',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  // String noRes = viewModel.listPengiriman[index].noReservasi.toString();
                                                  // String petaniId = viewModel.listPengiriman[index].noReservasi.toString();
                                                  // String tanggal = dateController.text.toString();
                                                  // String waktu = timeController.text.toString();
                                                  // viewModel.getUpdateReservasi(noRes, petaniId, tanggal, waktu, context);
                                                  // Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                          const SizedBox(height: 16,),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: viewModel.listSertif.length,
                                              itemBuilder: (context,index) {
                                                return Container(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(viewModel.listSertif[index].nama_sertif.toString(),),
                                                      SizedBox(height: 12,),
                                                      Text(viewModel.listSertif[index].no_sertif.toString(),),
                                                      SizedBox(height: 12,),
                                                      // Row(
                                                      //   children: [
                                                      //     IconButton(onPressed: (){
                                                      //       // Navigator.push(context, MaterialPageRoute(builder: builder))
                                                      //     },
                                                      //         // icon: icon)
                                                      //   ],
                                                      // )
                                                    ],
                                                  ),
                                                );
                                              }
                                          )
                                        ],
                                      ),
                                  );
                                });
                              },
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         RichText(
                          //           textAlign: TextAlign.center,
                          //           text: TextSpan(
                          //               children: [
                          //                 const TextSpan(
                          //                   text: 'Luas Kebun',
                          //                   style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                          //                 ),
                          //                 WidgetSpan(
                          //                   child: Transform.translate(
                          //                     offset: const Offset(2, -4),
                          //                     child: const Text(
                          //                       '*',
                          //                       //superscript is usually smaller in size
                          //                       textScaleFactor: 1,
                          //                       style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          //                     ),
                          //                   ),
                          //                 )
                          //               ]),
                          //         ),
                          //         const SizedBox(height: 8,),
                          //         SizedBox(
                          //           width: 170,
                          //           height: 60,
                          //           child: TextFormField(
                          //             keyboardType: TextInputType.number,
                          //             style: const TextStyle(color: Colors.black45),
                          //             // controller: dataAlamatController,
                          //             decoration: const InputDecoration(
                          //               hintText: "Luas Kebun", hintStyle: TextStyle(
                          //               fontFamily: "Poppins",
                          //             ),
                          //               prefixIcon: Padding(padding: EdgeInsets.fromLTRB(6, 20, 0, 20),
                          //                   child: Text('HA',)),
                          //               enabledBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.all(Radius.circular(32)),
                          //                 borderSide: BorderSide(color: Colors.grey, width: 2),
                          //               ),
                          //               focusedBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.all(Radius.circular(32)),
                          //                 borderSide: BorderSide(color: Colors.grey, width: 2),
                          //               ),
                          //             ),
                          //             // validator: (value) {
                          //             //   if (value!.isEmpty) {
                          //             //     return "Data Tidak Boleh Kosong !";
                          //             //   } else {
                          //             //     return null;
                          //             //   }
                          //             // },
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         RichText(
                          //           textAlign: TextAlign.center,
                          //           text: TextSpan(
                          //               children: [
                          //                 const TextSpan(
                          //                   text: 'Jenis Bibit',
                          //                   style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                          //                 ),
                          //                 WidgetSpan(
                          //                   child: Transform.translate(
                          //                     offset: const Offset(2, -4),
                          //                     child: const Text(
                          //                       '*',
                          //                       //superscript is usually smaller in size
                          //                       textScaleFactor: 1,
                          //                       style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          //                     ),
                          //                   ),
                          //                 )
                          //               ]),
                          //         ),
                          //         const SizedBox(height: 8,),
                          //         SizedBox(
                          //           width: 170,
                          //           height: 60,
                          //           child: DropdownButtonFormField(
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
                          //               // borderRadius: BorderRadius.all(Radius.circular(32)),
                          //               hint: Text("Pilih Jenis Bibit"),
                          //               isExpanded: true,
                          //               // value: selectedProvinsi,
                          //               items: viewModel.listKebun.map((value) {
                          //                 return DropdownMenuItem(
                          //                     value: value.jenisBibitId.toString(),
                          //                     child: Text (value.jenisBibitName.toString())
                          //                 );
                          //               }).toList(),
                          //               onChanged: (newValue){
                          //                 setState(() {
                          //                   // print(newValue.toString());
                          //                   // selectedProvinsi = newValue!;
                          //                   // selectedKabKota = null;
                          //                   // selectedKec = null;
                          //                   // selectedKel = null;
                          //                 });
                          //                 // viewModel.getKabKota(selectedProvinsi, context);
                          //               }),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 8,),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         RichText(
                          //           textAlign: TextAlign.center,
                          //           text: TextSpan(
                          //               children: [
                          //                 const TextSpan(
                          //                   text: 'Tipe Lahan',
                          //                   style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                          //                 ),
                          //                 WidgetSpan(
                          //                   child: Transform.translate(
                          //                     offset: const Offset(2, -4),
                          //                     child: const Text(
                          //                       '*',
                          //                       //superscript is usually smaller in size
                          //                       textScaleFactor: 1,
                          //                       style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          //                     ),
                          //                   ),
                          //                 )
                          //               ]),
                          //         ),
                          //         const SizedBox(height: 8,),
                          //         SizedBox(
                          //           width: 170,
                          //           height: 60,
                          //           child: DropdownButtonFormField(
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
                          //               // borderRadius: BorderRadius.all(Radius.circular(32)),
                          //               hint: Text("Pilih Tipe Lahan"),
                          //               isExpanded: true,
                          //               // value: selectedProvinsi,
                          //               items: viewModel.listKebun.map((value) {
                          //                 return DropdownMenuItem(
                          //                     value: value.statusLahanId.toString(),
                          //                     child: Text (value.statusLahanName.toString())
                          //                 );
                          //               }).toList(),
                          //               onChanged: (newValue){
                          //                 setState(() {
                          //                   // print(newValue.toString());
                          //                   // selectedProvinsi = newValue!;
                          //                   // selectedKabKota = null;
                          //                   // selectedKec = null;
                          //                   // selectedKel = null;
                          //                 });
                          //                 // viewModel.getKabKota(selectedProvinsi, context);
                          //               }),
                          //         ),
                          //       ],
                          //     ),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         RichText(
                          //           textAlign: TextAlign.center,
                          //           text: TextSpan(
                          //               children: [
                          //                 const TextSpan(
                          //                   text: 'Jenis Bibit',
                          //                   style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                          //                 ),
                          //                 WidgetSpan(
                          //                   child: Transform.translate(
                          //                     offset: const Offset(2, -4),
                          //                     child: const Text(
                          //                       '*',
                          //                       //superscript is usually smaller in size
                          //                       textScaleFactor: 1,
                          //                       style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          //                     ),
                          //                   ),
                          //                 )
                          //               ]),
                          //         ),
                          //         const SizedBox(height: 8,),
                          //         SizedBox(
                          //           width: 170,
                          //           height: 60,
                          //           child: TextFormField(
                          //             keyboardType: TextInputType.number,
                          //             style: const TextStyle(color: Colors.black45),
                          //             // controller: dataAlamatController,
                          //             decoration: const InputDecoration(
                          //               hintText: "Luas Tanam", hintStyle: TextStyle(
                          //               fontFamily: "Poppins",
                          //             ),
                          //               enabledBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.all(Radius.circular(32)),
                          //                 borderSide: BorderSide(color: Colors.grey, width: 2),
                          //               ),
                          //               focusedBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.all(Radius.circular(32)),
                          //                 borderSide: BorderSide(color: Colors.grey, width: 2),
                          //               ),
                          //             ),
                          //             // validator: (value) {
                          //             //   if (value!.isEmpty) {
                          //             //     return "Data Tidak Boleh Kosong !";
                          //             //   } else {
                          //             //     return null;
                          //             //   }
                          //             // },
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 8,),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         RichText(
                          //           textAlign: TextAlign.center,
                          //           text: TextSpan(
                          //               children: [
                          //                 const TextSpan(
                          //                   text: 'Jumlah Pohon',
                          //                   style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                          //                 ),
                          //                 WidgetSpan(
                          //                   child: Transform.translate(
                          //                     offset: const Offset(2, -4),
                          //                     child: const Text(
                          //                       '*',
                          //                       //superscript is usually smaller in size
                          //                       textScaleFactor: 1,
                          //                       style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          //                     ),
                          //                   ),
                          //                 )
                          //               ]),
                          //         ),
                          //         const SizedBox(height: 8,),
                          //         SizedBox(
                          //           width: 170,
                          //           height: 60,
                          //           child: TextFormField(
                          //             keyboardType: TextInputType.number,
                          //             style: const TextStyle(color: Colors.black45),
                          //             // controller: dataAlamatController,
                          //             decoration: const InputDecoration(
                          //               hintText: "Luas Tanam", hintStyle: TextStyle(
                          //               fontFamily: "Poppins",
                          //             ),
                          //               enabledBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.all(Radius.circular(32)),
                          //                 borderSide: BorderSide(color: Colors.grey, width: 2),
                          //               ),
                          //               focusedBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.all(Radius.circular(32)),
                          //                 borderSide: BorderSide(color: Colors.grey, width: 2),
                          //               ),
                          //             ),
                          //             // validator: (value) {
                          //             //   if (value!.isEmpty) {
                          //             //     return "Data Tidak Boleh Kosong !";
                          //             //   } else {
                          //             //     return null;
                          //             //   }
                          //             // },
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         RichText(
                          //           textAlign: TextAlign.center,
                          //           text: TextSpan(
                          //               children: [
                          //                 const TextSpan(
                          //                   text: 'Produksi Per Bulan',
                          //                   style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                          //                 ),
                          //                 WidgetSpan(
                          //                   child: Transform.translate(
                          //                     offset: const Offset(2, -4),
                          //                     child: const Text(
                          //                       '*',
                          //                       //superscript is usually smaller in size
                          //                       textScaleFactor: 1,
                          //                       style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          //                     ),
                          //                   ),
                          //                 )
                          //               ]),
                          //         ),
                          //         const SizedBox(height: 8,),
                          //         SizedBox(
                          //           width: 170,
                          //           height: 60,
                          //           child: TextFormField(
                          //             keyboardType: TextInputType.number,
                          //             style: const TextStyle(color: Colors.black45),
                          //             // controller: dataAlamatController,
                          //             decoration: const InputDecoration(
                          //               prefixIcon: Padding(padding: EdgeInsets.fromLTRB(4, 20, 4, 20),
                          //                   child: Text('Ton/Bulan',)
                          //               ),
                          //               hintText: "Produksi Per Bulan", hintStyle: TextStyle(
                          //               fontFamily: "Poppins",
                          //             ),
                          //               enabledBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.all(Radius.circular(32)),
                          //                 borderSide: BorderSide(color: Colors.grey, width: 2),
                          //               ),
                          //               focusedBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.all(Radius.circular(32)),
                          //                 borderSide: BorderSide(color: Colors.grey, width: 2),
                          //               ),
                          //             ),
                          //             // validator: (value) {
                          //             //   if (value!.isEmpty) {
                          //             //     return "Data Tidak Boleh Kosong !";
                          //             //   } else {
                          //             //     return null;
                          //             //   }
                          //             // },
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 8,),
                          // RichText(
                          //   textAlign: TextAlign.center,
                          //   text: TextSpan(
                          //       children: [
                          //         const TextSpan(
                          //           text: 'Foto Kebun',
                          //           style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                          //         ),
                          //         WidgetSpan(
                          //           child: Transform.translate(
                          //             offset: const Offset(2, -4),
                          //             child: const Text(
                          //               '*',
                          //               //superscript is usually smaller in size
                          //               textScaleFactor: 1,
                          //               style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          //             ),
                          //           ),
                          //         )
                          //       ]),
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         SizedBox(height: 16,),
                          //         // Icon(Icons.add_photo_alternate_outlined, size: 150,),
                          //         Container(
                          //           height: height*0.2,
                          //           width: widht*0.5,
                          //           decoration: BoxDecoration(
                          //             color: Colors.transparent,
                          //           ),
                          //           child: image != null ?
                          //           Container(
                          //             height: 100,
                          //             width: 200,
                          //             decoration: BoxDecoration(
                          //               // shape: BoxShape.rectangle,
                          //               image: DecorationImage(
                          //                   image: new FileImage(image!), fit: BoxFit.cover),
                          //             ),
                          //           ) : Icon(Icons.photo_size_select_actual_outlined,
                          //             size: 150,
                          //             color: Colors.black,),
                          //         ),
                          //       ],
                          //     ),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Container(
                          //           width: 150,
                          //           height: 50,
                          //           decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(16),
                          //             shape: BoxShape.rectangle,
                          //             border: Border.all(width: 2.0, color: Colors.orange),
                          //           ),
                          //           child: TextButton(
                          //             child: const Text(
                          //               'Unggah',
                          //               style: TextStyle(color: Colors.orange),
                          //             ),
                          //             onPressed: () async {
                          //               setState(() {
                          //                 showDialog(
                          //                     context: context, builder: (_) =>
                          //                     AlertDialog(
                          //                       shape: const RoundedRectangleBorder(
                          //                           borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          //                       title: Container(
                          //                         decoration: const BoxDecoration(
                          //                           // color: Colors.green,
                          //                             borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))),
                          //                         child: Padding(
                          //                           padding: const EdgeInsets.all(0),
                          //                           child: Row(
                          //                             children: [
                          //                               const Text("Pilih Aksi", style: TextStyle(color: Colors.black),),
                          //                               // IconButton(
                          //                               //     onPressed: () {
                          //                               //       Navigator.of(context).pop();},
                          //                               //     icon: const Icon(Icons.close, color: Colors.white,))
                          //                             ],
                          //                           ),
                          //                         ),
                          //                       ),
                          //                       content: SizedBox(
                          //                         width: 400,
                          //                         height: 100,
                          //                         child: Column(
                          //                           mainAxisAlignment: MainAxisAlignment.start,
                          //                           crossAxisAlignment: CrossAxisAlignment.start,
                          //                           children: [
                          //                             const Expanded(child: Divider(thickness: 2,color: Colors.red,)),
                          //                             // new DropdownButton(
                          //                             //     items: <DropdownMenuItem<int>>[
                          //                             //       new DropdownMenuItem(
                          //                             //         child: new Text('Ambil Gambar dari Gallery'),
                          //                             //         value: 0,
                          //                             //       ),
                          //                             //       new DropdownMenuItem(
                          //                             //         child: new Text('Ambil Gambar dari Camera'),
                          //                             //         value: 1,
                          //                             //       ),
                          //                             //       ],
                          //                             //     onChanged: (value) {
                          //                             //       setState(() {
                          //                             //
                          //                             //       });
                          //                             //     })
                          //                             TextButton(
                          //                               onPressed: (){
                          //                                 pickImage(ImageSource.gallery);
                          //                               }, child: Text("Ambil Gambar dari Gallery",style:
                          //                             TextStyle(color: Colors.black),),
                          //                             ),
                          //                             TextButton(
                          //                               onPressed: (){
                          //                                 pickImage(ImageSource.camera);
                          //                               }, child: Text("Ambil Gambar dari Camera",style:
                          //                             TextStyle(color: Colors.black),),
                          //                             ),
                          //                             // DropdownMenuItem(
                          //                             //   child: Text("Ambil Gambar dari Gallery"),
                          //                             //   value: 'Gallery',
                          //                             // ),
                          //                             // DropdownMenuItem(
                          //                             //   child: Text("Ambil Gambar dari Camera"),
                          //                             //   value: 'Camera',
                          //                             // ),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                     ));
                          //               });
                          //             },
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 20,),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Container(
                          //       width: 150,
                          //       height: 50,
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(16),
                          //         shape: BoxShape.rectangle,
                          //         border: Border.all(width: 2.0, color: Colors.orange),
                          //       ),
                          //       child: TextButton(
                          //         child: const Text(
                          //           'Kembali',
                          //           style: TextStyle(color: Colors.orange),
                          //         ),
                          //         onPressed: () {
                          //
                          //         },
                          //       ),
                          //     ),
                          //     // SizedBox(
                          //     //     width: 150,
                          //     //     height: 50,
                          //     //     child: OutlinedButton(
                          //     //         style: OutlinedButton.styleFrom(
                          //     //           side: BorderSide(width: 1.0, color: Colors.orange),
                          //     //         ),
                          //     //         onPressed: () {
                          //     //         },
                          //     //         child: const Text("Batal", style: TextStyle(color: Colors.orange),)
                          //     //     )
                          //     // ),
                          //     Container(
                          //       // margin: EdgeInsets.all(20),
                          //       width: 150,
                          //       height: 50,
                          //       decoration: BoxDecoration(
                          //         gradient: const LinearGradient(
                          //           colors: [Colors.orange, Colors.deepOrange],
                          //           begin: FractionalOffset.bottomLeft,
                          //           end: FractionalOffset.topRight,
                          //         ),
                          //         borderRadius: BorderRadius.circular(16),
                          //       ),
                          //       child: TextButton(
                          //         child: const Text(
                          //           'Selanjutnya',
                          //           style: TextStyle(color: Colors.white),
                          //         ),
                          //         onPressed: () {
                          //
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    persistentFooterButtons: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
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
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
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
                                      'Kirim',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {

                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                });
          }),
    );
  }
}