local attach_to_buffer = function(output_bufnr, pattern, command)

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("rt-automagic", { clear = true }),
    pattern = pattern,
    callback = function ()
      local append_data = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
        end
      end

      vim.fn.jobstart(command, {
        stdout_buffered = true,
        on_stdout = append_data,
        on_stderr = append_data,
      })
    end
  })

end

attach_to_buffer(27, "*.go", { "go", "run", "main.go" })
