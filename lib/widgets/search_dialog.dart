import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  final String? currentSearch;

  SearchDialog({Key? key, this.currentSearch})
      : controller = TextEditingController(text: currentSearch),
        super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: InputBorder.none,
                prefixIcon: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.grey[700],
                  onPressed: AutoRouter.of(context).pop,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  color: Colors.grey[700],
                  onPressed: controller.clear,
                ),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (text) {
                AutoRouter.of(context).pop(text);
              },
              autofocus: true,
            ),
          ),
        )
      ],
    );
  }
}
