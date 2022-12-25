import 'package:flutter/material.dart';
import '../api/onedata.dart';
import '../pages/list_diklat.dart';
import '../models/jsonModel.dart';

class ListDiklatScreen extends StatefulWidget {
  const ListDiklatScreen({Key? key}) : super(key: key);

  @override
  State<ListDiklatScreen> createState() => _ListDiklatScreenState();
}

class _ListDiklatScreenState extends State<ListDiklatScreen> {
  int halaman = 1;
  int angkatan = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "List Diklat",
          style: TextStyle(color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.orange,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
          ),
          FutureBuilder<List<Diklat>>(
            future: DiklatApi.getDiklat(halaman),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListDiklat(diklat: snapshot.data ?? []);
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
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text(
                    "<",
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
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text(
                    ">",
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