// import 'package:flutter/material.dart';
// import '../model/category_model.dart';
// import '../service/meals_service.dart';

// // Ubah menjadi StatefulWidget agar bisa update icon secara dinamis
// class DetailScreen extends StatefulWidget {
//   final categories;
//   const DetailScreen({super.key, required this.categories});

//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> {
//   final MealsService _service = MealsService();
  
//   // Status apakah item ini favorit atau tidak
//   final bool _isFavorite = false;

//   @override
//   void initState() {
//     super.initState();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Amiibo Details'),
//         actions: [  
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(child: Image.network(widget.categories.image, height: 200, errorBuilder: (_,__,___)=> const Icon(Icons.error, size: 50))),
//             const SizedBox(height: 20),
//             Text(widget.categories.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             const Divider(),
//             _buildRow('categories Series', widget.categories.categoriesSeries),
//             _buildRow('Character', widget.categories.character),
//             _buildRow('Game Series', widget.categories.gameSeries),
//             _buildRow('Type', widget.categories.type),
//             _buildRow('Head', widget.categories.head),
//             _buildRow('Tail', widget.categories.tail),
//             const SizedBox(height: 20),
//             const Text("Release Dates", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
//             const Divider(),
//             if (widget.categories.release != null)
//               ...widget.categories.release!.entries.map((e) => _buildRow(e.key, e.value.toString())),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
//           Text(value),
//         ],
//       ),
//     );
//   }
// }