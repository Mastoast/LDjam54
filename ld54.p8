pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
#include object.lua
#include objects.lua
#include levels.lua
#include main.lua

--[[ 
    TODO
    late game Levels
    better radius
    -- hello

    musics
    SFX ?

    Visuals
    light effects
    decorations
    monster animations ?

    Bugs
]]

--❎🅾️⬆️⬇️⬅️➡️
--█▥░➡️⧗▤⬆️☉🅾️◆
--…★⬇️✽●♥웃⌂⬅️⬅️😐
--∧❎🐱ˇ▒♪
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000440000000000000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000990000009900000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000990000009900000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000009999000099990000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700004994000009900000444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000004904000009900000400400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000004004000000000000400400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000111100000000000001111111100000000000000000000000000000000000000000000011100000000000000000000
000000000000000000000000000000000017777100000000000166661111100000000ddddd000000000000000000550000000001111100000000000000000000
00004444444450000000000000000000017777771000000000166666666610000000ddddddd00000000000000055f50000000011111110000000000000000000
00004500000450000000000000000000017777776000000000166666666610000000ffffffdd000000000555555f550000000111111100000000000000000000
00004500000450000000000000000000177077076100000000111666116610000000f8ff8ffdd000000055a5a555500000000111111000000000000000000000
00004500000450000000000000000000177777776100000000111616116610000000fffffffdd000000555555555550000001111111000000000000000000000
00004500000450000000000000000000177777776100000000166666666110000000ffffffddd000000555555555500000001111111000000000000000000000
00004444444450000000000000000000177777776100000000166666661100000000f000ffddd000000077755555d00000044994444000000000000000000000
00004500000450000000000000000000177777776100000000116161661000000000f8f8fddd000000000555555dd00011111111111111100000000000000000
00004500000450000000000000000000017700077100000000001111111000000000f8fffddd00000000ddd555dd50000000f3f3ff4000100000000000000000
0444444444445000000000000000000001777777761000000000000550000000000122222dd000000000dddd55d550000000ffffff4000000000000000000000
0444444444445000000000000000000001777777761000000000066566000000000119991d0000000000ddddddd500000000ffffff4000000000000000000000
00044555555450000000000000000000001777777610000000000005000000000000119110000000000001199115055000000ffff44000000000000000000000
00044000000450000000000000000000000177777661100000000665660000000000111110000000000000111155500000000555600000000000000000000000
00044000000450000000000000000000000011177777610000000011100000000000100100000000000000100f00000000000555566000000000000000000000
00044000000450000000000000000000000000111111100000000010100000000000100100000000000000f00f00000000005555555660000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000ddd1ddd100000000111dd1100d1dd1dd00000000000000000000000000000000000001111110000000000000000000000000000000000000
0000000000000000ddd1ddd100000000dd1dd1d00d1111dd00000000000000000000000000000000000111111111100000000000000000000000000000000000
00000000000000001111111100000000dd1111d00d1dd1dd01166611166611000000000000000000001115555551110000000000000000000000000000000000
0000000000000000d1ddd1dd00000000dd1dd1d0011dd11101445445445441000000000000000000011544444444411000000000000000000000000000000000
0000000000000000d1ddd1ddd1ddd1dd111dd1100d1dd1dd01445445445441000000006660000000014544444444441000000000000000000000000000000000
00000000000000001111111111111111dd1dd1d00d1111dd01445445445441000000060006000000155555555555555100000000000000000000000000000000
0000000000000000ddd1ddd1ddd1ddd1dd1111d00d1dd1dd01445555445441000000600000600000144444444445444100000000000000000000000000000000
000000000000000000000000ddd1ddd1dd1dd1d0011dd11101445445445441000000600000600000144444444445444100000000000000000000000000000000
00000000000000000000000000000000000000000000000001445445445441000005aaaaaaa50000155555555555555100000000000000000000000000000000
00000000000000000000000000000000000000000000000001555445445441000005aaaa00a50000144444544444444100000000000000000000000000000000
00000000000000000000000000000000000000000000000001445445445441000005aaaaa0a50000144444544444444100000000000000000000000000000000
000000000000000000000000000000000000000000000000014454455554410000005aaaaa500000015555555555551000000000000000000000000000000000
00000000000000000000000000000000000000000000000001445445445441000000055555000000014444444544441000000000000000000000000000000000
00000000000000000000000000000000000000000000000001111111111111000000000000000000001444444544410000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000001111444511110000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000001111110000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000090909000010000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000070707000151001000000010111100100000001000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000006660000155101100000011011110110000001100000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000600000011118100000181001111110000011100000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000100000000011100111111000001110011111100000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000100000000000101551001000000010111100100000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000100000000000001510000000000001111000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000001110000000000000100000000000000000000000000000000000000000000000000000
__label__
111dd110ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1dddaddd1dda10d1dd1dd
dd1dd1d0ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddaaadd1daaa0d1111dd
dd1111d01111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111a11111aa10d1dd1dd
dd1dd1d9d1add9ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddaaad011dd111
111dd110daaad1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1dd9add0d1dd1dd
dd1dd1d011a11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110d1111dd
dd1111d0ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1dd91ddd10d1dd1dd
dd1dd1da0009000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009990000011dd111
111dd1aaa9999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000999909000d1dd1dd
dd1dd1da07999700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000079997000d1111dd
dd111ad000696000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006960000d1dd1dd
dd1dd1d00006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000011dd111
111dd11000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000d1dd1dd
dd1dd1d000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000d1111dd
dd1111d000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000d1dd1dd
dd1dd1d00011100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000001110111011101100011011101000101011101100111011101010101010101110111011000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000077717771777177010770777170017171777177007771999191919191919199919991990000000000000000000000011dd111
111dd11000000000000000000000170170717171717171001701700171717171717017019191919190919191919190919190000000000000000000000d1dd1dd
dd1dd1d000000000000000000000170177017771717077701701700171717771717017019991919199019191999199019190000000000000000000000d1111dd
dd1111d000000000000000000000170171717171717110711701710077717171717117019191999191919991919191919190000000000000000000000d1dd1dd
dd1dd1d00000000000000000000007007070707070707700777077700700707070707770909099909090999090909090999000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000111011101110011001100000011111000000011011100000100011101110111000000110100011100110101000000000000011dd111
111dd11000000000000001777177717771077107700001177777000001077177700001700177717770777000010771700077710771717000000000000d1dd1dd
dd1dd1d000000000000001717170717001710171000001770717700001717170700001700170017000170000017001700017017001707000000000000d1111dd
dd1111d000000000000001777177017700777077700001777077700001717177000001700177017700170000017001700017017001770000000000000d1dd1dd
dd1dd1d00000000000000170017171710110711070000077171770000170717170000171017101700017000000710171011700710171700000000000011dd111
111dd11000000000000000700070707770770077000000077777000000770070700000777077707000070000000770777077700770707000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000ddddd00000000000000000000000000000000000000000550000000000000000000000000000000d1111dd
dd1a11d0000000000000000000000000000000000ddddddd0000000000004444444450000000000000000055f50000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000ddffffff000000000000450000045000000000000555555f55000000000000000000000000000000011dd111
111dd1100000000000000000000000000000000ddff8ff8f0000000000004500000450000000000055a5a555500000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000ddfffffff0000000000004500000450000000000555555555550000000000000000000000000000000d1111dd
dd1111d00000000000000000000000000000000dddffffff0000000000004500000450000000000555555555500000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000dddff000f0000000000004444444450000000000077755555d0000000000000000000000000000000011dd111
111dd11000009000000000000000000000000000dddf8f8f000000000000450000045000000000000555555dd00000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000dddfff8f00000000000045000004500000000000ddd555dd500000000000000000000000000000000d1111dd
dd1111d0000000000000000000000000000000000dd2222210000000044444444444500000000000dddd55d5500000000000000000000000000000000d1dd1dd
dd1dd1d000000a0000000000000000000000000000d1999110000000044444444444500000000000ddddddd500000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000119110000000000044555555450000000000001199115055000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000111110000000000044000000450000000000000111155500000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000010010000000000044000000450000000000000100f00000000000000000000000000000000000d1dd1dd
dd1dd1d000000a90000000000000000000000000000010010000000000044000000450000000000000f00f0000000000000000000000000000000000011dd111
111dd1100000aaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11aaaa000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d0aa9aa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d00999aa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00090a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11009090900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d007999700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000696000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00011100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1111dd
dd1111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1dd1dd
dd1dd1d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dd111
111dd110d1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1dd0d1dd1dd
dd1dd1d011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110d1111dd
dd1111d0ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd10d1dd1dd
dd1dd1d0ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1011dd111

__gff__
0000000000000000000000000000000001000000020004000800100020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4442424242424242424242424242424500000000000000000000000000000000450000000000454545454500000000454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545
4440404040404040404040404040404500000000000000000000000000000000007700000000000000000000000077004577000000000000000000000000774545770000000000000000000000007745457700000000000000000000000077454577000000000000000000000000774545770000101100001819181916177745
4440404040404040404040404040404500000000000000000000000000000000000000000000000000000000000000004500001415141514151415141500004545000000000000000000000000000045450000000000000000000000000000454500000000000000000000000000004545000000202100002829282926270045
44404040404040404040404040404045000000000000000000000000000000000000000000000000000000000000000045000024252425242524252425000045450000000000000000000000000000454500000000000000000000000000004545000000000000000000000000000045450010114a4b10111415141514150045
44404040404040404040404040404045000000000000000000000000000000000000000000000000000000000000000045001011101110111011101110110045450010110000000000000000000000454500000000000000000000000000004545001819000010111011000000000045450020215a5b20212425242524250045
4440404040404040404040404040404500000000000000000000000000000000000000000000000000000000000000004500202120212021202120212021004545002021000000000000000000000045450000000000000000000000000000454500282900002021202100000000004545000000101100001a1b1a1b14150045
4440404040404040404040404040404500000000000010111011000000000000450000101110111011101110110000454500101110111011101110111011004545000000000000000000000000000045450000000000101100000000000000454500181900001011101100000000004545000000202100002a2b2a2b24250045
4440404040404040404040404040404500000000000020212021000000000000450000202120212021202120210000454500202120212021202120212021004545000000000000000000000000000045450000000000202100000000000000454500282900002021202100000000004545000000000000000000001011000045
4440404040404040404040404040404500000000000000000000000000000000450000000000000000000000000000454500101110111011101110111011004545000000000000000000000000000045450000000010111011101100000000454500161700001011101100000000004545000000000000000000002021000045
4440404040404040404040404040404500000000000000000000000000000000000000000000000000000000000000004500202120212021202120212021004545000000000000001011101100000045450000000020212021202100000000454500262700002021202100000000004545000010110000000010114a4b101145
4440404040404040404040404040404500000000000000000000000000000000000000000000000000000000000000004500101110111011101110111011004545000000000000002021202100000045450000000000000000000000000000454500000000000000000000000000004545000020210000000020215a5b202145
4440404040404040404040404040404500000000001415000014150000000000000000141516171415161714150000004500202120212021202120212021004545000000000000000000000000000045450000001819001a1b001a1b00000045450000000000000000000000000000454510114a4b1011000000001011000045
4440404040404040404040404040404500000000002425000024250000000000000000242526272425262724250000004500000000000000000000000000004545000000000000001819181900000045450000002829002a2b002a2b0000004545000000001a1b1617161700000000454520215a5b2021000000002021000045
44404040404040404040404040404045000000000000000000000000000000000000000000000000000000000000000045000014151415141514151415000045450000000000000028292829000000454500000000000000000000000000004545000000002a2b26272627000000004545000010110016171617161700000045
4440404040404040404040404040404500000000000000000000000000000000007700000000000000000000000077004577002425242524252425242500774545770000000000000000000000007745457700000000000000000000000077454577000000000000000000000000774545770020210026272627262700007745
4443434343434343434343434343434500000000000000000000000000000000450000000045454545450000000000454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545
4545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545
45770000000000000000000000007745457700000000000000000000000077454577000000000000000000000000774545771415141514151415141514157745457700000000000000000000000077454577000010110000181916171c1d77454577000000000000000000000000774545770000000000000000000000007745
45000000000000000000000000000045450000000000000000000000000000454500000000000000000000000000004545002425242524252425242524250045450000000000000000000000000000454500000020210000282926272c2d00454500000000000000000000000000004545000000000000000000000000000045
4500000000000000000000000000004545000000000000000000000000000045450000000000000000000000000000454514150000000000000000000014154545000000000000000000000000000045450010114a4b101114151415141500454500000000000000000000000000004545000000000000000000000000000045
4500000000000000000000000000004545000000000000000000000000000045450000000000000000000000000000454524250000001011101100000024254545000000101100001011000000000045450020215a5b202124252425242500454500000000000000000000000000004545000000000000000000000000000045
450000000000000000000000000000454514150000000010110000000000004545000000000010110000000000000045450000000000202120210000000000454500000020211011202110110000004545000000101100001a1b1a1b141500454500000000000000000000000000004545000000000000000000000000000045
450000000000000000000000000000454524250000000020210000000000004545000000000020210000000000000045450000101100000000000010110000454500000010112021101120210000004545000000202100002a2b2a2b242500454500000000000000000000000000004545000000000000000000000000000045
4500000010111011101110110000004545141500001011101110110000000045450000000010111011101100000000454500002021001011101100202100004545000000202110112021101100000045450000000000000000000010110000454500000000000000000000000000004545000000000000000000000000000045
4500000020212021202120210000004545242500002021202120210000000045450000000020212021202100000000454500001011002021202100101100004545000000000020210000202100000045450000000000000000000020210000454500000000000000000000000000004545000000000000000000000000000045
450000000000000000000000000000454500000000000010110000000000004545000000000000000000000000000045450000202100000000000020210000454500000000000000000000000000004545000010110000000010114a4b1011454500000000000000000000000000004545000000000000000000000000000045
450000000000000000000000000000454500000000000020210000000000004545000000000000000000000000000045450000000000101110110000000000454500000000000000000000000000004545000020210000000020215a5b2021454500000000000000000000000000004545000000000000000000000000000045
45000000000016171c1d000000000045450000000000000000000000000000454500000000000000000000000000004545000000000020212021000000000045450000000016171415161700000000454510114a4b10110000000010110000454500000000000000000000000000004545000000000000000000000000000045
45000000000026272c2d000000000045450000000000000000001c1d000000454500000000000000000000000000004545000000000000000000000000000045450000000026272425262700000000454520215a5b20210000000020210000454500000000000000000000000000004545000000000000000000000000000045
45000000000000000000000000000045450000000000000000002c2d0000004545000014151c1d14151415000000004545001c1d1c1d0000000000000000004545000014151c1d14151c1d1415000045450000101100161714151c1d000000454500000000000000000000000000004545000000000000000000000000000045
457700000000000000000000000077454577000000000000000000000000774545770024252c2d24252425000000774545772c2d2c2d0000000000000000774545770024252c2d24252c2d2425007745457700202100262724252c2d000077454577000000000000000000000000774545770000000000000000000000007745
4545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545454545
__sfx__
890801021857018572000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
79021f202434325751247612477224772247722477224762000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4b0700003f67500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
070200002467039661396513964139631396213962139611396110060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000000
05021c1d071600c1700c1600c1600c1600c1600c1600c1600c1600c1600c1600c1600c1500c1500c1500c1500c1500c1500c1500c1500c1400c1400c1400c1400c1300c1300c1300c1300c120000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
012e18000c12013125131250b12013125131250a12013125131250912011125111250812011125111250712013125131250612015125151250712013125131250c10013100131000b10013100131000a10013100
052e18000f1120f1250f1251b1120f1250e1250f1120f1250f1251d1120f1250e125141120f12514125131120f1250c1250e1120e1250e125131120e12511125000000f1000f100000000f1000f100000000f100
012e2f010c0000c0001a0341f0311f0321f0321f0321f0321f0302603126032240322603126032270302603024030260302103023030230101f0201f0321f0320000000000000000000000000000000000000000
012e2f011d03220022200321d0301b0301a0311803218032180321d0311b0301f03014031140321d0301d0321d0321b0311a0311803118032180321a0341f0320000000000000000000000000000000000000000
01170018240351803524034180342402418024240141801424000180002400018000260351d035260341d034260241d024260141d014180002400018000240002b0351b0352b0341b0342b0241b0242b0141b014
031700002b0351b0352b0341b0342b0241b0242b0141b0142b0141b0142b014290202b0212b0222b0222b0222b0222b0322b0322b03234a0034b0034a0034a0034b0034a0034a0034b0034a0034a0034a0034b00
0110000013c400000007c1013c400000007c2006c2003c200ec400000009c0002c2004c0002c2007c300bc300fc400000007c200fc40000000fc000fc4000000000000000011c4011c420000012c4012c4207c40
01100000070530ea34000000ea341ab300ea34000000ea34070530ea340ea340ea341ab300ea34000000ea34070530ea34000000ea341ab300ea34000000ea34070530ea340ea340ea34070530ea341ab300ea34
01100000070530ea34000000ea341ab300ea34000000ea34070530ea340ea340ea341ab300ea34000000ea34070530ea34070530ea341ab300ea34070530ea341ab300ea34070530ea341ab300ea34070530ea33
01100000228302283022830000002280024830228302183021830218301f8001d8301f8001a830000001a8301f8311e8001f830000001f8301a8001d8302283000000000000000021830000001a8300000000000
091000002683026830268301f11622110278302683024830248302483022110218301f110228301a1101f830268301f110268301b1102683022117218301b8301a1101f11022110278301e110218301a1101e110
0110000013c400000007c1013c400000007c2006c2003c200cc400000009c000cc4004c000cc2007c300bc300ac400000007c200ac40000000fc000ac400000000000000000ec400ec42000000ec400ec4207c30
0110000013c400000007c1013c300000007c3005c3007c301ac4000000000000ec3000000000000ec30000000fc400000007c200fc40000000fc000fc40000000ac400000007c200ac40000000fc000000000000
011000000cc400000009c000cc4004c000cc2007c300bc300ac400000007c200ac40000000fc000ac40000001ac4000000000000ec3000000000000ec300000012c3006c1012c330000015c3015c330000000000
01100000228302283022830000002280024830228301d83021830218301f8001f8301f8001a830000002283022832000001f830188301a8301b8301e830000001f8310000000000218301a830188301a83000000
891000001f11622110261101f11622110261171f110221101a1101f110221101a1101f110221101a1101f1101b1101f110221101b1101f110221171b1101f1101a1101f110221101a1161e110211171a1101e110
891000001f11022110261101f11622110261171f11022110181101b1101f110181101b1101f110181101b1101b1101f110221101b1101f110221171b1101f1101a1101e110211101a1161e110211171a1101e110
011000001f83000800008002183000800008001a8301a820228312283222832228321f8311f8321f8321f832268302483022830218301f8301e8301c8301a8301c8301c6331c8301e8301e8301e8321e83200000
89100000181101b1101f110181161b1101f117181101b110161101a1101d110161101a1101d110161101a1101e110211101a1101e110211101a1171e11021110211101e1101a110211161e1101a1172211021110
891000001f11622110261101f11622110261171f110221101a1101a1101f110221101a1101f1101b1101f110221101b1101f110221171b1101f1101a1101f110211101a1161f110211171a1101f1100000000000
011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
01 08094a44
00 08090a44
00 08090b44
00 08090c44
00 41420d44
01 0e51170f
00 13561810
00 14511b0f
00 15591a10
00 0e11170f
00 13161810
00 1411120f
02 15191a10

