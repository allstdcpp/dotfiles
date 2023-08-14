local _2afile_2a = "/usr/home/bdavidson/.config/nvim/fnl/nvim-telescope-zeal.fnl"
local setup
local function _1_(parameters)
  telescope_zeal_parameters = parameters
  return nil
end
setup = _1_
local show_impl
local function _2_(what)
  local documentation_sets = telescope_zeal_parameters.documentation_sets
  local current_set = documentation_sets[what]
  local title = current_set.title
  local previewers = require("telescope.previewers")
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local conf = (require("telescope.config")).values
  local picker
  local function _3_(entry)
    return {"zeal-cli", what, entry.value}
  end
  local function _4_(bufnr)
    local function _5_()
      local selection = action_state.get_selected_entry()
      return os.execute(("tmux new-window zeal-cli " .. what .. " '" .. selection.value .. "'"))
    end
    return (actions.select_default):replace(_5_)
  end
  picker = pickers.new({results_title = title, finder = finders.new_oneshot_job({"zeal-cli", what}), sorter = conf.generic_sorter(), previewer = previewers.new_termopen_previewer({get_command = _3_}), attach_mappings = _4_})
  return picker:find()
end
show_impl = _2_
local function show(what)
  print(telescope_zeal_parameters[what])
  return show_impl(what)
end
return {setup = setup, show = show}