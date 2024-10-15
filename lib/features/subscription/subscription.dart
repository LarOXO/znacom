import 'package:flutter/material.dart';
import 'package:znacom/features/subscription/widget/subscription_option.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0XFF0D1333),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildSubscriptionOptions(),
                  const SizedBox(height: 20),
                  _buildPurchaseButton(),
                  const SizedBox(height: 20),
                  _buildTermsButton(),
                ],
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset('assets/icon/glass_big.png',
            width: 170, fit: BoxFit.contain),
        const SizedBox(height: 20),
        const Text('РЕЖИМ ИНКОГНИТО НА 24 ЧАСА',
            style: TextStyle(fontSize: 16)),
        const SizedBox(height: 20),
        const Text(
          'Стань невидимкой в ленте и чатах, скрой объявление и наслаждайся <Space> незамеченным',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildSubscriptionOptions() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SubscriptionOption(duration: '1', price: '99 ₽'),
        SubscriptionOption(duration: '3', price: '199 ₽'),
        SubscriptionOption(duration: '7', price: '399 ₽'),
      ],
    );
  }

  Widget _buildPurchaseButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: Colors.redAccent,
      ),
      onPressed: () {},
      child: const Text('Купить',
          style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }

  Widget _buildTermsButton() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'УСЛОВИЯ И ПОЛОЖЕНИЯ',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
