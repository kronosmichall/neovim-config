local packer = require("packer")
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use({ "nanotech/jellybeans.vim" }) -- color scheme
	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
end)
