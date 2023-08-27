curl -o scripts/roblox.d.lua https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/globalTypes.d.lua

rojo sourcemap -o sourcemap.json

luau-lsp analyze --settings=scripts/analyze-settings.json --defs=scripts/roblox.d.lua --base-luaurc=.luaurc --sourcemap=sourcemap.json --ignore="modules/**" src

rm scripts/roblox.d.lua
