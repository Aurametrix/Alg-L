from lupa import LuaRuntime
lua = LuaRuntime()
 
lua_code = """
function (size)
    a = {}
    b = {}
    st = os.clock()
    for i=0, size-1 do
        a[i] = math.random(size)
    end
 
    for i=0, size-1 do
        b[i] = math.random(size)
    end
 
    print("LUA init: "..(os.clock()-st))
 
    st = os.clock()
    for i=0, size-1 do
        if a[i] ~= b[i] then
            a[i] = a[i] + b[i]
        end
    end
    print("LUA sum: "..(os.clock()-st))
end
"""
test = lua.eval(lua_code)
size = 5000000
test(size)
