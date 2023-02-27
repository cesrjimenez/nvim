local virtual_dap_ok, virtual_dap = pcall(require, "nvim-dap-virtual-text")
if not virtual_dap_ok then
    return
end

virtual_dap.setup()