import 'package:flutter/material.dart';
import 'package:stream_deck/views/widgets/buttons/button.dart';

import '../../../models/models.dart';
import '../../../viewmodels/viewmodels.dart';

appsSection({required ConnectionViewModel connectionViewModel}) {
  return Expanded(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 60,
          child: Center(
            child: Text(
              'Aplicativos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          children: List.generate(appList.length, (index) {
            return Button.small(
              image: appList[index].asset,
              onPressed: () =>
                  connectionViewModel.sendMessage(appList[index].name),
            );
          }),
        ),
      ],
    ),
  );
}
