import 'package:flutter/material.dart';
import 'dart:async';

class Day5 extends StatelessWidget {
  const Day5({super.key});

  // Contoh fungsi Future yang mengembalikan data setelah delay
  Future<List<String>> fetchData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulasi delay
    return ['Item a', 'Item b', 'Item c', 'Item d'];
  }
  Stream<int> numberStream() async* {
    int counter = 0;
    while(true){
      await Future.delayed(const Duration(seconds: 1));
      yield counter++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FutureBuilder Example Zahra")),
      body: FutureBuilder<List<String>>(
        future: fetchData(), // Panggil fungsi Future
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Error
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final items = snapshot.data!;
            if (items.isNotEmpty) {
              // Tampilkan daftar jika ada data
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]),
                  );
                },
              );
            } else {
              // Tampilkan pesan jika data kosong
              return const Center(child: Text('Tidak ada data'));
            }
          } else {
            // Tampilkan fallback jika tidak ada kondisi yang terpenuhi
            return const Center(child: Text('Tidak ada data'));
          }
        },
      ),
    );
  }
}
