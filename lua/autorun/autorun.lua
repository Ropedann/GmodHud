surface.CreateFont( "NormalText", {
	font = "Arial",
	extended = false,
	size = 20,
	weight = 500,
	blursize = 0,
	antialias =  true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "LockDownTxt", {
	font = "Tahoma",
	extended = false,
	size = 28,
	weight = 300,
	blursize = 0,
	antialias =  true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "BarText", {
	font = "Arial",
	extended = false,
	size = 15,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias =  true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "DocFont", {
	font = "Arial",
	extended = false,
	size = 20,
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias =  true,
	underline = false,
	italic = false,
	strikeout = true,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = true,
} )

local hideHUDElements = {
	["DarkRP_HUD"]	= true,
	["DarkRP_EntityDisplay"]	= false,
	["DarkRP_ZombieInfo"]	= false,
	["DarkRP_LocalPlayerHUD"]	= false,
	["DarkRP_Hungermod"]	= true,
	["DarkRP_Agenda"]	= false,
}
hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if name == "CHudHealth" or name == "CHudBattery" or name == "CHudSuitPower" or name == "CHudAmmo" or name == "CHudSecondaryAmmo" or name == "DarkRP_LocalPlayerHUD"  or name == "DarkRP_Hungermod" or name == "DarkRP_LockdownHUD" or name == CHudVoiceSelfStatus or name == CHudVoiceStatus then
		return false
	end  
end)

arm = LocalPlayer():Armor()
heart = LocalPlayer():Health()
mon = LocalPlayer():getDarkRPVar("money")
enrg = LocalPlayer():getDarkRPVar("Energy")
	
hook.Add("HUDPaint", "DrawMyHud", function()

--[[
	Player Armor
--]]
if arm != LocalPlayer():Armor() then
	local armour = LocalPlayer():Armor()
	draw.RoundedBox(5,40,ScrH() -39,120,15,Color(119,115,115,255))
	if armour < 0 then armour = 0 end
	if armour > 100 then armour = 100 end
	if armour >= 100 then
		draw.RoundedBox(5,40,ScrH() -39,armour*1.2,15,Color(22,165,242,255))
	else
		draw.RoundedBox(5,40,ScrH() -39,armour,15,Color(22,165,242,255))
	end
	draw.SimpleText(LocalPlayer():Armor().."%", "BarText",100,ScrH() -32,Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		local shield = Material( "icon16/shield.png" )
		surface.SetMaterial( shield )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect(20,ScrH()-40, 15, 15 )
	timer.Simple( 5, function() arm = LocalPlayer():Armor() end )
end
--[[
	Player HP
--]]
if heart != LocalPlayer():Health() then
	local hp = LocalPlayer():Health()
	draw.RoundedBox(5,40,ScrH() -60,120,15,Color(119,115,115,255))
	if hp < 0 then hp = 0 end
	if hp > 100 then hp = 100 end
	if hp >= 100 then
		draw.RoundedBox(5,40,ScrH() -60,hp*1.2,15,Color(150,0,0,255))
	else
		draw.RoundedBox(5,40,ScrH() -60,hp,15,Color(150,0,0,255))
	end
	draw.SimpleText(LocalPlayer():Health().."%", "BarText",100,ScrH() -53,Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		local hospital = Material( "icon16/heart.png" )
		surface.SetMaterial( hospital )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect(20,ScrH()-60, 15, 15 )
	timer.Simple( 5, function() heart = LocalPlayer():Health() end )
end

--[[
	Player money
--]]
if mon != LocalPlayer():getDarkRPVar("money") then
	local money = LocalPlayer():getDarkRPVar("money")
	local money = DarkRP.formatMoney(money)
	draw.SimpleText(money, "NormalText",90,ScrH() -80,Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		local moneys = Material( "icon16/money.png" )
		surface.SetMaterial( moneys )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect(20,ScrH()-85, 15, 15 )
		timer.Simple( 5, function() mon = LocalPlayer():getDarkRPVar("money") end )
end

--[[
	Player Energy
--]]
if 50 > LocalPlayer():getDarkRPVar("Energy") then
	local food = LocalPlayer():getDarkRPVar("Energy") or 100
	draw.RoundedBox(5,40,ScrH() -19,120,15,Color(119,115,115,255))
	if food < 0 then food = 0 end
	if food > 100 then food = 100 end
	if food >= 100 then
		draw.RoundedBox(5,40,ScrH() -19,food*1.2,15,Color(242,182,32,255))
	else
		draw.RoundedBox(5,40,ScrH() -19,food,15,Color(242,183,32,255))
	end
	draw.SimpleText(food.."%", "BarText",100,ScrH() -13,Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		local cup = Material( "icon16/cup.png" )
		surface.SetMaterial( cup )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect(20,ScrH()-20, 15, 15 )
	timer.Simple( 5, function() enrg = LocalPlayer():getDarkRPVar("Energy") end )
end
end)
