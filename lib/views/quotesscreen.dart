import 'package:dummy_json_provider/controllers/quotescontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Quotesscreen extends StatelessWidget {
  const Quotesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Quotescontroller>(context);
    return Scaffold(body: _body(provider));
  }

  Widget _body(provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (provider.quotelist == null || provider.quotelist!.isEmpty) {
      return const Center(child: Text("No quotes available"));
    } else {
      return ListView.builder(
        itemCount: provider.quotelist!.length,
        itemBuilder: (context, index) {
          final quote = provider.quotelist![index];
          return ListTile(
            title: Text(quote.quote ?? 'No Quote'),
            subtitle: Text(quote.author ?? 'Unknown Author'),
          );
        },
      );
    }
  }
}
