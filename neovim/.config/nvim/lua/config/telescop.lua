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
telescope.load_extension 'frecency'
telescope.load_extension 'fzf'
telescope.load_extension 'ui-select'
telescope.load_extension 'file_browser'
