local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local board = require(ReplicatedStorage.client.board)

local CELL_SIZE = 5

local function GameBoard(props: { state: vide.Source<board.BoardState> })
	return vide.indexes(props.state, function(_, position)
		return vide.create "Frame" {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0, CELL_SIZE, 0, CELL_SIZE),
			Position = UDim2.new(0.5, position.X * CELL_SIZE, 0.5, position.Y * CELL_SIZE),
		}
	end)
end

return GameBoard
