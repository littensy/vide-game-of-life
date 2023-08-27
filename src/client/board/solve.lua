local types = require(script.Parent.types)

local NEIGHBORS: { Vector3 } = {
	Vector3.new(1, 0, 0),
	Vector3.new(-1, 0, 0),
	Vector3.new(0, 1, 0),
	Vector3.new(0, -1, 0),
	Vector3.new(1, 1, 0),
	Vector3.new(-1, -1, 0),
	Vector3.new(1, -1, 0),
	Vector3.new(-1, 1, 0),
}

local function solve(state: types.BoardState): types.BoardState
	debug.profilebegin("Solver")

	local nextState: types.BoardState = table.clone(state)
	local emptyCellsChecked: types.BoardState = {}

	local function turnAlive(cell: Vector3)
		if emptyCellsChecked[cell] then
			return
		end

		local aliveNeighbors = 0

		for _, neighbor in NEIGHBORS do
			if state[cell + neighbor] then
				aliveNeighbors += 1

				if aliveNeighbors > 3 then
					break
				end
			end
		end

		if aliveNeighbors == 3 then
			nextState[cell] = true
		end

		emptyCellsChecked[cell] = true
	end

	for cell in state do
		local aliveNeighbors = 0

		for _, neighbor in NEIGHBORS do
			if state[cell + neighbor] then
				aliveNeighbors += 1

				if aliveNeighbors > 3 then
					break
				end
			else
				turnAlive(cell + neighbor)
			end
		end

		if aliveNeighbors < 2 or aliveNeighbors > 3 then
			nextState[cell] = nil
		end
	end

	debug.profileend()

	return nextState
end

return solve
