import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/model/response_transaksi_model.dart';
// import 'package:taniku/view/TransaksiPages.dart';
import 'package:taniku/viewmodel/kirimpersediaan_viewmodel.dart';



class KirimPersediaan extends StatefulWidget {
  final Data transaksi;
  const KirimPersediaan({Key? key, required this.transaksi}) : super(key: key);

  @override
  State<KirimPersediaan> createState() => _KirimPersediaanState();
}

class _KirimPersediaanState extends State<KirimPersediaan> {
  final pabrikController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2099));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = selectedDate.toString().substring(0, 10);
      });
    }
  }

  Future<void>_selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTime,
    initialEntryMode: TimePickerEntryMode.dial);
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        timeController.text = selectedTime.toString().substring(10, 15);
      });
    }
  }

  @override
  void initState() {
    pabrikController.text = widget.transaksi.namaPabrik.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KirimPersediaanViewModel>(
        create: (context) => KirimPersediaanViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer(
              builder: (context, viewModel, child) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text("Kirim Persediaan Stock", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    actions: [
                      IconButton(
                        color: Colors.white,
                        icon: const Icon(
                            Icons.notifications,
                        ),
                        onPressed: (){
                          print("notification button");
                        },
                      ),
                    ],
                  ),
                  body: Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Nama PKS", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 8,),
                        TextFormField(
                          controller: pabrikController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32)),
                              borderSide: BorderSide(color: Colors.black12, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32)),
                              borderSide: BorderSide(color: Colors.black12, width: 0.0)
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                          ),
                        ),
                        SizedBox(height: 16,),
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
                                          text: 'Tanggal Pengiriman',
                                          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                        ),
                                        WidgetSpan(
                                            child: Transform.translate(
                                                offset: const Offset(2, -4),
                                              child: const Text(
                                                '*',
                                                textScaleFactor: 1,
                                                style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                        )
                                      ]
                                    ),
                                ),
                                const SizedBox(height: 8,),
                                SizedBox(
                                  width: 180,
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.black54),
                                    controller: dateController,
                                    decoration: InputDecoration(
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(32)),
                                        borderSide: BorderSide(color: Colors.black54, width: 0.0)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(32)),
                                        borderSide: BorderSide(color: Colors.black54, width: 0.0)
                                      ),
                                      labelText: "DD/MM/YYYY",
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.date_range_rounded),
                                        onPressed: () {
                                          setState(() {
                                            _selectDate(context);
                                          });
                                        },
                                        color: Colors.grey,
                                      ),
                                      labelStyle: const TextStyle(
                                        color: Colors.grey
                                      )
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16,),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Jam Pengiriman',
                                          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                        ),
                                        WidgetSpan(
                                          child: Transform.translate(
                                            offset: const Offset(2, -4),
                                            child: const Text(
                                              '*',
                                              textScaleFactor: 1,
                                              style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      ]
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                SizedBox(
                                  width: 180,
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.black54),
                                    controller: timeController,
                                    decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                            borderSide: BorderSide(color: Colors.black54, width: 0.0)
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                            borderSide: BorderSide(color: Colors.black54, width: 0.0)
                                        ),
                                        labelText: "HH:MM",
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.date_range_rounded),
                                          onPressed: () {
                                            setState(() {
                                              _selectTime(context);
                                            });
                                          },
                                          color: Colors.grey,
                                        ),
                                        labelStyle: const TextStyle(
                                            color: Colors.grey
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 8,),
                        const Text("Estimasi Tonasi (/KG)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(height: 8,),
                        TextFormField(
                          controller: timeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(32)),
                                  borderSide: BorderSide(color: Colors.black54, width: 0.0)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(32)),
                                  borderSide: BorderSide(color: Colors.black54, width: 0.0)
                              ),
                          ),
                        ),
                        SizedBox(height: 400,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(width: 1.0, color: Colors.green),
                                ),
                                  onPressed: (){}, child: const Text("Batal", style: TextStyle(color: Colors.green),)
                              )
                            ),
                            Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(

                              ),
                            )
                          ],
                        )
                      ],
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

