test01:
  li a1, 38
  li x1, 0xFFFFFFFF
  li x2, 0x00000000
  andn x3, x1, x2        // 0xFFFFFFFF & ~0x00000000
  li x29, 0xFFFFFFFF
  bne x3, x29, fail

test02:
  li a1, 39
  li x1, 0x00000000
  li x2, 0xFFFFFFFF
  andn x3, x1, x2        // 0x00000000 & ~0xFFFFFFFF
  li x29, 0x00000000
  bne x3, x29, fail

// Pattern tests
test03:
  li a1, 40
  li x1, 0xAAAAAAAA
  li x2, 0x55555555
  andn x3, x1, x2        // 0xAAAAAAAA & ~0x55555555
  li x29, 0xAAAAAAAA
  bne x3, x29, fail

test04:
  li a1, 41
  li x1, 0x55555555
  li x2, 0xAAAAAAAA
  andn x3, x1, x2        // 0x55555555 & ~0xAAAAAAAA
  li x29, 0x55555555
  bne x3, x29, fail

// Masking tests
test05:
  li a1, 42
  li x1, 0x12345678
  li x2, 0x0000FFFF
  andn x3, x1, x2        // Clear lower 16 bits
  li x29, 0x12340000
  bne x3, x29, fail

test06:
  li a1, 43
  li x1, 0xFFFF0000
  li x2, 0x0000FFFF
  andn x3, x1, x2        // Preserve upper 16 bits
  li x29, 0xFFFF0000
  bne x3, x29, fail

// Edge cases
test07:
  li a1, 44
  li x1, 0xDEADBEEF
  li x2, 0xFFFFFFFF
  andn x3, x1, x2        // All bits masked
  li x29, 0x00000000
  bne x3, x29, fail

test08:
  li a1, 45
  li x1, 0x12345678
  li x2, 0x12345678
  andn x3, x1, x2        // Self-masking
  li x29, 0x00000000
  bne x3, x29, fail

// Single-bit tests
test09:
  li a1, 46
  li x1, 0x00000001
  li x2, 0x00000001
  andn x3, x1, x2        // Single bit clear
  li x29, 0x00000000
  bne x3, x29, fail

test10:
  li a1, 47
  li x1, 0x80000000
  li x2, 0x80000000
  andn x3, x1, x2        // MSB clear
  li x29, 0x00000000
  bne x3, x29, fail

test11:
  li a1, 75
  li x1, 0xFFFFFFFF
  li x2, 0x12345678
  andn x3, x1, x2        // 0xFFFFFFFF & ~0x12345678
  li x29, 0xEDCBA987
  bne x3, x29, fail

success:
  li a0, 10
  ecall

fail:
  li a0, 17
  ecall