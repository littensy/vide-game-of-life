local function lerp(a: number, b: number, alpha: number)
	return a + (b - a) * alpha
end

local function brightness(color: Color3, percent: number, vibrancy: number?)
	local h, s, v = Color3.toHSV(color)
	local goal = math.sign(percent) == 1 and 1 or 0
	local alpha = math.abs(percent)

	s = lerp(s, 1 - goal, alpha * (vibrancy or 0.5))
	v = lerp(v, goal, alpha)

	return Color3.fromHSV(h, s, v)
end

return {
	brightness = brightness,
}
