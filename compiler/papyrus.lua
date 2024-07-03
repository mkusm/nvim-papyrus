-- Neovim compiler file
-- Compiler: Papyrus
-- Maintainer: mkusm

function is_wsl()
    return os.getenv("WSL_INTEROP") ~= nil
end

function convert_windows_path_to_linux(path)
    local drive, rest_of_path = path:match("^([%a]):\\(.*)$")
    if drive and rest_of_path then
        local linux_path = "/mnt/" .. string.lower(drive) .. "/" .. rest_of_path
        return linux_path:gsub("\\", "/")
    else
        return path
    end
end

local current_compiler = "papyrus"

-- Check if the command CompilerSet exists
if vim.fn.exists(":CompilerSet") ~= 2 then
  vim.api.nvim_command('command! -nargs=* CompilerSet lua CompilerSet(<f-args>)')
end

-- Save current 'cpo' settings and modify 'cpo'
local cpo_save = vim.opt.cpo:get()
vim.opt.cpo:remove("C")

if vim.g.skyrim_install_path then
  local skyrim_install_path = vim.g.skyrim_install_path

  local papyrus_compiler = skyrim_install_path .. '\\Papyrus Compiler\\PapyrusCompiler.exe'
  local script_for_compilation = vim.api.nvim_buf_get_name(0)
  local skyrim_scripts = skyrim_install_path .. '\\Data\\Source\\Scripts'
  local skyrim_source = skyrim_install_path .. '\\Data\\Source'
  local skyrim_imports = skyrim_install_path .. ';' .. skyrim_source .. ';' .. skyrim_scripts

  if is_wsl() then
      papyrus_compiler = convert_windows_path_to_linux(papyrus_compiler)
      script_for_compilation = convert_windows_path_to_linux(script_for_compilation)
  end

  papyrus_compiler = '"' .. papyrus_compiler .. '"'
  script_for_compilation = '"' .. script_for_compilation .. '"'
  skyrim_imports = '-i="' .. skyrim_imports .. '"'
  skyrim_output = '-o="' .. skyrim_scripts .. '"'
  skyrim_flags = '-f="' .. skyrim_scripts .. '\\TESV_Papyrus_flags.flg"'

  vim.opt.makeprg = papyrus_compiler .. ' ' .. script_for_compilation .. ' ' .. skyrim_imports .. ' ' .. skyrim_output .. ' ' .. skyrim_flags
end

-- Restore 'cpo' settings
vim.opt.cpo = cpo_save

vim.opt_local.errorformat:append({
  [[%f(%l\,%c):\ %m]],
  [[<unknown>(%l\,%c):\ %m]]
})

