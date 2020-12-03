-- Author : Lord Odin, based on skan-radio mod, simplified and added channels with text names
------------------------------------------------------------------------------------------------------------------------------
require "util"
require "signal_processing"

local updatePeriod = 100
local mod_version = "1.0.5"
local transmittersRequirePower = false
local receiversRequirePower = false
local fullResetCount = 0

local init_done = false

------------------------------------------------------------------------------------------------------------------------------
local function rangeSignal(channel)
	return {index = 1, count = channel or 0, signal = {type = "virtual", name = "R"}}
end
------------------------------------------------------------------------------------------------------------------------------
function destroy_remote_control()
	if global.constant_remote_entity and global.constant_remote_entity.valid then
		global.constant_remote_entity_target.entity.get_control_behavior().parameters = global.constant_remote_entity.get_control_behavior().parameters
		global.constant_remote_entity.destroy()
		global.constant_remote_entity = nil
		global.constant_remote_entity_target = nil
	end
end
------------------------------------------------------------------------------------------------------------------------------
local function getKey(entity)
	return "lox_x" .. entity.position.x .. "y".. entity.position.y
end
------------------------------------------------------------------------------------------------------------------------------
local function isGhostReader(entity)
	return entity ~= nil and (entity.name == "lo-ghost-reader")
end
------------------------------------------------------------------------------------------------------------------------------
local function debugPrint(string)
    local p = game.players[1]
    p.print(string)
end
------------------------------------------------------------------------------------------------------------------------------
local function init_global()
	init_done = true
end
------------------------------------------------------------------------------------------------------------------------------
local function onInit()
    init_global()
end
------------------------------------------------------------------------------------------------------------------------------
local function resetInvalidEntity(stored_entity, entityType)
	-- workaround for game incorrectly thinking devices are invalid on load
	if stored_entity.position ~= nil then
		actual_entity = game.surfaces["nauvis"].find_entity(entityType, stored_entity.position)
		if actual_entity and actual_entity.valid then
			stored_entity.entity = actual_entity
			--debugPrint("Invalid entity found and recovered")
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------
local function storeDevice(new_entity)
	local data = {
		  position			= new_entity.position
		, entity			= new_entity
		}
	if isConstant(new_entity) then
		global.lo_wireless_signals.constant_emmiters[getKey(new_entity)] = new_entity	
	end
	global.lo_wireless_signals.devices[getKey(new_entity)] = data
	return data
end
------------------------------------------------------------------------------------------------------------------------------
function gui_element(parent, new_element)
	if parent[new_element.name] == nil then
		parent.add(new_element)
	end
	return parent[new_element.name]
end
------------------------------------------------------------------------------------------------------------------------------
local function onTick(event)
    if ((event.tick % updatePeriod) ~= 0) then return end
	if not init_done then
		init_global()
	end
		
	if global.constant_remote_entity then
		global.constant_remote_entity_target.entity.get_control_behavior().parameters = global.constant_remote_entity.get_control_behavior().parameters
		for index, player in pairs(game.players) do
			if player.opened ~= global.constant_remote_entity then
				destroy_remote_control()
			end
		end
	end
	
	-- Process devices: transmitters and recievers
	-- create new temp table channels
	-- stage == 0 : iterate only transmitters, write their signals to corresponding key in channels temp table
	-- stage == 1 : iterate only receivers, read signals from corresponding key in channels temp table

	local channels = {}	
	
	for stage = 0,1 do
			for k, device in pairs(global.lo_wireless_signals.devices) do
--	print_signals(channels, "S1 TTT")
				if device.entity.valid then
					local channel = deviceChannel(device)
					if channels[channel] == nil then
						channels[channel] = {}
					end
--	print_signals(channels, "S2 TTT")
					
					if not transmittersRequirePower or device.entity.energy > 0 then 
						if stage == 0 then
							if isConstant(device.entity) then
								local c_signals = device.entity.get_control_behavior().parameters.parameters
								--print_signals(c_signals,"c_signals")
								table.remove(c_signals, 1)
--								c_signals[1].count = 0
								merge_signals(channels[channel], c_signals)
							end
						
						
--	print_signals(channels, "S3 TTT")
							if isTransmitter(device.entity) then
--	print_signals(channels, "S4 TTT")
								
								for i = 1, #wire_colors do -- check both red and green wires
									local c = device.entity.get_circuit_network(wire_colors[i])
--	print_signals(channels, "S5 TTT")
									if c then
										merge_signals(channels[channel], c.signals)
--									print_signals(channels[channel], "Transmitter")
										
--									debugPrint("Transmitter channel = '"..channel.."'")


--									merge_signals(active_signals, c.signals)
--									print_signals(active_signals, "Transmitter")
									end -- if c then
--	print_signals(channels, "T1 TTT")
								end -- for i = 1, #wire_colors do
--	print_signals(channels, "T2 TTT")
							end -- if isTransmitter(entity)
--	print_signals(channels, "T3 TTT")
						else -- i.e.   stage != 0
							if isReceiver(device.entity) then
--							debugPrint("Receiver channel = '"..channel.."'")
--  print_signals(channels, "Receiver")
								formatted = format_signals(channels[channel] or {}, {signal = {type = "virtual", name = "lo-wireless-channel"}, count = channel} )
								if #formatted > 0 then
									device.entity.get_control_behavior().parameters = { parameters = formatted }
								else
									device.entity.get_control_behavior().parameters = nil -- there are no incoming signals, so zero out the output
								end
							end -- if isReceiver(entity)
						end -- if stage
--	print_signals(channels, "T4 TTT")
				end -- if not transmittersRequirePower or device.entity.energy > 0 and device
				else -- !device.entity.valid
					resetInvalidEntity(device)
				end -- if device.entity.valid
--		print_signals(channels, "T5 TTT")
			end -- for k, device in pairs(global.lo_wireless_signals.devices)
--	print_signals(channels, "T6 TTT")
	end --for stage = 0,1
--	print_signals(channels, "T7 TTT")
end
------------------------------------------------------------------------------------------------------------------------------
local function onPlaceEntity(event)
    local entity = event.created_entity
	local device = nil
    if isTransmitter(entity) then
        entity.get_or_create_control_behavior().connect_to_logistic_network = false -- keep it separate from the logistic network
		local device = storeDevice(entity)
		setDeviceChannel(device, deviceChannel(device))

    elseif isReceiver(entity) or isConstant(entity) then
		local device = storeDevice(entity)
		setDeviceChannel(device, deviceChannel(device))		
    end
end
------------------------------------------------------------------------------------------------------------------------------
local function onRemoveEntity(event)
    local entity = event.entity
    if isRadioDevice(entity) then
		global.lo_wireless_signals.devices[getKey(entity)] = nil
		global.lo_wireless_signals.constant_emmiters[getKey(entity)] = nil
    end
end
------------------------------------------------------------------------------------------------------------------------------
onEntitySettingsPasted = function (event)
	if isRadioDevice(event.source) and isRadioDevice(event.destination) then
		local source_device			= global.lo_wireless_signals.devices[getKey(event.source)]
		local destination_device	= global.lo_wireless_signals.devices[getKey(event.destination)]
		
		if source_device == nil or destination_device == nil then
			return
		end
		
		setDeviceChannel(destination_device, deviceChannel(source_device))
	end
end 
------------------------------------------------------------------------------------------------------------------------------

script.on_init(onInit)

script.on_configuration_changed(onConfigChange)

script.on_event(defines.events.on_built_entity, onPlaceEntity)
script.on_event(defines.events.on_robot_built_entity, onPlaceEntity)

script.on_event(defines.events.on_pre_player_mined_item, onRemoveEntity)
script.on_event(defines.events.on_robot_pre_mined, onRemoveEntity)
script.on_event(defines.events.on_entity_died, onRemoveEntity)

script.on_event(defines.events.on_tick, onTick)
script.on_event(defines.events.on_gui_click, onGuiClick)
script.on_event(defines.events.on_entity_settings_pasted, onEntitySettingsPasted)