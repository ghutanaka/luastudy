str = "lua-string"
print("Hello Lua World")
print(str)

value = 10               -- global value = 10
do
  local value = value    -- local value = global valule(10)
  value = value + 1      -- local value = 10 + 1 = 11
  print( value )         -- local value: 11
end
print( value )           -- global valule: 10

local function func( value )
    return value + 1
end
print( "value = ", func( 1 ) ) -- 2
print( "value = ", (function(value) return value + 2 end)(1) )

function my_printf(fmt, ...)
  print(fmt:format(...))
end

my_printf("[%s=%s]", "neko", 30)
my_printf("[%s=%s=%s]", "feiefi", "neko", 30)

function f(n)
  return (n), (n*2), (n*3)
end

v1, v2, v3 = f(2)
print(v1, v2, v3)

-- 引数が文字列で一つの場合は OK
print "Hello, Lua World!"

-- 以下はエラーになる
name = "Fei Zhao"
-- print "Hello!"..name -- 式がある場合エラー
print("Hello,"..name) -- カッコで付ければ OK

-- 関数の中で関数を定義

function outer()
   
  local outer_a = 30
  
  local function inner1()
     outer_a = outer_a + 1
     print(outer_a .. " local function inner1 is called")
  end

  local function inner2()
     outer_a = outer_a + 1
     print(outer_a .. " local function inner2 is called")
  end
  
  inner1()
  inner2()
  inner2()
  inner1()

end

-- 関数を呼び出す
outer()

-- 座標 (x, y) に color の点を打つ関数を定義

function pset(x, y, color)
  print(string.format("pset(%d, %d, %06x)", x, y, color))
end

-- 関数を返す関数を定義
function make_pset_func(color)
  return function (x, y)
      pset(x, y, color)
   end
end

-- 特定の色を描画する関数を作成する
pset_black = make_pset_func(0x0000FF)
pset_white = make_pset_func(0xFFFFFF)
pset_red = make_pset_func(0xFF0000)

-- 関数を呼ぶ
pset_black(10, 10)
pset_white(50, 50)
pset_red(70, 70)

-- metatable.lua
-- v をテーブルとして初期化する
v = {name="tanaka takeshi", age=28, sex="male"}

-- メタテーブルを追加する
setmetatable(v, {memo1="test1", memo2="test2"})

-- v の値を列挙する
print "*** values"

for key, val in pairs(v) do
    print(key, val)
end

-- meta テーブルを取得して列挙する
print "*** metatables"
meta = getmetatable(v)

for key, val in pairs(meta) do
    print(key, val)
end