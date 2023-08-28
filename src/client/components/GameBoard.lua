local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local logic = require(ReplicatedStorage.client.logic)
local rem = require(ReplicatedStorage.client.composables.rem)

type GameBoardProps = {
	state: vide.Source<logic.BoardState>,
}

local CELL_SIZE = 0.5

local function GameBoard(props: GameBoardProps)
	-- By converting the state to a list of cells, we can bind frames
	-- to numeric indices instead of Vector3s. This is more efficient
	-- because frames will often be re-used instead of destroyed and
	-- recreated for cells that have moved.
	local cells = vide.derive(function()
		local list = {}

		for cell in props.state() do
			table.insert(list, cell)
		end

		return list
	end)

	return vide.indexes(cells, function(value)
		local function position()
			local cell = value()
			return UDim2.new(0.5, rem.use(cell.X * CELL_SIZE), 0.5, rem.use(cell.Y * CELL_SIZE))
		end

		return vide.create "Frame" {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,

			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = rem.udim2(0, CELL_SIZE, 0, CELL_SIZE),
			Position = position,
		}
	end)
end

return GameBoard
