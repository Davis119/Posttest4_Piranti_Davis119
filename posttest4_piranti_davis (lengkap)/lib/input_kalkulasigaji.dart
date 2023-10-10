
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        //useMaterial3: true,
      ),
      home: const KalkulasiGaji(title: 'KALKULASI GAJI'),
    );
  }
}

class KalkulasiGaji extends StatefulWidget {
  const KalkulasiGaji({super.key, required this.title});




  final String title;

  @override
  State<KalkulasiGaji> createState() => _KalkulasiGaji();
}

class _KalkulasiGaji extends State<KalkulasiGaji> {
  TextEditingController Gaji = TextEditingController();
  TextEditingController HariKerja = TextEditingController();
  TextEditingController Sakit = TextEditingController();
  TextEditingController Tanpaketerangan = TextEditingController();
  TextEditingController Izin = TextEditingController();
  TextEditingController Tunjangan = TextEditingController();
  TextEditingController GajiBersih = TextEditingController();


  // Fungsi untuk mengosongkan input teks
  void reset() {
    Gaji.text = '';
    HariKerja.text = '';
    Sakit.text = '';
    Tanpaketerangan.text = '';
    Izin.text = '';
    Tunjangan.text = '';
    GajiBersih.text = '';
  }


  void hitungGajiBersih() {
    // Deklarasi variabel gajiPokok, hari Kerja, sakit, tanpa Keterangan, izin, dan tunjangan
    double gajiPokok = double.tryParse(Gaji.text) ?? 0;
    int hariKerja = int.tryParse(HariKerja.text) ?? 0;
    int sakit = int.tryParse(Sakit.text) ?? 0;
    int tanpaKeterangan = int.tryParse(Tanpaketerangan.text) ?? 0;
    int izin = int.tryParse(Izin.text) ?? 0;

    // variabel utk hitung total potongan gaji
    double totalPotonganGaji = (sakit * 20000) + (izin * 5000) + (tanpaKeterangan * 30000);

    // variabel utk hitung tunjangan
    double tunjangan = (hariKerja * 50000) - totalPotonganGaji;

    // variabel utk hitung gaji bersih
    double gajiBersih = gajiPokok + tunjangan;

    //utk membulatkan bilangan agar lebih sederhana
    GajiBersih.text = gajiBersih.toStringAsFixed(0); //disini kita menggunakan toStringAsFixed(0)
  }                                                  //dibandingkan toString() agar bisa mengurangi
  //jumlah angka 0 di belakang angka biar
  //tidak membingungkan
  void hitungTunjangan(){
    // Deklarasi variabel gajiPokok, hariKerja, sakit, tanpaKeterangan, izin, dan tunjangan
    double gajiPokok = double.tryParse(Gaji.text) ?? 0;
    int hariKerja = int.tryParse(HariKerja.text) ?? 0;
    int sakit = int.tryParse(Sakit.text) ?? 0;
    int tanpaKeterangan = int.tryParse(Tanpaketerangan.text) ?? 0;
    int izin = int.tryParse(Izin.text) ?? 0;


    double totalPotonganGaji = (sakit * 20000) + (izin * 5000) + (tanpaKeterangan * 30000);


    double tunjangan = (hariKerja * 50000) - totalPotonganGaji;



    Tunjangan.text = tunjangan.toStringAsFixed(0);

  }






  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column( //disini kita pake Column agar TextFormFieldnya ke bawah semua
          children: [
            Container(
              width: 380, //disini kita atur lebar containernya jadi 380 agar lebih proporsional
              child: Padding(  //sesuai windows kita
                padding: EdgeInsets.only(right: 10), //disini kita menggunakan padding utk mengatur posisinya
                child: TextFormField(                //kekanan
                  controller: Gaji,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Gaji Pokok'),
                ),
              ),
            ),


            Container(
              width: 380,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: TextFormField(
                  controller: HariKerja,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Hari Kerja'),
                ),
              ),
            ),

            Container(
              width: 380,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: TextFormField(
                  controller: Sakit,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Sakit'),
                ),
              ),
            ),

            Container(
              width: 380,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: TextFormField(
                  controller: Tanpaketerangan,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Tanpa Keterangan'),
                ),
              ),
            ),

            Container(
              width: 380,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: TextFormField(
                  controller: Izin,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Izin'),
                ),
              ),
            ),

            Container(
              width: 380,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    hitungGajiBersih();
                    hitungTunjangan();
                  },

                  child: Text("Hitung"),
                ),
              ),
              margin: EdgeInsets.only(top: 10), //disini kita memakai margin untuk atur posisi ke bawah
              //agar tidak saling berhimpitan dengan TextFormField 'Izin'
            ),


            Container(
              width: 380,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    reset();
                  },
                  child: Text("Reset"),
                ),
              ),
              margin: EdgeInsets.only(top: 10),
            ),





            Container(
              width: 380,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: TextFormField(
                  controller: GajiBersih,
                  readOnly: true,   //ini artinya TextFormField kita hanya untuk menampilkan output saja
                  decoration: InputDecoration(labelText: 'Gaji Bersih'),
                ),
              ),
              margin: EdgeInsets.only(top: 10), //disini kita memakai margin untuk atur posisi ke bawah
              //agar tidak saling berhimpitan dengan button
            ),


            Container(
              width: 380,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: TextFormField(
                  controller: Tunjangan,
                  readOnly: true,
                  decoration: InputDecoration(labelText: 'Tunjangan'),
                ),
              ),
              margin: EdgeInsets.only(top: 10),
            ),



          ],
        ),
      ),



    );
  }
}
