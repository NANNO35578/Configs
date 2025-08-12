-- lua/nyan_font.lua
local uv = vim.loop

-- 1) 定义码点表（假设你把小猫帧放在 U+E000–U+E00B，彩虹帧在 U+E00C–U+E00D）
local frames = {}
for i = 0, 10 do
  frames[i+1] = utf8.char(0xE000 + i)
end

-- 2) 返回当前要显示的字符
local function get_frame_char()
  -- 用时间做驱动，每 100ms 切一帧
  local t = uv.now() / 100
  local idx = (t % #frames) + 1
  return frames[idx]
end

-- 3) （可选）搞一个定时器，让 statusline 持续刷新
local timer = uv.new_timer()
timer:start(0, 100, vim.schedule_wrap(function()
  -- Neovim 0.8+ 支持全局状态栏 redraw
  vim.cmd("redrawstatus")
end))

-- 4) 导出 lualine 组件
return {
  nyan_font = get_frame_char,
}
