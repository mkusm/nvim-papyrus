local script_path = debug.getinfo(1, "S").source:sub(2)
local script_dir = script_path:match("(.*/)")
local parent_dir = script_dir:match("(.-)[^%/]+/$")

local keyword_files = {
  "Both_Function",
  "SKSE_Event",
  "SKSE_Function",
  "SKSE_Type",
  "Skyrim_Event",
  "Skyrim_Function",
  "Skyrim_Keyword",
  "Skyrim_Type",
  "SSE_Event",
  "SSE_Function"
}

for _, filename in ipairs(keyword_files) do
  vim.opt_local.complete:append({'k' .. parent_dir .. filename})
end
vim.opt_local.complete:remove({'.'})
