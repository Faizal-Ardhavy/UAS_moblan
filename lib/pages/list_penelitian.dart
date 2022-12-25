import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../api/onedata.dart';
import '../models/jsonModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ListPenelitian extends StatefulWidget {
  final List<Penelitian> penelitian;
  ListPenelitian ({Key? key, required this.penelitian}) : super(key: key);

  @override
  State<ListPenelitian> createState() => _ListPenelitianState();
}

class _ListPenelitianState extends State<ListPenelitian> {
  late List<Penelitian> ListPenelitian;

  @override
  void initState() {
    super.initState();
    ListPenelitian = widget.penelitian;
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
              itemCount: ListPenelitian.length,
              itemBuilder: (context, index) {
                final penelitian = ListPenelitian[index];
                return listItem(penelitian);
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(Penelitian penelitian_unila) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Text(
            penelitian_unila.judul_penelitian.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        isThreeLine: true,
        subtitle: Text(
            "id Penelitian: ${penelitian_unila.id.toString()}\ntahun: ${penelitian_unila.tahun.toString()}"),
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}