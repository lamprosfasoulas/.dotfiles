local M = {}

-- Adjust these two to your actual paths
local ANSIBLE_VAULT = vim.fn.expand("/Users/lampros/work/it/it-ansible/ansible.venv/bin/ansible-vault")
local VAULT_PASS_FILE = vim.fn.expand("/Users/lampros/work/it/it-ansible/.vault")

function M.decrypt_vault_selection()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line)

  -- strip leading whitespace from each line, drop empty lines
  local clean = {}
  for _, line in ipairs(lines) do
    line = line:gsub("^%s+", "")
    if line ~= "" then
      table.insert(clean, line)
    end
  end

  if #clean == 0 then
    vim.notify("No selection found", vim.log.levels.WARN)
    return
  end

  local enc_file = vim.fn.tempname()
  vim.fn.writefile(clean, enc_file)

  local result = vim.system({
    ANSIBLE_VAULT, "decrypt", enc_file,
    "--vault-password-file", VAULT_PASS_FILE,
    "--output", "-",
  }, { text = true }):wait()

  os.remove(enc_file)

  if result.code ~= 0 then
    vim.notify("ansible-vault decrypt failed:\n" .. (result.stderr or ""), vim.log.levels.ERROR)
    return
  end

  local decrypted_lines = vim.split((result.stdout or ""):gsub("\n$", ""), "\n")

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, decrypted_lines)
  vim.bo[buf].filetype = "yaml"

  local width = math.min(80, vim.o.columns - 4)
  local height = math.min(#decrypted_lines + 2, vim.o.lines - 4)
  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = "minimal",
    border = "rounded",
    title = " Decrypted Vault ",
    title_pos = "center",
  })
end

return M
