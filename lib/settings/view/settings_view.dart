import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_video_calls_app_zegocloud/app/app.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:user_repository/user_repository.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepository = context.read<UserRepository>();

    return AppScaffold(
      appBar: AppBar(
        title: const Text('Sozlamalar'),
      ),
      body: AppConstrainedScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ...ListTile.divideTiles(
                context: context,
                tiles: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      color: const Color(0xFFF1F8E8),
                      child: ListTile(
                        title: const Text('Chaqiruvlar'),
                        subtitle: Text(
                          'Chaqiruvlarni qabul qilishni boshqaring',
                          style:
                              context.bodySmall?.apply(color: AppColors.grey),
                        ),
                        trailing: StreamBuilder<bool>(
                          stream: userRepository.canAcceptCalls(),
                          builder: (context, snapshot) {
                            final acceptCalls = snapshot.data ?? true;
                            return Switch(
                              value: acceptCalls,
                              onChanged: (canAcceptCalls) =>
                                  userRepository.changeAcceptCalls(
                                acceptCalls: canAcceptCalls,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: const Color(0xFFF1F8E8),
                    child: ListTile(
                      title: const Text('Hisobdan chiqish'),
                      trailing: const Icon(LucideIcons.logOut),
                      textColor: AppColors.red,
                      iconColor: AppColors.red,
                      onTap: () => context
                          .read<AppBloc>()
                          .add(const AppLogoutRequested()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
