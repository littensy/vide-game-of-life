local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local board = require(ReplicatedStorage.client.board)

local CELL_SIZE = 5

local function Cell(props: { position: Vector3 })
	local function position()
		return UDim2.new(0.5, props.position.X * CELL_SIZE, 0.5, props.position.Y * CELL_SIZE)
	end

	return vide.create "Frame" {
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0, CELL_SIZE, 0, CELL_SIZE),
		Position = position,
	}
end

local function GameBoard(props: { state: vide.Source<board.BoardState> })
	return vide.indexes(props.state, function(_, position)
		return Cell { position = position }
	end)
end

return GameBoard
