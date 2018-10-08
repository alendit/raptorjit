local ffi = require("ffi")

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