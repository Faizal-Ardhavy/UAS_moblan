import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../api/onedata.dart';
import '../models/jsonModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ListDiklat extends StatefulWidget {
  final List<Diklat> diklat;
  ListDiklat({Key? key, required this.diklat}) : super(key: key);

  @override
  State<ListDiklat> createState() => _ListDiklatState();
}

class _ListDiklatState extends State<ListDiklat> {
  late List<Diklat> ListDiklat;

  @override
  void initState() {
    super.initState();
    ListDiklat = widget.diklat;
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
              itemCount: ListDiklat.length,
              itemBuilder: (context, index) {
                final diklat = ListDiklat[index];
                return listItem(diklat);
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(Diklat diklat_unila) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Text(
            diklat_unila.nama_diklat.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        isThreeLine: true,
        subtitle: Text(
            "id diklat: ${diklat_unila.id_diklat.toString()}\npenyelenggara: ${diklat_unila.penyelenggara.toString()}"),
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}