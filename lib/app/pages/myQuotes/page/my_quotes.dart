import 'package:ekilibra_spa/app/config/helpers/helper_db.dart';
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:ekilibra_spa/app/widgets/quotes/detail_quote_service.dart';
import 'package:flutter/material.dart';

class MyQuotes extends StatelessWidget {
  static const name = '/my_quotes';
  const MyQuotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis servicios'),
      ),
      body: FutureBuilder<List<Quote>>(
        future: HelperDb().getQuotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading quotes'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No quotes available'));
          } else {
            return _CardQuotes(myQuotes: snapshot.data!);
          }
        },
      ),
    );
  }
}

class _CardQuotes extends StatelessWidget {
  const _CardQuotes({
    required this.myQuotes,
  });

  final List<Quote> myQuotes;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myQuotes.length,
      itemBuilder: (context, index) {
        final quote = myQuotes[index];
        return DetailQuoteService(quote: quote);
      },
    );
  }
}
