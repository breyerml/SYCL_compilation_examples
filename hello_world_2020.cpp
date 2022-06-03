#include <sycl/sycl.hpp>
#include <array>
#include <iostream>
#include <numeric>


int main() {
  constexpr std::size_t size = 42;
  std::array<int, size> a;
  std::iota(a.begin(), a.end(), 0);

  std::array<int, size> b;
  std::iota(b.begin(), b.end(), 0);

  std::array<int, size> c{};
  
  {
    sycl::queue q{};
    std::cout << q.get_device().get_info<sycl::info::device::name>() << std::endl;
    
    sycl::buffer buf_a{a};
    sycl::buffer buf_b{b};
    sycl::buffer buf_c{c};
    
    q.submit([&](sycl::handler& h) {
      sycl::accessor acc_a{buf_a, h, sycl::read_only};
      sycl::accessor acc_b{buf_b, h, sycl::read_only};
      sycl::accessor acc_c{buf_c, h, sycl::write_only, sycl::noinit};
      
      h.parallel_for(size, [=](sycl::id<1> idx) {
        acc_c[idx] = acc_a[idx] + acc_b[idx];
      });
    });
  }
  
  std::array<int, size> correct;
  std::generate(correct.begin(), correct.end(), [i = 0]() mutable { return 2 * (i++); } );
  const bool passed = c == correct;
  std::cout << (passed ? "Correct results" : "Wrong results") << std::endl;
  return !passed;
}
