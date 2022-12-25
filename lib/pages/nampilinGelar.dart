import 'package:flutter/material.dart';
import '../api/onedata.dart';
import '../pages/list_gelar.dart';
import '../models/jsonModel.dart';

class ListGelarScreen extends StatefulWidget {
  const ListGelarScreen({Key? key}) : super(key: key);

  @override
  State<ListGelarScreen> createState() => _ListGelarScreenState();
}

class _ListGelarScreenState extends State<ListGelarScreen> {
  int halaman = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "List Gelar Akademik",
          style: TextStyle(color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
          ),
          FutureBuilder<List<Gelar>>(
            future: GelarApi.getGelar(halaman),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListGelar(gelar: snapshot.data ?? []);
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
                      ElevatedButton.styleFrom(backgroundColor: Colors.blue),
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
                      ElevatedButton.styleFrom(backgroundColor: Colors.blue),
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