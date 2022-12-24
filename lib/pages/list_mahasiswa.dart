import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../api/onedata.dart';
import '../models/jsonModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ListMahasiswa extends StatefulWidget {
  final List<MahasiswaIlkom> mahasiswa;
  ListMahasiswa({Key? key, required this.mahasiswa}) : super(key: key);

  @override
  State<ListMahasiswa> createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  late List<MahasiswaIlkom> ListMahasiswa;

  @override
  void initState() {
    super.initState();
    ListMahasiswa = widget.mahasiswa;
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
              itemCount: ListMahasiswa.length,
              itemBuilder: (context, index) {
                final mahasiswa = ListMahasiswa[index];
                return listItem(mahasiswa);
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(MahasiswaIlkom mahasiswa_ilkom) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Text(
            mahasiswa_ilkom.nm_lemb.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        trailing: Icon(Icons.call),
        isThreeLine: true,
        onTap: () async {
          String id = mahasiswa_ilkom.kode_prodi.toString();
          // print(id);
          // String hp = MahasiswaAPI.getTelephone(id) as String;
          // print('ini hp' + hp);
          // launch("tel:${hp}");
          // print();
          launch("tel:${await MahasiswaAPI.getTelephone(id)}");
        },
        subtitle: Text(
            "${mahasiswa_ilkom.stat_prodi.toString()}\n${mahasiswa_ilkom.sks_lulus.toString()}"),
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}