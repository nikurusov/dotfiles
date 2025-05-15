local M = {}

vim.api.nvim_set_hl(0, 'CapsLockOn', { fg = 'yellow', bold = true }) -- Use hex color for better compatibility
vim.api.nvim_set_hl(0, 'CapsLockOff', { fg = 'green', bold = true })

-- On my setup (Wayland) `xset q` does not show capslock state.
local function is_capslock_on()
  local exitcode = os.execute 'cat /sys/class/leds/input*::capslock/brightness | grep "1" -q'
  return exitcode == 0
end

local function create_floating_status()
  local buf = vim.api.nvim_create_buf(false, true)
  local opts = {
    relative = 'editor',
    width = 10,
    height = 1,
    row = 1,
    col = vim.o.columns - 25,
    style = 'minimal',
    border = 'rounded',
  }

  vim.api.nvim_open_win(buf, false, opts)

  local function update_status()
    local capslock_on = is_capslock_on()
    local state_text = capslock_on and 'CAPS: ON' or 'CAPS: OFF'
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { state_text })

    -- Clear existing highlights
    vim.api.nvim_buf_clear_namespace(buf, -1, 0, -1)

    -- Add highlight to the entire line based on Caps Lock state
    if capslock_on then
      vim.api.nvim_buf_add_highlight(buf, -1, 'CapsLockOn', 0, 0, -1)
    else
      vim.api.nvim_buf_add_highlight(buf, -1, 'CapsLockOff', 0, 0, -1)
    end
  end

  update_status()

  vim.loop.new_timer():start(0, 100, vim.schedule_wrap(update_status))
end

create_floating_status()

return M
