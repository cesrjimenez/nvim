local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- Color table for highlights
-- stylua: ignore
local colors = {
  -- bg       = '#1c1c1c',
  -- bg       = '#262626',
  bg       = '#1e1e2e',
  fg       = '#f3ede3',
  yellow   = '#ffd57a',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#a4d847',
  orange   = '#ff7e53',
  violet   = '#a9a1e1',
  magenta  = '#e482dc',
  blue     = '#7cb0ff',
  red      = '#ff4e86',
  grey     = "#d0d0d0",
  white    = "#f3ede3",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
		globalstatus = true,
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},

		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

-- ins_left({
-- 	function()
-- 		return "▊"
-- 	end,
-- 	color = { fg = colors.yellow }, -- Sets highlighting of component
-- 	padding = { left = 0, right = 1 }, -- We don't need space before this
-- })

ins_left({
	-- mode component
	function()
		return "  "
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.grey,
			i = colors.red,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		-- return { fg = mode_color[vim.fn.mode()], bg = "#1c1c1c" }
		return {
			fg = mode_color[vim.fn.mode()],
			-- bg = "#262626"
			bg = "#1e1e2e",
		}
	end,
	padding = { right = 1 },
})

ins_left({
	"filename",
	path = 1,
	cond = conditions.buffer_not_empty,
	color = { fg = colors.yellow, gui = "bold" },
})

ins_right({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
-- ins_right({
-- 	function()
-- 		return "%="
-- 	end,
-- })

-- ins_right({
-- 	"diff",
-- 	-- Is it me or the symbol for modified us really weird
-- 	-- symbols = { added = " ", modified = "柳", removed = " " },
-- 	-- symbols = { added = "󰐕 ", modified = "󰝦 ", removed = "󰍴 " },
-- 	-- symbols = { added = "󰐕 ", modified = "󰺕 ", removed = "󰍴 " },
-- 	symbols = { added = "󰐕 ", modified = "󰇂 ", removed = "󰍴 " },
-- 	diff_color = {
-- 		added = { fg = colors.green },
-- 		modified = { fg = colors.yellow },
-- 		removed = { fg = colors.red },
-- 	},
-- 	cond = conditions.hide_in_width,
-- })
--
-- ins_right({
-- 	"branch",
-- 	icon = " ",
-- 	color = { fg = colors.violet, gui = "bold" },
-- })

ins_left({
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	-- icon = "󱚟 ",
	icon = "󰺷 ",
	color = { fg = "#ffffff", gui = "bold" },
})

-- ins_right({
-- 	function()
-- 		return "▊"
-- 	end,
-- 	color = { fg = colors.yellow },
-- 	padding = { left = 1 },
-- })

-- Now don't forget to initialize lualine
lualine.setup(config)
