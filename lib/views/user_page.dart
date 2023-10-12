import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:internet_access/controllers/user_controller.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserController _controller = UserController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: _controller.isLoading,
          builder: (context, value, child) => Text(_controller.user.name),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              ListTile(
                dense: true,
                title: const Text('Nome'),
                trailing: ValueListenableBuilder(
                  valueListenable: _controller.isLoading,
                  builder: (context, value, child) =>
                      Text(_controller.user.name),
                ),
              ),
              const Divider(
                height: 1,
              ),
              ListTile(
                dense: true,
                title: const Text('E-mail'),
                trailing: ValueListenableBuilder(
                  valueListenable: _controller.isLoading,
                  builder: (context, value, child) =>
                      Text(_controller.user.email),
                ),
              ),
              const Divider(
                height: 1,
              ),
              ListTile(
                dense: true,
                title: const Text('Telefone'),
                trailing: ValueListenableBuilder(
                  valueListenable: _controller.isLoading,
                  builder: (context, value, child) =>
                      Text(_controller.user.phone),
                ),
              ),
              const Divider(
                height: 1,
              ),
              ListTile(
                dense: true,
                title: const Text('Site'),
                trailing: ValueListenableBuilder(
                  valueListenable: _controller.isLoading,
                  builder: (context, value, child) =>
                      Text(_controller.user.website),
                ),
              ),
              const Divider(
                height: 1,
              ),
            ],
          ),
          ValueListenableBuilder(
            valueListenable: _controller.isLoading,
            builder: (context, value, child) {
              return Visibility(
                  visible: value,
                  child: ClipRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                        child:
                            const Center(child: CircularProgressIndicator())),
                  ));
            },
          )
        ],
      ),
    );
  }
}
