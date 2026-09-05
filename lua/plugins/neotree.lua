return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		keys = {
			-- Los keymaps van aquí, NO dentro de opts
			{ "<leader>e", "<Cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
		},
		opts = {
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab

			-- =========================================================
			-- source_selector: esto agrega las "pestañas" arriba del
			-- árbol para cambiar entre Filesystem / Buffers / Git Status
			-- =========================================================
			source_selector = {
				winbar = true,        -- muestra las pestañas en la winbar (arriba de la ventana)
				statusline = false,
				show_scrolled_off_parent_node = false,
				sources = {
					{ source = "filesystem", display_name = "  Files " },
					{ source = "buffers",    display_name = "  Bufs " },
					{ source = "git_status", display_name = "  Git " },
				},
				content_layout = "start",
				tabs_layout = "equal",
				truncation_character = "…",
				tabs_min_width = nil,
				tabs_max_width = nil,
				padding = 0,
				separator = { left = "▏", right = "▕" },
				separator_active = nil,
				show_separator_on_edge = false,
				highlight_tab = "NeoTreeTabInactive",
				highlight_tab_active = "NeoTreeTabActive",
				highlight_background = "NeoTreeTabInactive",
				highlight_separator = "NeoTreeTabSeparatorInactive",
				highlight_separator_active = "NeoTreeTabSeparatorActive",
			},

			default_component_configs = {
				indent = {
					-- expanders para nesting de archivos
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},

			-- window es hermano de default_component_configs, NO va anidado dentro
			window = {
				position = "left",
				width = 30,
				mappings = {
					["<space>"] = "none", -- liberamos espacio porque es nuestro <leader>
					["<cr>"]    = "open",
					["o"]       = "open",
					["l"]       = "open",       -- abrir archivo / expandir carpeta
					["h"]       = "close_node", -- colapsar carpeta / subir nivel
					["<esc>"]   = "cancel",

					-- Navegar entre las "pestañas" del source_selector
					["<tab>"]   = "next_source",
					["<s-tab>"] = "prev_source",
				},
			},

			-- filesystem también es hermano, NO va dentro de default_component_configs
			filesystem = {
				follow_current_file = { enabled = true }, -- sigue el archivo activo en el árbol
				use_libuv_file_watcher = true,             -- refresca automáticamente al detectar cambios
				filtered_items = {
					visible = false,
					hide_dotfiles = true,
					hide_gitignored = false,
				},
				window = {
					mappings = {
						["."]     = "set_root",
						["H"]     = "toggle_hidden",
						["f"]     = "filter_on_submit",
						["<c-x>"] = "clear_filter",
						["[g"]    = "prev_git_modified",
						["]g"]    = "next_git_modified",
						["o"] = {
							"show_help",
							nowait = false,
							config = { title = "Order by", prefix_key = "o" },
						},
						["oc"] = { "order_by_created", nowait = false },
						["od"] = { "order_by_diagnostics", nowait = false },
						["og"] = { "order_by_git_status", nowait = false },
						["om"] = { "order_by_modified", nowait = false },
						["on"] = { "order_by_name", nowait = false },
						["os"] = { "order_by_size", nowait = false },
						["ot"] = { "order_by_type", nowait = false },
						-- ['<key>'] = function(state) ... end,
					},
				},
			},
			function(_, opts)
				local function on_move(data)
					Snacks.rename.on_rename_file(data.source, data.destination)
				end
				local events = require("neo-tree.events")
				opts.event_handlers = opts.event_handlers or {}
				vim.list_extend(opts.event_handlers, {
					{ event = events.FILE_MOVED, handler = on_move },
					{ event = events.FILE_RENAMED, handler = on_move },
				})
			end,
		},
	},
	{
		"Crysthamus/nvim-file-operations",
		branch = "compat", -- if you are on Neovim <= 0.10
		dependencies = {
			"nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
		},
		config = function()
			require("nvim-file-operations").setup()
		end,
	},
}
