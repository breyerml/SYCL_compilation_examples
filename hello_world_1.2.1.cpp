#include <CL/sycl.hpp>
#include <array>
#include <iostream>
#include <numeric>

class KernelName;

int main() {
  constexpr std::size_t size = 42;
  std::array<int, size> a;
  std::iota(a.begin(), a.end(), 0);

  std::array<int, size> b;
  std::iota(b.begin(), b.end(), 0);

  std::array<int, size> c{};
  
  {
    cl::sycl::queue q{};
    std::cout << q.get_device().get_info<cl::sycl::info::device::name>() << std::endl;
    
    cl::sycl::buffer<int, 1> buf_a{a.data(), a.size()};
    cl::sycl::buffer<int, 1> buf_b{b.data(), b.size()};
    cl::sycl::buffer<int, 1> buf_c{c.data(), c.size()};
    
    q.submit([&](cl::sycl::handler& h) {
      auto acc_a = buf_a.get_access<cl::sycl::access::mode::read>(h);
      auto acc_b = buf_b.get_access<cl::sycl::access::mode::read>(h);
      auto acc_c = buf_c.get_access<cl::sycl::access::mode::discard_write>(h);
      
      h.parallel_for<KernelName>(cl::sycl::range<1>{size}, [=](cl::sycl::id<1> idx) {
        acc_c[idx] = acc_a[idx] + acc_b[idx];
      });
    });
  }
  
  std::array<int, size> correct;
  for (std::size_t i = 0; i < size; ++i) {
    correct[i] = 2 * static_cast<int>(i);
  }
  const bool passed = c == correct;
  std::cout << (passed ? "Correct results" : "Wrong results") << std::endl;
  return !passed;
}
