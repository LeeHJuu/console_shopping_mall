import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'main.dart';
import 'model/menu.dart';
import 'model/product.dart';

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
// 입력값 변수 혼동 방지를 위해 각 productInput, countInput으로 명명.
void addToCart() {
  print("상품 이름을 입력해주세요.");
  var productInput = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);

  // 상품 존재유무 확인
  if (products.keys.contains(productInput)) {
    print("상품 개수를 입력해주세요.");
    var countInput = stdin.readLineSync();

    try {
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
      } else {
        print("0개보다 많은 개수의 상품만 담을 수 있어요!");
      }
    } catch (e) {
      print("입력값이 올바르지 않습니다.");
    }
  } else {
    print("없는 상품입니다.");
  }
}

// 장바구니에 담은 상품의 총 가격을 출력하는 메서드
void showTotal() {
  var totalPrice = calcTotalPrice();
  print('장바구니에 $totalPrice원 어치를 담으셨네요!');
}

// 장바구니에 담은 상품의 총 가격을 계산하는 메서드.
// 추가한 상품들의 가격 찾기 -> 추가한 갯수 곱한 후 더하기.
int calcTotalPrice() {
  var totalPrice = 0;

  for (var item in cart.entries) {
    var name = item.key;
    var count = item.value;

    totalPrice += (products[name]! * count);
  }

  return totalPrice - discount;
}

// 프로그램 종료하는 메서드
void getOut() {
  print("프로그램을 종료합니다. 정말 종료하시겠습니까?\n종료하겠다면 5를 눌러주세요.");

  var userInput = stdin.readLineSync();

  if (userInput == '5') {
    print("이용해 주셔서 감사합니다~ 안녕히 가세요!");
    exit(0);
  }
}

// 장바구니 초기화하는 메서드
void clearCart() {
  if (cart.isEmpty) {
    print("이미 장바구니가 비어있습니다.");
  } else {
    print("장바구니를 초기화합니다.");
    cart.clear();
  }
}

// 장바구니 상품 목록을 출력하는 메서드
void showCartItems() {
  if (cart.isEmpty) {
    print("장바구니에 담긴 상품이 없습니다.");
  } else {
    var cartItems = cart.keys.fold('장바구니에', (a, b) => '$a, $b');
    var totalPrice = calcTotalPrice();

    print("$cartItems가 담겨있네요. 총 $totalPrice원 입니다!");
  }
}

// 가위바위보 하는 메소드
void rockScissorsPaper() {
  print("가위바위보를 시작합니다. 원하는 숫자를 입력해주세요.\n[1]가위  [2]바위  [3]보");

  int randomIndex = Random(3) as int;
  var rockScissorsPaper = ["가위", "바위", "보"];

  var userInput = stdin.readLineSync();

  try {
    var userInt = int.parse(userInput!) - 1;

    print(
        "you: ${rockScissorsPaper[userInt]}, computer: ${rockScissorsPaper[randomIndex]}");

    if (userInt == randomIndex) {
      print("비겼습니다. 흥정에 실패합니다.");
    } else if ((userInt == 0 && randomIndex == 2) ||
        (userInt == 1 && randomIndex == 0) ||
        (userInt == 2 && randomIndex == 1)) {
      print("이겼습니다! 흥정에 성공합니다.");
      getDiscount();
    } else {
      print("졌습니다. 흥정에 실패합니다.");
    }
  } catch (e) {
    print("잘못된 입력입니다. 흥정에 실패합니다.");
  }
}

// 할인액 추가하는 메서드
void getDiscount(){
  discount += 1000;
}
