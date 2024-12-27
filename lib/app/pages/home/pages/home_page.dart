import 'package:ekilibra_spa/app/config/exports/blocs/exports_blocs_cubits.dart';
import 'package:ekilibra_spa/app/config/exports/pages/exports_pages.dart';
import 'package:ekilibra_spa/app/config/service_locator/service_locator.dart';
import 'package:ekilibra_spa/app/widgets/banners/banners.dart';
import 'package:flutter/material.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              context.push(ProfilePage.name, extra: {'isRegister': false});
            },
            icon: const Icon(Icons.person),
            color: Colors.purple,
          ),
        ],
        leading: IconButton(
          onPressed: () {
            //TODO: abrir menú lateral
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.purple,
          ),
        ),
        elevation: 10,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              if (state.services != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Banners(
                    images: state.services!
                        .map((service) => service.images![0])
                        .toList(),
                    onTap: (index) {
                      context.push(
                        DetailQuote.name,
                        extra: {
                          'serviceId': state.services![index].title,
                        },
                      );
                    },
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  context.push(MyQuotes.name);
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_today_outlined),
                    Text('Mis citas agendadas'),
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
