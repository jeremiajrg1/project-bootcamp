import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                                height: 350,
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
                                            isi: viewModel.dataHome[index].newsDate.toString())
                                        )
                                        // print("data : ${viewModel.dataHome[index].newsTitle
                                        //     .toString()}");
                                        );
                                      },
                                      child: Container(
                                          width: 150,
                                          alignment: Alignment.center,
                                          child: Card(
                                            child: Container(
                                              width: double.infinity,
                                              margin: const EdgeInsets.all(12),
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
                                                ],
                                              ),
                                            ),
                                          )
                                      ),
                                    );
                                  },
                                )
                            ),

                            //-------------------- ListView Vertical ---------------------
                            // SizedBox(height: 16,),
                            // const Text("Data Bulan Vertical",
                            //   style: TextStyle(fontWeight: FontWeight.bold),),
                            // const SizedBox(height: 16,),
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   physics: const NeverScrollableScrollPhysics(),
                            //   itemBuilder: (context, index) {
                            //     return Card(
                            //       child: Container(
                            //         margin: const EdgeInsets.all(8),
                            //         child: Row(
                            //           children: [
                            //             Image.network(dataListApi[index].avatar.toString()),
                            //             const SizedBox(width: 12,),
                            //             Column(
                            //               crossAxisAlignment: CrossAxisAlignment.start,
                            //               children: [
                            //                 Text(dataListApi[index].firstName.toString(),
                            //                     style: const TextStyle(fontSize: 16,
                            //                         fontWeight: FontWeight.bold)),
                            //                 const SizedBox(height: 8,),
                            //                 Text(dataListApi[index].email.toString()),
                            //               ],
                            //             )
                            //           ],
                            //         ),
                            //       ),
                            //     );
                            //   },
                            //   itemCount: dataListApi.length,
                            // ),
                          ],
                        ),
                      ),
                    )
                );
              }
          );
        }
      ),
    );
  }
}
