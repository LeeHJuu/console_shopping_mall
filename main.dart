import 'dart:io';

import 'method.dart';

// 장바구니 선언 및 초기화
Map<String, int> cart = {};

// 메인함수
void main(List<String> args) {
  while (true) {
    showMenus();

    var userInput = stdin.readLineSync();

    switch (userInput) {
      case '1':
        showProducts();
        break;

      case '2':
        addToCart();
        break;

      case '3':
        // showTotal();
        showCartItems();
        break;

      case '4':
        getOut();

      case '6':
        clearCart();
        break;

      default:
        print("잘못된 입력입니다. 다시 한번 입력해주세요.");
        break;
    }
  }
}