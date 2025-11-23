function mysplit(inputstr, sep)
  if sep == nil then
    sep = ";"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    t[i] = str
    i = i + 1
  end
  return t
end


function addsub(str)

  r = mysplit(str,";")

  op = table.remove(r,1)

  local zahl = 0
  local maxstellen = 0
  for key,val in pairs(r) do
    zahl=zahl+1
    nr =tonumber(val)
    nrs = tostring(nr)
    stellen = #nrs
    stelle=0
    for i=1,#nrs do
      if #nrs > maxstellen then
        maxstellen = #nrs
      end
      stelle=stelle+1
      local c = string.reverse(nrs):sub(i,i)
      local yc=-(0.25+(zahl-1)*0.5)
      local xc=-(0.25+(stelle-1)*0.5)
      local texstring = "\\draw (" .. tostring(xc) .. "," .. tostring(yc) .. ") node {$" .. tostring(c) .. "$};"
      tex.print(texstring)
    end
  end 
  zahl=0
  for key,val in pairs(r) do
    zahl=zahl+1
    if zahl > 1 then
      local yc=-(0.25+(zahl-1)*0.5)
      local xc=-(0.25+(maxstellen)*0.5)
      local texstring = "\\draw (" .. tostring(xc) .. "," .. tostring(yc) .. ") node {$" .. tostring(op) .. "$};"
      tex.print(texstring)  
    end
  end
  local yc=-((zahl+3)*0.5)
  local xc=-((maxstellen+2)*0.5)
  local texstring = "\\draw[gray,step=5mm,thin]  (0.5,0.5) grid ("..xc..","..yc..");"
  tex.print(texstring)
  texstring = "\\draw[black,thick] (0," .. tostring((zahl+1)*-0.5) ..") -- (".. tostring(-(maxstellen+1)*0.5)..",".. tostring((zahl+1)*-0.5)..");"
  tex.print(texstring)
end
function multiplikation(x,y,a,b)
xstart=tonumber(x)+0.25
ystart=tonumber(y)+0.25
cx = xstart
for i=1,#a do
    local c = a:sub(i,i)
    tex.print("\\draw (" .. tostring(cx) .. "," .. tostring(ystart) .. ") node {$" .. tostring(c) .. "$};")
    cx=cx+0.5
end
tex.print("\\draw (" .. tostring(cx) .. "," .. tostring(ystart) .. ") node {$\\cdot$};")
    cx=cx+0.5 
for i=1,#b do
    local c = b:sub(i,i)
      tex.print("\\draw (" .. tostring(cx) .. "," .. tostring(ystart) .. ") node {$" .. tostring(c) .. "$};")
      cx=cx+0.5
end
tex.print("\\draw[black, thick] ("..x..","..y..") -- (".. tostring(cx-0.25) ..","..y..");")
  
end
function div(x,y,a,b)
xstart=tonumber(x)+0.25
ystart=tonumber(y)+0.25
cx = xstart
for i=1,#a do
    local c = a:sub(i,i)
    tex.print("\\draw (" .. tostring(cx) .. "," .. tostring(ystart) .. ") node {$" .. tostring(c) .. "$};")
    cx=cx+0.5
end
tex.print("\\draw (" .. tostring(cx) .. "," .. tostring(ystart) .. ") node {$:$};")
cx=cx+0.5 
for i=1,#b do
    local c = b:sub(i,i)
      tex.print("\\draw (" .. tostring(cx) .. "," .. tostring(ystart) .. ") node {$" .. tostring(c) .. "$};")
      cx=cx+0.5
end
tex.print("\\draw (" .. tostring(cx) .. "," .. tostring(ystart) .. ") node {$=$};")
cx=cx+0.5 
  
end
function term(x,y,a)
xstart=tonumber(x)+0.25
ystart=tonumber(y)+0.25
cx = xstart
for i=1,#a do
    local c = a:sub(i,i)
    if tostring(c)=='*' then 
      c="\\cdot" 
    end
    tex.print("\\draw (" .. tostring(cx) .. "," .. tostring(ystart) .. ") node {$" .. tostring(c) .. "$};")
    cx=cx+0.5
end
   tex.print("\\draw (" .. tostring(xstart-0.5) .. "," .. tostring(ystart-1) .. ") node {$=$};")
end