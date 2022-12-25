import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../api/onedata.dart';
import '../models/jsonModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ListGelar extends StatefulWidget {
  final List<Gelar> gelar;
  ListGelar({Key? key, required this.gelar}) : super(key: key);

  @override
  State<ListGelar> createState() => _ListGelarState();
}

class _ListGelarState extends State<ListGelar> {
  late List<Gelar> ListGelar;

  @override
  void initState() {
    super.initState();
    ListGelar = widget.gelar;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ListGelar.length,
              itemBuilder: (context, index) {
                final gelar = ListGelar[index];
                return listItem(gelar);
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(Gelar gelar) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Text(
            gelar.nm_gelar_akad.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        isThreeLine: true,
        subtitle: Text(
            "Id gelar: ${gelar.id_gelar_akad.toString()}\nSingkatan Gelar: ${gelar.singkat_gelar.toString()}"),
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}