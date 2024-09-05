import 'dart:math';

class Dice{
    final int sides;
    const Dice({required this.sides});

    roll(){
      final ans = Random().nextInt(sides);
      print(ans);
    }
}