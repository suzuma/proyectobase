import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica_bloc/src/domain/useCases/newsUseCases.dart';

import 'injection_container.dart';
import 'src/presentation/pages/home/bloc/homePageBloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<HomePageBloc>(
      create: (context) => HomePageBloc(locator<NewsUseCases>())),
];
