--[[
local ts_utils = require("nvim-treesitter.ts_utils")
local M = {}

function M.get_current_function_name()
	local current_node = ts_utils.get_node_at_cursor()
	if not current_node then
		return ""
	end

	local expr = current_node

	while expr do
		if expr:type() == "function_definition" then
			break
		end
		expr = expr:parent()
	end

	if not expr then
		return ""
	end

	return (ts_utils.get_node_text(expr:child(1)))[1]
end

return M
]]

local function P(value)
	print(vim.inspect(value))
end

local ts_utils = require("nvim-treesitter.ts_utils")
local ts_query = require("vim.treesitter.query")

function CurrentNode()
	print(ts_utils.get_node_at_cursor())
end

function FunctionName()
	local node = ts_utils.get_node_at_cursor()

	--[[ local node_range = { node:range() }
	print(vim.inspect(vim.api.nvim_buf_get_text(0, node_range[1], node_range[2], node_range[3], node_range[4], {}))) ]]

	while node do
		-- if node:type() == "function_definition" then -- c
		if node:type() == "function_declaration" then -- lua
			break
		end
		node = node:parent()
	end

	if node then
		-- print(vim.inspect(ts_query.get_node_text(node:field("declarator")[1]:field("declarator")[1], 0))) -- c
		print(vim.inspect(ts_query.get_node_text(node:child(), 0))) -- lua
	else
		print("not in a function")
	end
end

function rootNode()
	local parser = vim.treesitter.get_parser()
	local tstree = parser:parse()
	local root = tstree[1]:root()
	P(root:child_count())
end

function getFunctions()
	local tstree = vim.treesitter.get_parser():parse()
	local root = tstree[1]:root()

	local declarations = {}
	local definitions = {}

	local tempnode = root:child(0)

	while tempnode do
		if tempnode:type() == "declaration" then
			-- if node:type() == "function_declaration" then
			table.insert(declarations, tempnode)
			-- table.insert(declarations, unpack(ts_utils.get_node_text(node:field("name")[1])))
		elseif tempnode:type() == "function_definition" then
			table.insert(definitions, tempnode)
		end

		tempnode = tempnode:next_sibling()
	end

	local function getChildText(node, child)
		return ts_query.get_node_text(node:child(child))[1]
	end

	local function getFuncText(node)
		return { getChildText(node, 0), getChildText(node, 1) }
	end

	local function compareFunctions(a, b)
		return (getFuncText(a)[1] == getFuncText(b)[1]) and (getFuncText(a)[2] == getFuncText(b)[2])
	end

	for _, dc in ipairs(declarations) do
		print(unpack(getFuncText(dc)))
	end
	for _, df in ipairs(definitions) do
		print(unpack(getFuncText(df)))
	end
end

function insertLines()
	local rstart
	local rend

	local declarations = {}
	local definitions = {}

	local tstree = vim.treesitter.get_parser():parse()[1]
	local root = tstree:root()

	local tempnode = root:child(0)

	local ondeclaration = false

	local function getChildText(node, child)
		return ts_utils.get_node_text(node:child(child))[1]
	end

	local function getFuncText(node)
		return getChildText(node, 0) .. " " .. getChildText(node, 1)
	end

	while tempnode do
		if ondeclaration and not (tempnode:type() == "declaration") then
			rend = tempnode:prev_sibling():range()
			ondeclaration = false
		end

		if tempnode:type() == "declaration" then
			if not ondeclaration then
				rstart = tempnode:range()
				ondeclaration = true
			end
			table.insert(declarations, getFuncText(tempnode))
		elseif tempnode:type() == "function_definition" then
			if not rstart then
				rend = tempnode:range() - 2
				rstart = rend
			end
			if getChildText(tempnode, 1) ~= "main(void)" then
				table.insert(definitions, getFuncText(tempnode))
			end
		end

		tempnode = tempnode:next_sibling()
	end

	print(rstart .. "-" .. rend)

	P(declarations)
	P(definitions)

	--[[ local nline = { "//range end" }
	vim.api.nvim_buf_set_lines(0, rend + 1, rend + 1, false, nline)

	nline = { "//range start" }
	vim.api.nvim_buf_set_lines(0, rstart, rstart, false, nline) ]]

	for _, df in ipairs(definitions) do
		local hasmatch = false
		for _, dc in ipairs(declarations) do
			if df == dc then
				hasmatch = true
				break
			end
		end
		if hasmatch then
			print(df .. " has a match")
		else
			print(df .. " has no match")
			vim.api.nvim_buf_set_lines(0, rend + 1, rend + 1, false, { df .. ";" })
			rend = rend + 1
		end
	end
end

--[[
-- TODO: break down into modules - make is easily customizeable, ignore main function, default decaration region for when none is found
--]]
