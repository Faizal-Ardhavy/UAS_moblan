import 'package:flutter/material.dart';
import '../api/onedata.dart';
import '../pages/list_mahasiswa.dart';
import '../models/jsonModel.dart';

class ListMahasiswaScreen extends StatefulWidget {
  const ListMahasiswaScreen({Key? key}) : super(key: key);

  @override
  State<ListMahasiswaScreen> createState() => _ListMahasiswaScreenState();
}

class _ListMahasiswaScreenState extends State<ListMahasiswaScreen> {
  int halaman = 1;
  int angkatan = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "List Mahasiswa",
          style: TextStyle(color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.yellow,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
          ),
          FutureBuilder<List<MahasiswaIlkom>>(
            future: MahasiswaAPI.getAllMahasiswaIlkom(halaman),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListMahasiswa(mahasiswa: snapshot.data ?? []);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (halaman == 1) {
                    } else {
                      setState(() {
                        halaman--;
                      });
                    }
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  child: const Text(
                    "kembali",
                  ),
                ),
                Text("$halaman"),
                ElevatedButton(
                  onPressed: () {
                    if (halaman == 10) {
                    } else {
                      setState(() {
                        halaman++;
                      });
                    }
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  child: const Text(
                    "selanjutnya",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}