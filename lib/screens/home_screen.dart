// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:prime_web/screens/webpage_selection_screen.dart';
import 'package:provider/src/provider.dart';

import '../helpers/Constant.dart';
import '../provider/navigationBarProvider.dart';
import '../widgets/load_web_view.dart';
import '../widgets/no_internet.dart';
import '../widgets/no_internet_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  String _connectionStatus = 'ConnectivityResult.none';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late AnimationController navigationContainerAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
    NoInternet.initConnectivity().then(
      (value) => setState(() {
        _connectionStatus = value;
      }),
    );
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      NoInternet.updateConnectionStatus(result).then(
        (value) => setState(() {
          _connectionStatus = value;
        }),
      );
    });

    Future.delayed(Duration.zero, () {
      context
          .read<NavigationBarProvider>()
          .setAnimationController(navigationContainerAnimationController);
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    navigationContainerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Flexible(
            child: _connectionStatus == 'ConnectivityResult.none'
                ? NoInternetWidget()
                : WebPageSelectionScreen(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: showNavigationBar
          ? Container(
              margin: EdgeInsets.only(bottom: 50),
              child: FloatingActionBubble(
                items: <Bubble>[
                  // Floating action menu item
                  Bubble(
                    title: "Back",
                    iconColor: Colors.white,
                    bubbleColor: Colors.blue,
                    icon: Icons.arrow_back,
                    titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                    onPress: () {
                      _animationController!.reverse();
                    },
                  ),
                  // Floating action menu item
                  Bubble(
                    title: "Home",
                    iconColor: Colors.white,
                    bubbleColor: Colors.blue,
                    icon: Icons.home,
                    titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                    onPress: () {
                      _animationController!.reverse();
                    },
                  ),
                  //Floating action menu item
                  Bubble(
                    title: "Refresh",
                    iconColor: Colors.white,
                    bubbleColor: Colors.blue,
                    icon: Icons.refresh,
                    titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                    onPress: () {
                      _animationController!.reverse();
                    },
                  ),
                ],
                onPress: () => _animationController!.isCompleted
                    ? _animationController!.reverse()
                    : _animationController!.forward(),
                iconColor: Colors.blue,
                backGroundColor: Colors.white,
                iconData: Icons.settings,
                animation: _animation!,
              ),
            )
          : null,
    );
  }
}
