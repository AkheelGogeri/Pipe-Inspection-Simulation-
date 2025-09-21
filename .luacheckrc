std = "lua51"
codes = true
max_line_length = 120
ignore = {
  "631",  -- line is too long (we allow some long comments)
}
globals = {
  "sim",          -- CoppeliaSim API
}
