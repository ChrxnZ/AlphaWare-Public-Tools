local cho = gg.choice
local to = gg.toast
local pr = gg.prompt
local iv = gg.isVisible
local sv = gg.setVisible
local al = gg.alert

Dump = "dump.cs"

function indexOf(list, value)
  for i, v in ipairs(list) do
    if string.find(v, value) then
      return i
    end
  end
  return nil
end

function writeInfo(mO, mN, cN)
infoDump = io.open("infoDump.txt", "a")
infoDump:write('\n' .. "Function Inserted: \n")
infoDump:write(mO .. "\n")
infoDump:write(mN .. "\n")
infoDump:write("\nClass Name: \n")
infoDump:write(cN)
infoDump:close()
end

local dump = io.open(Dump, "r")

local lines = {}

to("Fetching Dump Content. This Will Take About 30s-2m Based On Device Speed...")
for line in dump:lines() do
lines[#lines + 1] = line
end
dump:close()

function Main()
Op = cho({
	"Class Name By Method Offset",
	"Exit"
}, nil, "Dump Has Been Loaded. Choose An Option: (Menu Can Be Re-used For Different Offsets)")

if Op == 1 then
local info = pr({
	"Enter Method Offset",
	"Check Within Range?",
	"Range Of Methods To Search Through: (Type If You Selected Checkbox Above)"
	},
	{[1] = "0x", [2] = true, [3] = "100"},
	{[1] = "Text", [2] = "Checkbox", [3] = "Number"}
	)
	
if info[2] then
O = info[1]
R = tonumber(info[3]) * 3
S = 1
to("Getting Offset List Index. This Will Take About 30s-2m Based On Device Speed...")
indexO = indexOf(lines, O)
al("Method: \n" .. lines[indexO] .. "\n" .. lines[indexO + 1])
while R > 0 do
whileContent = lines[indexO - S]
if string.find(whileContent, "class") then
-- string find pass
al("Class: \n" .. whileContent)
writeInfo(lines[indexO], lines[indexO + 1], whileContent)
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
R = 10000 * 3
S = 1
to("Getting List Indexs. This Will Take About 30s-2m Based On Device Speed...")
indexO = indexOf(lines, O)
indexM = indexO + 1
al("Method: \n" .. lines[indexO] .. "\n" .. lines[indexO + 1])
while R > 0 do
whileContent = lines[indexO - S]
if string.find(whileContent, "class") then
-- string find pass
al("Class: \n" .. whileContent)
writeInfo(lines[indexO], lines[indexO + 1], whileContent)
break
else
-- string find fail
S = S + 1
R = R - 1
end -- string find eol
end -- while r 0 eol
end -- info2 eol
end -- Op eol
if Op == 2 then
os.exit()
end
HOMEDM = -1
end -- main end

while true do
	if iv(true) then
	HOMEDM = 1
	sv(true)
	end
	if HOMEDM == 1 then
	Main()
	end
end
