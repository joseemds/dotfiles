(module config.plugin.toggleterm
  {autoload {toggleterm toggleterm
             terminal toggleterm.terminal
             nvim aniseed.nvim
             }})


(defn togglegit []
  (local lazygit
    (let [
          cmd "lazygit"
          hidden true
          direction :float
          float_opts {:border :curved}
          ]
      (terminal.Terminal:new {: cmd : hidden : direction : float_opt})))
      (lazygit:toggle)
  )

(toggleterm.setup {
                  :open_mapping "<c-s>"
                  :direction :vertical
                  :size 100
                  })

(nvim.set_keymap :n :<leader>gg "<cmd>lua require ('config.plugin.toggleterm').togglegit()<CR>" {:noremap true})



