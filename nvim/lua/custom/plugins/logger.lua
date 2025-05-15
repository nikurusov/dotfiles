-- Define the logging module
local Logger = {}

-- Internal variable for the log file path
local log_file_path = nil

-- Set the log file path
function Logger.set_log_file(path)
  log_file_path = path
end

-- Write a message to the log file
function Logger.log(message)
  if not log_file_path then
    error "Log file path is not set. Use 'set_log_file' to specify the path."
  end

  local file, err = io.open(log_file_path, 'a') -- Open file in append mode
  if not file then
    error('Failed to open log file: ' .. err)
  end

  -- Optional: Add a timestamp
  local timestamp = os.date '[%Y-%m-%d %H:%M:%S]'
  file:write(string.format('%s %s\n', timestamp, message))

  file:close()
end

return Logger
