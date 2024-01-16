import 'package:flutter/material.dart';
import 'package:hotel/ui/widget/reservation_widget/reservation_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class BuyerInfoWidget extends StatelessWidget {
  const BuyerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ReservationModel>();
    return Container(
      decoration: model.containerDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Информация о покупателе',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(246, 246, 249, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    MaskTextInputFormatter(
                        mask: "+7 (###) ###-##-##",
                        initialText: '+7 (***) ***-**-**',
                        type: MaskAutoCompletionType.eager),
                  ],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Номер телефона',
                    floatingLabelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(169, 171, 183, 1),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(246, 246, 249, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  onChanged: (value) {
                    model.emailIsValidChanged();
                  },
                  controller: model.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Почта',
                    errorText:
                        model.emailIsValid ? null : 'Введена некорректно почта',
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(235, 87, 87, 15))),
                    floatingLabelStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(169, 171, 183, 1),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(130, 135, 150, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
