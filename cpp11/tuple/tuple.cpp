/**
 * references:
 * https://en.cppreference.com/w/cpp/utility/tuple
 */
#include <iostream>
#include <tuple>

using std::cout;
using std::endl;
using std::tie;
using std::tuple;

int main(int argc, char **argv) {
  int res1 = 0;
  int res2 = 0;
  auto example = std::tuple<int, int>(2, 3);
  std::tie(res1, std::ignore) = example;
  res2 = std::get<1>(example);
  std::cout << "res1 = " << res1 << std::endl << "res2 = " << res2 << std::endl;
}
