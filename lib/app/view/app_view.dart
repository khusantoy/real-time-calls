import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_video_calls_app_zegocloud/app/app.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter().router(context.read<AppBloc>());

    return ShadApp.router(
      title: 'Muloqot - jonli chaqiruv',
      theme: ShadThemeData(
        colorScheme: const ShadBlueColorScheme.light(),
        brightness: Brightness.light,
      ),
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            ZegoUIKitPrebuiltCallMiniOverlayPage(
              contextQuery: () => navigatorKey.currentState!.context,
            ),
          ],
        );
      },
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
