local M = {}

local function is_readonly(path)
  local fperm = vim.fn.getfperm(path)
  local writeable = string.find(fperm, 'w')
  if writeable then return false end
  return true
end

function M.checkout()
  local path = vim.api.nvim_buf_get_name(0)
  vim.fn.jobstart(string.format('p4 edit %s', path), {
    stdout_buffered = true,
    on_stdout = function(_, data, _)
      if data then print(data[1]) end
    end,
    on_exit = function(_, data,_)
      vim.api.nvim_command('edit %')
    end
  })
end

return M
