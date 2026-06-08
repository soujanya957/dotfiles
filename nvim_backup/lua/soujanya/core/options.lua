local opt = vim.opt -- for conciseness

-- line numbers 
opt.relativenumber = true 
opt.number = true

-- tab & indentation
opt.tabstop = 2
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping 
opt.wrap = false 

-- search settigns 
opt.ignorecase = true 
opt.smartcase = true 

-- cursor line 
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- clipbarod
opt.clipboard:append("unnamedplus")

-- split window
opt.splitright = true
opt.splitbelow = true

-- wrap
opt.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true,
  h = true,
  l = true,
}

opt.list = true

local space = "·"
opt.listchars:append {
	tab = "│─",
	multispace = space,
	lead = space,
	trail = space,
	nbsp = space
}

opt.conceallevel = 2
