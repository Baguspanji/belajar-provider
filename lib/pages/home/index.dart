import 'package:flutter/material.dart';
import 'package:make_provider/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    final prov = Provider.of<HomeProvider>(context, listen: false);

    setState(() {
      isLoading = true;
    });

    await prov.getBarang();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barang"),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          final barangs = value.barang;

          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (barangs.isEmpty) {
            return Center(
              child: Text('Barang Kosong'),
            );
          }

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: barangs
                .map((barang) => Card(
                      child: ListTile(
                        title: Text(barang.nama!),
                        subtitle: Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${barang.stok}'),
                              Text('Rp. ${barang.harga}'),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
