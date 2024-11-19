-- 定义一个表来存储最近的复制内容
local yank_history = {}
local max_history = 10  -- 设置历史记录的最大数量

-- 监听TextYankPost事件
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    local current_yank = vim.fn.getreg('"')
    -- 将新的复制内容添加到历史记录的开头
    table.insert(yank_history, 1, current_yank)
    -- 如果历史记录超过最大数量,删除最旧的记录
    if #yank_history > max_history then
      table.remove(yank_history)
    end
  end,
})

-- 当前历史记录的索引
local current_index = 1

-- 循环浏览历史记录的函数
local function cycle_yank_history(direction)
  if #yank_history == 0 then
    print("No yank history")
    return
  end
  
  if direction == "next" then
    current_index = (current_index % #yank_history) + 1
  elseif direction == "prev" then
    current_index = ((current_index - 2 + #yank_history) % #yank_history) + 1
  end
  
  local content = yank_history[current_index]
  vim.fn.setreg('"', content)
  vim.cmd('normal! u')
  vim.cmd('normal! ""p')
  print("Yanked " .. current_index .. " of " .. #yank_history)
end

-- 设置快捷键
vim.keymap.set('n', '<C-k>', function() cycle_yank_history("next") end, {noremap = true, silent = true})
vim.keymap.set('n', '<C-j>', function() cycle_yank_history("prev") end, {noremap = true, silent = true})
