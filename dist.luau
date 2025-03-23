--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    SuperCool Hub

    This file was built with DarkLua, it is not intended for manual editing.
--]]

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={}b.SecureService=function(
c)local d=cloneref and cloneref(game)or game local e,f=pcall(function()return
cloneref and cloneref(d:GetService(c))or d:GetService(c)end)return e and f or
nil end b.SecureService=newcclosure and newcclosure(b.SecureService)or b.
SecureService function b.GetPlayer()local c,d=pcall(function()return(b.
SecureService'Players')end)return c and(d).LocalPlayer or nil end function b.
GetCharacter(c)local d,e=pcall(function()return c and c.Character or nil end)
return d and e or nil end function b.GetHumanoid(c)local d,e=pcall(function()
local d=b.GetCharacter(c)return d and d:FindFirstChildOfClass'Humanoid'or nil
end)return d and e or nil end return b end function a.b()local b={}function b:
Window(c)end return b end function a.c()local b={Enabled=false,Boxes=false,
Tracers=false}b.Initialize=function()end return b end function a.d()local b={
Aimbot={Enabled=false,Smoothing=0},Triggerbot={Enabled=false,Delay=0}}b.
Initialize=function()end return b end function a.e()return function(b)print''
local c,d,e,f=a.load'a',a.load'b',a.load'c',a.load'd'local g,h,i,j=c.
SecureService,c.GetPlayer(),f.Aimbot,f.Triggerbot local k,l=g'Workspace',d:
Window{Title=`SuperCool Hub | {b}`}local m={Combat=l:Tab{Label='Combat'},Visuals
=l:Tab{Label='Visuals'},Player=l:Tab{Label='Player'}}do local n={Aimbot=m.Combat
:Section{Label='Aimbot'},Triggerbot=m.Combat:Section{Label='Triggerbot'}}n.
Aimbot:Toggle{Label='Enabled',Callback=function(o,p)i.Enabled=p end}n.Aimbot:
Slider{Label='Smoothing',Min=0,Max=20,Value=10,Callback=function(o,p)i.Smoothing
=p end}n.Triggerbot:Toggle{Label='Enabled',Callback=function(o,p)j.Enabled=p end
}n.Triggerbot:Slider{Label='Delay',Min=0,Max=1,Value=0,Precision=3,Callback=
function(o,p)j.Delay=p end}end do local n={ESP=m.Visuals:Section{Label='ESP'}}n.
ESP:Toggle{Label='Enabled',Callback=function(o,p)e.Enabled=p end}n.ESP:Toggle{
Label='Boxes',Callback=function(o,p)e.Boxes=p end}n.ESP:Toggle{Label='Tracers',
Callback=function(o,p)e.Tracers=p end}end do local n={PlayerModification=m.
Player:Section{Label='Player Modification'}}n.PlayerModification:Slider{Label=
'Player Speed',Min=1,Max=100,Value=16,Callback=function(o,p)local q=c.
GetHumanoid(h)if q then q.WalkSpeed=p end end}n.World:Slider{Label='Camera FOV',
Min=1,Max=120,Value=70,Precision=3,Callback=function(o,p)local q=k.CurrentCamera
q.FieldOfView=p end}end d.Setup()e.Initialize()f.Initialize()end end function a.
f()return function(b)end end end local b={Universal={File=a.load'e',Places={}},[
'Blank Base']={File=a.load'f',Places={1234567890,987654321}}}for c,d in pairs(b)
do if d.Places then for e,f in ipairs(d.Places)do if f==game.PlaceId then d.
File(c)return end end end end b.Universal.File'Universal'