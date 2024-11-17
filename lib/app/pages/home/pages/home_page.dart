import 'package:ekilibra_spa/app/config/helpers/texts.dart';
import 'package:ekilibra_spa/app/config/service_locator/service_locator.dart';
import 'package:ekilibra_spa/app/pages/home/bloc/home_bloc.dart';
import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';
import 'package:ekilibra_spa/app/pages/pages.dart';
import 'package:ekilibra_spa/app/pages/quote/pages/quote_page.dart';
import 'package:ekilibra_spa/app/widgets/banners/banners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const name = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Service>? services;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      //TODO: revisar la inicialización de los bloc para unificar en toda la app la más sencilla
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is LoadServicesState) {
            services = state.services;
          }
          return _HomeView(services: services);
        },
      ),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView({required this.services});

  final List<Service>? services;

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  late HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.services != null)
          Banners(
              images: widget.services!
                  .map((service) => service.images![0])
                  .toList()),
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
            context.push(QuotePage.name);
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
  }

  @override
  void initState() {
    super.initState();

    homeBloc = getIt.get<HomeBloc>();
    homeBloc.add(LoadServicesEvent());
  }
}
