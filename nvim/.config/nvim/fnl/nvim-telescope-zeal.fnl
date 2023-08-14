(local setup (fn [parameters]
    (global telescope_zeal_parameters parameters)
))

(local show_impl (fn [ what ]
    (let [
        documentation_sets (. telescope_zeal_parameters "documentation_sets")
        current_set (. documentation_sets what)
        title (. current_set "title")

        previewers   (require :telescope.previewers)
        pickers      (require :telescope.pickers)
        finders      (require :telescope.finders)
        actions      (require :telescope.actions)
        action_state (require :telescope.actions.state)
        conf         (. (require :telescope.config) :values)
        picker       (pickers.new {
            :results_title title
            :finder (finders.new_oneshot_job
                [ "zeal-cli" what ])
            :sorter (conf.generic_sorter)
            :previewer (previewers.new_termopen_previewer {
                :get_command (fn [entry] [ "zeal-cli" what entry.value ])
            })
            :attach_mappings (fn [bufnr]
                (actions.select_default:replace (fn []
                    (let [ selection (action_state.get_selected_entry) ]
                        (os.execute (.. "tmux new-window zeal-cli " what " '" selection.value "'"))))))
        }
    )]
    (picker:find)
)))

(fn show [what]
    (print (. telescope_zeal_parameters what))
    (show_impl what))

{ : setup
  : show
}

