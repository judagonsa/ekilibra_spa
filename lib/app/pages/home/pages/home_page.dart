import 'package:ekilibra_spa/app/config/helpers/texts.dart';
import 'package:ekilibra_spa/app/config/service_locator/service_locator.dart';
import 'package:ekilibra_spa/app/pages/home/bloc/home_bloc.dart';
import 'package:ekilibra_spa/app/pages/pages.dart';
import 'package:ekilibra_spa/app/pages/quote/pages/quote_page.dart';
import 'package:ekilibra_spa/app/widgets/banners/banners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  static const name = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = getIt.get<HomeBloc>();
    homeBloc.add(LoadServicesEvent());
    homeBloc.add(LoadPlacesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ekilibra Spa'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              if (state.services != null)
                Banners(
                  images: state.services!
                      .map((service) => service.images![0])
                      .toList(),
                ),
              ElevatedButton(
                onPressed: () {
                  context.push(ProfilePage.name, extra: {'isRegister': false});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.person),
                    Text(Texts.profile),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.push(QuotePage.name, extra: {
                    'places': state.places,
                    'services': state.services
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.person),
                    Text(Texts.scheduleQuote),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
