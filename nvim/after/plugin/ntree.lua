local function ends_with(str, ending)
    return ending == "" or str:sub(- #ending) == ending
end

local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")
local tree_cb = require 'nvim-tree.config'.nvim_tree_callback

local function collapse_all()
    require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end

local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        view.close() -- Close the tree if file was opened
    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)
    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
        view.close() -- Close the tree if file was opened
    end
end

local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)
    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
    end

    -- Finally refocus on tree if it was lost
    view.focus()
end

local function open_nvim_tree(data)
    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1
    local directory = vim.fn.isdirectory(data.file) == 1
    if ends_with(data.file, "COMMIT_EDITMSG") then
        return
    end

    if not real_file and not directory then
        return
    end

    -- open the tree, find the file but don't focus it
    require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

local function open_tab_silent(node)
    local api = require("nvim-tree.api")

    api.node.open.tab(node)
    vim.cmd.tabprev()
end

local config = {
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "l", action = "edit",            action_cb = edit_or_open },
                { key = "L", action = "vsplit_preview",  action_cb = vsplit_preview },
                { key = "h", action = "close_node" },
                { key = "H", action = "collapse_all",    action_cb = collapse_all },
                { key = "T", action = "open_tab_silent", action_cb = open_tab_silent },
                { key = 'R', cb = tree_cb('refresh') },
                { key = 'c', cb = tree_cb('create') },
                { key = 'D', cb = tree_cb('remove') },
                { key = 'r', cb = tree_cb('rename') },
                { key = 'd', cb = tree_cb('cut') },
                { key = 'y', cb = tree_cb('copy') },
                { key = 'p', cb = tree_cb('paste') },
            }
        },
    },
    actions = {
        open_file = {
            quit_on_open = false
        }
    }
}

function SetupVimTree()
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
    require('nvim-tree').setup(config)
end

SetupVimTree()
