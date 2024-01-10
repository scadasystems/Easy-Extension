part of easy_extension;

class MathUtil {
  /// 최소 공배수
  static int getLcm(List<int> arr) {
    int answer = 0;

    if (arr.length == 1) {
      return arr[0];
    }

    int g = getGcd(arr[0], arr[1]);

    answer = ((arr[0] * arr[1]) ~/ g);

    if (arr.length > 2) {
      for (int i = 2; i < arr.length; i++) {
        g = getGcd(answer, arr[i]);

        answer = ((answer * arr[i]) / g) as int;
      }
    }
    return answer;
  }

  /// 최대 공약수
  static int getGcd(int a, int b) {
    int r = (a % b);
    if (r == 0) {
      return b;
    } else {
      return getGcd(b, r);
    }
  }
}
