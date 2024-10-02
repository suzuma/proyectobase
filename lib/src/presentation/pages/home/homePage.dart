import 'package:flutter/material.dart';
import 'package:practica_bloc/src/presentation/pages/home/bloc/homePageBloc.dart';
import 'package:practica_bloc/src/presentation/pages/home/bloc/homePageEvent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(const HomePageInitEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<HomePageBloc>(context);
    return Container();
  }
}
