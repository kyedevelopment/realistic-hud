Config              = {}

-- Variables (HUD)
Config.hideArmor    = true -- Hide armor if you don't have it
Config.hideOxygen    = true -- Hide Oxygen if you are not in water
Config.ShowSpeedometer = true -- speedometer on\off (edit html as well to delete\change the switch and text)
Config.Showstreetinfo = true  -- streetinfo on\off (edit html as well to delete\change the switch and text)
Config.Hidemaponfoot = false -- Hide Minimap and streetinfo on foot (Restart the game to apply modifies)
Config.Microphone = false -- on\off microphone system

Config.UnitOfSpeed = "kmh"  -- "kmh" or "mph" (edit html as well)

-- Local values
Config.oxygenMax    = 10 -- Max oxygen
Config.stamina = 100 -- Max stamina

-- General waiting times
Config.WaitValue = 5000 -- Time in milliseconds to load and show hud values, Lower ms could cause issue.
Config.WaitTalk = 300 -- Time delay in milliseconds to enlight microphone when a player is talking 
Config.waitTime     = 400  -- Set to 100 so the hud is more fluid. However, performance will be affected.

-- Saved elements
Config.waitSpawn    = 4000 -- Time to set hud elements back to saved on spawn
Config.waitResource = 100 -- Time to set hud elements back to saved after resource start


-- Hud keys customizable on Fivem keybinding settings
Config.Settingkey = "F7" -- Key to open hud setting menu
Config.Hidehudkey = "PAGEDOWN" --  Default Key to hide all hud components
Config.Showhudkey = "PAGEUP" -- Default Key to hide all hud components
Config.Showmap = "M" -- Default Key to show mini-map 
Config.Hidemap = "N" -- Default Key to hide mini-map 



-- Extra dev
Config.statustrigger = 'esx_status:getStatus'
Config.statustriggerhunger = 'hunger'
Config.statustriggerthirst = 'thirst'
Config.jobtrigger = 'esx:setJob'