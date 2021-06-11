/**
 * references:
 * https://en.cppreference.com/w/cpp/language/nullptr
 */
#include <iostream>

int main(int argc, char **argv) {
  int* ptr = nullptr;
  std::cout << "pointer = " << ptr << std::endl;
}
