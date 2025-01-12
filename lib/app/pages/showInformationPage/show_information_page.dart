import 'package:flutter/material.dart';

class ShowInformationPage extends StatelessWidget {
  static const name = '/show_information_page';

  const ShowInformationPage({
    super.key,
    required this.title,
    this.subTitle,
    required this.description,
    this.phrase,
  });

  final String title;
  final String? subTitle;
  final String description;
  final String? phrase;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (subTitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Text(
                  subTitle!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Text(
                description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            if (phrase != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      phrase!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
