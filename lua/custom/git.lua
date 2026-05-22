local M = {}

local function float_buffer(content, ft, title)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))
  vim.bo[buf].bufhidden = "wipe"

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " " .. title .. " ",
  })

  if ft then
    vim.bo[buf].filetype = ft
  end

  vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true })
end

function M.status()
  local output = vim.fn.system("git status")
  if vim.v.shell_error ~= 0 then
    vim.notify("Not a git repository", vim.log.levels.ERROR)
    return
  end
  float_buffer(output, "git", "Status")
end

function M.diff()
  local output = vim.fn.system("git diff HEAD~1")
  if vim.v.shell_error ~= 0 then
    vim.notify("No previous commit to diff against", vim.log.levels.ERROR)
    return
  end
  float_buffer(output, "diff", "Diff")
end

function M.commit()
  vim.ui.input({ prompt = "Commit message: " }, function(msg)
    if msg and msg ~= "" then
      local result = vim.fn.system("git commit -m " .. vim.fn.shellescape(msg))
      vim.notify(vim.trim(result))
    end
  end)
end

function M.blame()
  local file = vim.fn.expand("%:p")
  local output = vim.fn.system("git blame " .. vim.fn.shellescape(file))
  if vim.v.shell_error ~= 0 then
    vim.notify("Not a git repository", vim.log.levels.ERROR)
    return
  end
  float_buffer(output, "", "Blame")
end

function M.log()
  local output = vim.fn.system("git log --oneline --graph -n 30")
  if vim.v.shell_error ~= 0 then
    vim.notify("Not a git repository", vim.log.levels.ERROR)
    return
  end
  float_buffer(output, "git", "Log")
end

function M.pull()
  local output = vim.fn.system("git pull")
  vim.notify(vim.trim(output))
end

function M.checkout()
  vim.ui.input({ prompt = "Branch name: " }, function(branch)
    if branch and branch ~= "" then
      local result = vim.fn.system("git checkout " .. vim.fn.shellescape(branch))
      vim.notify(vim.trim(result))
    end
  end)
end

return M
