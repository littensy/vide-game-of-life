local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local source = vide.source

export type Events = {
	onClick: (() -> ())?,
	onMouseEnter: (() -> ())?,
	onMouseLeave: (() -> ())?,
	onPress: (() -> ())?,
	onRelease: (() -> ())?,
}

local function useButton(events: Events?)
	local hovered = source(false)
	local pressed = source(false)

	local instanceEvents = {
		Activated = function()
			if events and events.onClick then
				events.onClick()
			end
		end,

		MouseEnter = function()
			hovered(true)

			if events and events.onMouseEnter then
				events.onMouseEnter()
			end
		end,

		MouseLeave = function()
			hovered(false)
			pressed(false)

			if events and events.onMouseLeave then
				events.onMouseLeave()
			end
		end,

		MouseButton1Down = function()
			pressed(true)

			if events and events.onPress then
				events.onPress()
			end
		end,

		MouseButton1Up = function()
			pressed(false)

			if events and events.onRelease then
				events.onRelease()
			end
		end,
	}

	return hovered, pressed, instanceEvents
end

return useButton
