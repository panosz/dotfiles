local status, dap_python = pcall(require, "dap-python")
if not status then
  return
end

dap_python.setup("~/venvs/neovim_venv/bin/python")
dap_python.test_runner = "pytest"
