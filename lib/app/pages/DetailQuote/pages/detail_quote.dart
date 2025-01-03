// ignore: file_names

import 'package:ekilibra_spa/app/config/exports/helpers/exports_helpers.dart';
import 'package:ekilibra_spa/app/pages/home/bloc/home_bloc.dart';
import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';
import 'package:ekilibra_spa/app/pages/quote/pages/quote_page.dart';
import 'package:ekilibra_spa/app/widgets/banners/banners.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailQuote extends StatefulWidget {
  static const name = '/detail_quote';
  final String serviceId;

  const DetailQuote({
    super.key,
    required this.serviceId,
  });

  @override
  State<DetailQuote> createState() => _DetailQuoteState();
}

class _DetailQuoteState extends State<DetailQuote> {
  late Service? service =
      context.read<HomeBloc>().getServiceFromId(widget.serviceId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Texts.detailService),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (service?.images != null) Banners(images: service!.images!),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        service?.title ?? '',
                        style: const TextStyle(fontSize: 20),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(service?.description ?? ''),
                  ),
                  if (service?.phrase != null &&
                      service?.phrase?.isNotEmpty == true)
                    //TODO: dejar bien bonita la frase, en un recuadro o algo
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            service?.phrase ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  if (service?.observation?.isEmpty == false)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(service?.observation ?? ''),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child:
                        Text('${Texts.duration}: ${service?.duration ?? ''}'),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: OutlinedButton(
                  onPressed: () {
                    context.push(QuotePage.name, extra: {
                      'serviceId': service?.title,
                    });
                  },
                  style: ButtonHelpers().secondaryButton(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      Texts.scheduleQuote,
                      style: const TextStyle(fontSize: 16),
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
