local status_ok, competitest = pcall(require, "competitest")
if not status_ok then
	return
end

competitest.setup({
	testcases_use_single_file = true,
	testcases_directory = vim.fn.expand("~/Code/testcases"),
})
