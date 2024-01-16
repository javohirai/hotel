import 'package:flutter/material.dart';
import 'package:hotel/domain/navigation/main_navigation.dart';

class CheckOutWidget extends StatelessWidget {
  const CheckOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitleTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    const checkoutTextStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
    );
    const checkoutDescriptionTextStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(130, 135, 150, 1));
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Заказ оплачен',
            style: appTitleTextStyle,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 94,
                    height: 94,
                    child: Card(
                      elevation: 0,
                      shape: const CircleBorder(
                        side: BorderSide(color: Colors.transparent),
                      ),
                      color: const Color.fromRGBO(246, 246, 249, 1),
                      child: Image.asset('assets/party.png'),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Ваш заказ принят в работу',
                    style: checkoutTextStyle,
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23),
                    child: Text(
                      'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                      textAlign: TextAlign.center,
                      style: checkoutDescriptionTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
          const _CheckPayWidget(),
          const SizedBox(
            height: 28,
          )
        ],
      ),
    );
  }
}

class _CheckPayWidget extends StatelessWidget {
  const _CheckPayWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(205),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(13, 114, 255, 1))),
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            MainNavigationRoutes.initialRoute,
            (route) => false,
          );
        },
        child: const Text(
          'Супер!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
