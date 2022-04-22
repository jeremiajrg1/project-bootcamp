import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/view/TambahAlamat_screen.dart';
import 'package:taniku/view/TambahDokumen_screen.dart';
import 'package:taniku/view/TambahKebun_screen.dart';
import 'package:taniku/view/TambahSertifikat_screen.dart';

class TabControllerss extends StatefulWidget {

  const TabControllerss({Key? key,
  }) : super(key: key);

  @override
  State<TabControllerss> createState() => _TabControllerssState();
}

class _TabControllerssState extends State<TabControllerss> {

  @override
  Widget build(BuildContext context) {
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
              TambahAlamatScreen(),
              TambahKebun(),
              TambahDokumenScreen(),
              TambahSertifikat(),
              // TambahAlamat(),
              // TambahKebun(),
              // TambahDokumen(),
              // TambahSertifikat(),
            ],
          ),
        ),
        // appBar: AppBar(
        //   title: const Text('Tambah Kebun'),
        //   backgroundColor: Colors.green,
        //   flexibleSpace: Column(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       TabBar(
        //         indicator: BoxDecoration(
        //             borderRadius: BorderRadius.all(Radius.circular(18)),
        //             color: Colors.deepOrange),
        //         isScrollable: true,
        //           tabs: [
        //               Tab(child: Text(
        //                 "Alamat",
        //                 style: TextStyle(
        //                   fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins",
        //                 ),),),
        //               Tab(child: Text(
        //                 "Kebun", style: TextStyle(
        //                 fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins",
        //               ),),),
        //               Tab(child: Text(
        //                 "Dokumen", style: TextStyle(
        //                 fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins",
        //               ),),),
        //               Tab(child: Text(
        //                 "Sertifikat", style: TextStyle(
        //                 fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins",
        //               ),),),
        //             ],
        //       )
        //     ],
        //   ),
        // ),
        // // appBar: AppBar(
        // //   backgroundColor: Colors.green,
        // //   bottom: const TabBar(
        // //     onTap: (){
        // //
        // //     },
        // //     // controller: _controller,
        // //     indicator: BoxDecoration(
        // //         borderRadius: BorderRadius.all(Radius.circular(30)),
        // //         color: Colors.deepOrange),
        // //     isScrollable: true,
        // //     tabs: [
        // //       Tab(child: Text(
        // //         "Alamat",
        // //         style: TextStyle(
        // //           fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins",
        // //         ),),),
        // //       Tab(child: Text(
        // //         "Kebun", style: TextStyle(
        // //         fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins",
        // //       ),),),
        // //       Tab(child: Text(
        // //         "Dokumen", style: TextStyle(
        // //         fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins",
        // //       ),),),
        // //       Tab(child: Text(
        // //         "Sertifikat", style: TextStyle(
        // //         fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins",
        // //       ),),),
        // //     ],
        // //   ),
        // //   title: const Text('Tambah Kebun'),
        // // ),
        // body: const TabBarView(
        //   children: <Widget> [
        //     TambahKebun(),
        //     TransaksiPages(),
        //     FakturPages(),
        //     PengirimanPages(),
        //     // Text("Alamat"),
        //     // Text("Kebun"),
        //     // Text("Dokumen"),
        //     // Text("Sertifikat"),
        //   ],
        // ),
      ),
    );
  }
}