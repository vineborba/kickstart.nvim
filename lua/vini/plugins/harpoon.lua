return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[Harpoon] Add buffer' })

    vim.keymap.set('n', '<leader>hl', function()
      toggle_telescope(harpoon:list())
    end, { desc = '[Harpoon] Open list' })

    vim.keymap.set('n', '<leader>hc', function()
      harpoon:list():clear()
    end, { desc = '[Harpoon] Clear list' })

    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = '[Harpoon] Select first' })

    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = '[Harpoon] Select second' })

    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = '[Harpoon] Select third' })

    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = '[Harpoon] Select fourth' })

    vim.keymap.set('n', '<leader>]', function()
      harpoon:list():next()
    end, { desc = '[Harpoon] Next buffer' })

    vim.keymap.set('n', '<leader>[', function()
      harpoon:list():prev()
    end, { desc = '[Harpoon] Previous buffer' })
  end,
}
