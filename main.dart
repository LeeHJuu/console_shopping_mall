import 'dart:convert';

import 'dart:io';

import 'model/menu_index.dart';
import 'model/product.dart';

// 장바구니 초기화
Map<String, int> cart = {};

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
        showTotal();
        break;

      case '4':
        getOut();

      default:
        print("잘못된 입력입니다. 다시 한번 입력해주세요.");
        break;
    }
  }
}

// 메뉴 목록을 출력하는 메서드
void showMenus() {
  var menuStr = '';
  var menuLength = menuIndex.length;

  for (var menu in menuIndex) {
    var id = menu.index;
    var title = menu.title;

    menuStr += '[$id] $title';

    if (id < menuLength) {
      menuStr += ' / ';
    }
  }

  print(menuStr);
}

// 상품 목록을 출력하는 메서드
void showProducts() {
  for (var product in products.entries) {
    var name = product.key;
    var price = product.value;

    print('$name / $price원');
  }
}

// 상품을 장바구니에 담는 메서드
void addToCart() {
  print("상품 이름을 입력해주세요.");
  var productInput = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);

  if (products.keys.contains(productInput)) {
    print("상품 개수를 입력해주세요.");
    var countInput = stdin.readLineSync();

    var countNum = int.parse(countInput!); // 숫자가 아닌 경우의 예외처리 할 것.
    if (countNum > 0) {
      // 동일 상품 선택시 수량 추가.
      if (cart.keys.contains(productInput)) {
        var itemCount = cart[productInput];
        cart[productInput!] = (itemCount! + countNum);
      } else {
        cart[productInput!] = countNum;
      }
      print("장바구니에 상품이 담겼어요!");
    }
  } else {
    print("없는 상품입니다.");
  }
}

// 장바구니에 담은 상품의 총 가격을 출력하는 메서드
// 추가한 상품들의 가격 수집 -> 추가한 갯수 곱한 후 더하기.
void showTotal() {
  var totalPrice = 0;

  for (var item in cart.entries) {
    var name = item.key;
    var count = item.value;

    totalPrice += (products[name]! * count);
  }

  print('장바구니에 $totalPrice원 어치를 담으셨네요!');
}

// 프로그램 종료하는 메서드
void getOut() {
  print("프로그램을 종료합니다. 정말 종료하시겠습니까?\n종료하겠다면 4를 다시 눌러주세요.");

  var userInput = stdin.readLineSync();

  if (userInput == '4') {
    print("이용해 주셔서 감사합니다~ 안녕히 가세요!");
    exit(0);
  }
}

// 장바구니 초기화하는 메서드
void clearCart() {}
