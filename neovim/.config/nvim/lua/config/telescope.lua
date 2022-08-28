--Telescope bindings
local map = vim.api.nvim_set_keymap

local silent = { silent = true, noremap = true }
-- Navigate buffers and repos
map("n", "<c-p>", [[<cmd>Telescope buffers show_all_buffers=true theme=get_dropdown<cr>]], silent)
map("n", "<c-P>", [[<cmd>Telescope commands theme=get_dropdown<cr>]], silent)
map("n", "<c-a>", [[<cmd>Telescope buffers show_all_buffers=true theme=get_dropdown<cr>]], silent)
map("n", "<c-e>", [[<cmd>Telescope frecency theme=get_dropdown<cr>]], silent)
map("n", "<c-s>", [[<cmd>Telescope git_files theme=get_dropdown<cr>]], silent)
map("n", "<c-d>", [[<cmd>Telescope find_files theme=get_dropdown<cr>]], silent)
map("n", "<c-g>", [[<cmd>Telescope live_grep theme=get_dropdown<cr>]], silent)

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		layout_strategy = "flex",
		layout_config = { anchor = "N" },
		scroll_strategy = "cycle",
		file_ignore_patterns = { ".git/", "node_modules" },
		extensions = {
			frecency = { workspaces = {} },
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
		pickers = {
			buffers = {
				ignore_current_buffer = true,
				sort_mru = true,
				previewer = false,
			},
		},
		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})

-- Extensions
telescope.load_extension("frecency")
telescope.load_extension("fzf")
telescope.load_extension("ui-select")
