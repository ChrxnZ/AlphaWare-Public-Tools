local cho = gg.choice
local to = gg.toast
local pr = gg.prompt

Dump = "dump.cs"

function indexOf(list, value)
  for i, v in ipairs(list) do
    if string.find(v, value) then
      return i
    end
  end
  return nil
end



local dump = io.open(Dump, "r")

local lines = {}

to("Fetching Dump Content. This Will Take About 30s-2m Based On Device Speed...")
for line in dump:lines() do
lines[#lines + 1] = line
end
dump:close()

Op = cho({
	"Class Name By Method Offset"
}, nil, "Choose A Option")

if Op == 1 then
local info = pr({
	"Enter Method Offset",
	"Check Within Range?",
	"Range: (Type If You Selected Checkbox Above)"
	},
	{[1] = "0x", [2] = true, [3] = "50"},
	{[1] = "Text", [2] = "Checkbox", [3] = "Number"}
	)
	
if info[2] then
O = info[1]
R = tonumber(info[3])
S = 1
to("Getting Offset List Index. This Will Take About 30s-2m Based On Device Speed...")
indexO = indexOf(lines, O)
print("Method: \n" .. lines[indexO] .. "\n" .. lines[indexO + 1])
while R > 0 do
whileContent = lines[indexO - S]
if string.find(whileContent, "class") then
-- string find pass
print("Class: \n" .. whileContent)
break
else
-- string find fail
S = S + 1
R = R - 1
end -- string find eol
end -- while r 0 eol
else
-- info2 fail
O = info[1]
R = 150
S = 1
to("Getting List Indexs. This Will Take About 1s-30s Based On Device Speed...")
indexO = indexOf(lines, O)
print("Method: \n" .. lines[indexO] .. "\n" .. lines[indexO + 1])
while R > 0 do
whileContent = lines[indexO - S]
if string.find(whileContent, "class") then
-- string find pass
print("Class: \n" .. whileContent)
break
else
-- string find fail
S = S + 1
R = R - 1
end -- string find eol
end -- while r 0 eol
end -- info2 eol
end -- Op eol
