import 'package:flutter/material.dart';
import '../model/category_model.dart';
import '../service/meals_service.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MealsService _service = MealsService();
  late Future<List<categories>> _futurecategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meals categories List')),
      body: FutureBuilder<List<categories>>(
        future: _futurecategories,
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
              final categories = snapshot.data![index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: Image.network(
                    categories.strCategoryThumb,
                    width: 50,
                    errorBuilder: (_, __, ___) => const Icon(Icons.error),
                  ),
                  title: Text(
                    categories.strCategory,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(categories.strCategoryDescription),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
