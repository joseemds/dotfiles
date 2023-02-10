(module config.plugin.treesitter
        {autoload {treesitter nvim-treesitter.configs
                   parsers nvim-treesitter.parsers}})

(treesitter.setup {:highlight {:enable true}
                   :indent {:enable true}
                   :incremental_selection {:enable true
                                           :keymaps {:init_selection :<c-space>
                                                     :node_incremental :<c-space>
                                                     :scope_incremental :<c-s>
                                                     :node_decremental :<c-backspace>}}
                   :textobjects {:select {:enable true
                                          :lookahead true
                                          :keymaps {:af "@function.outer"
                                                    :if "@function.inner"}}
                                 :swap {:enable true
                                        :swap_next {:<leader>a "@parameter.inner"}
                                        :swap_previous {:<leader>A "@parameter.inner"}}}})

