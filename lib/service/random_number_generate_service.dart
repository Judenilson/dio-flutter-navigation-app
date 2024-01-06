import 'dart:math';

class RandomNumberGenerateService {
  static int randomNumberGenerate(int maxNumber) {
    Random randomNumber = Random();
    return randomNumber.nextInt(maxNumber);
  }
}
