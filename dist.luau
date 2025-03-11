--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    SuperCool Hub

    This file was built with DarkLua, it is not intended for manual editing.
--]]

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={}b.SecureService=
newcclosure(function(c)local d=cloneref and cloneref(game)or game local e,f=
pcall(function()return cloneref and cloneref(d:GetService(c))or d:GetService(c)
end)return e and f or error('Unable to get service: '..c)end)function b.
GetPlayer()local c,d=pcall(function()return(b.SecureService'Players')end)return
c and(d).LocalPlayer or nil end function b.GetCharacter(c)local d,e=pcall(
function()return c and c.Character or nil end)return d and e or nil end function
b.GetHumanoid(c)local d,e=pcall(function()local d=b.GetCharacter(c)return d and
d:FindFirstChildOfClass'Humanoid'or nil end)return d and e or nil end return b
end function a.b()local b={}function b:Window(c)end return b end function a.c()
local b={Enabled=false}b.Enable=function()end return b end function a.d()local b
={Enabled=false}b.Enable=function()end return b end function a.e()local b={}
function b.init(c)local d,e,f,g=a.load'a',a.load'b',a.load'c',a.load'd'local h,i
=d.GetPlayer(),e:Window{Title='SuperCool Hub | '..c}local j={Combat=i:Tab{Label=
'Combat'},Visuals=i:Tab{Label='Visuals'},Player=i:Tab{Label='Player'}}local k=j.
Combat:Section{Label='Aimbot'}k:Toggle{Label='Aimbot',Callback=function(l,m)g.
Enabled=m end}k:Slider{Label='Aimbot Smoothing',Min=0,Max=20,Value=10,Callback=
function(l,m)g.Smoothing=m end}local l=j.Visuals:Section{Label='ESP'}l:Toggle{
Label='ESP',Callback=function(m,n)f.Enabled=n end}l:Toggle{Label='Boxes',
Callback=function(m,n)f.Boxes=n end}l:Toggle{Label='Tracers',Callback=function(m
,n)f.Tracers=n end}local m=j.Visuals:Section{Label='Player Modifications'}m:
Slider{Label='Player Speed',Min=1,Max=100,Value=16,Callback=function(n,o)local p
=d.GetHumanoid(h)if p then p.WalkSpeed=o end end}end return b end function a.f()
local b={}function b.init(c)end return b end end local b=cloneref and cloneref(
game)or game local c,d=b.PlaceId,{Universal={File=a.load'e',Places={}},[
'Blank Base']={File=a.load'f',Places={1234567890,987654321}}}for e,f in pairs(d)
do if f.Places then for g,h in ipairs(f.Places)do if h==c then f.File.init(e)
return end end end end d.Universal.File.init'Universal'