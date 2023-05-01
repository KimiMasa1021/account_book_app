import 'package:account_book_app/presentation/widgets/common/normal_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../application/providers/create_target_provider/provider/create_target_provider.dart';
import '../../../../utility/price_formatter.dart';

class CreateTargetDetail extends ConsumerWidget {
  const CreateTargetDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetController = TextEditingController();
    final priceController = TextEditingController();
    final createTargetCTL = ref.watch(createTargetNotifierProvider.notifier);

    return Column(
      children: [
        NormalTextField(
          topTitle: "目標",
          hintText: "達成目標を入力してね",
          inputType: TextInputType.name,
          controller: targetController,
          editable: true,
          onChanged: (val) => createTargetCTL.updateTarget(val),
        ),
        NormalTextField(
          topTitle: "金額",
          hintText: "金額を入力してね",
          inputType: TextInputType.number,
          controller: priceController,
          editable: true,
          formatter: [CustomTextInputFormatter()],
          onChanged: (val) => createTargetCTL.updatePrice(val),
        ),
      ],
    );
  }
}
