local types = require(script.types)
local solve = require(script.solve)

export type BoardState = types.BoardState
export type BoardCell = types.BoardCell

return {
	solve = solve,
}
