import 'package:flutter/material.dart';
import '../api/onedata.dart';
import '../pages/list_penelitian.dart';
import '../models/jsonModel.dart';

class ListPenelitianScreen extends StatefulWidget {
  const ListPenelitianScreen({Key? key}) : super(key: key);

  @override
  State<ListPenelitianScreen> createState() => _ListPenelitianScreenState();
}

class _ListPenelitianScreenState extends State<ListPenelitianScreen> {
  int halaman = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "List Penelitian",
          style: TextStyle(color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
          ),
          FutureBuilder<List<Penelitian>>(
            future: PenelitianApi.getPenelitian(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListPenelitian(penelitian: snapshot.data ?? []);
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
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
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