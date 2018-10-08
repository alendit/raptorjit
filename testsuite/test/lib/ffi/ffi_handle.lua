local ffi = require("ffi")
local io = require("io")

do
   local i42 = 42
   local handle = ffi.new_handle(i42)
   local i42_back = ffi.from_handle(handle)
   assert(i42 == i42_back)
end

do
   local s = "somestring"
   local handle = ffi.new_handle(s)
   local s_back = ffi.from_handle(handle)
   assert(s == s_back)
end

do
   local t = { a = 12, b = 32 }
   local handle = ffi.new_handle(t)
   local t_back = ffi.from_handle(handle)
   assert(t == t_back)
end

do
   local function test_conversion(a1, a2)
      local t = { a = a1, b = a2 }
      local handle = ffi.new_handle(t)
      local t_back = ffi.from_handle(handle)
      assert(t == t_back)
      assert(t_back.a == a1)
      assert(t_back.b == a2)
   end

   -- local status = jit.compile(test_conversion)
   -- if (status ~= nil) then
   --    error("Failed to compiled test function")
   -- end
   jit.opt.start("hotloop=1")
   for i = 1, 100 do
      test_conversion(i, i + 1)
   end
end