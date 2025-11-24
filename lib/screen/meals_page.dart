import 'package:flutter/material.dart';
import '../model/meals_model.dart';
import '../service/meals_service.dart';
import 'detail_page.dart';

class MealsPage extends StatefulWidget {
  final String username;
  const MealsPage({super.key, required this.username });

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  final MealsService _service = MealsService();
  late Future<List<MealsModel>> _futureMealsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nintendo MealsModel List')),
      body: FutureBuilder<List<MealsModel>>(
        future: _futureMealsModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Data Found'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final MealsModel = snapshot.data![index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: Image.network(
                    MealsModel.strMealThumb,
                    width: 50,
                    errorBuilder: (_, __, ___) => const Icon(Icons.error),
                  ),
                  title: Text(
                    MealsModel.strMeal,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ), onTap: () async {
                    // Navigasi ke detail, dan refresh favorite saat kembali
                    // (Siapa tahu user menghapus favorite dari dalam halaman detail)
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(categories: widget.username),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
