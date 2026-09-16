local M = {}

local custom_dir = vim.fn.stdpath("config") .. "/lua/lampros/custom"

for _, file in ipairs(vim.fn.readdir(custom_dir)) do
    local name = file:match("^(.+)%.lua")
    if name and name ~= "init" then
        M[name] = require("lampros.custom." .. name)
    end
end

return M
