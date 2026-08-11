-- Red/Black/White theme
-- Monochrome base with red accents for wayfinding
-- No colorscheme dependency — pure highlight groups

local M = {}

local colors = {
    -- Blacks / dark grays
    black0 = "#0a0a0a", -- pure bg
    black1 = "#111111", -- slightly lighter bg
    black2 = "#1a1a1a", -- bg elements (statusline, popups)
    black3 = "#2e2e2e", -- borders, separators
    black4 = "#333333", -- comments, muted
    black5 = "#444444", -- subtle accents

    -- Reds (accent)
    red0 = "#8b0000", -- dark red (dimmed)
    red1 = "#aa0000", -- medium red
    red2 = "#cc1111", -- primary red
    red3 = "#dd2222", -- bright red (visual accent)
    red4 = "#ff3333", -- hot red (errors, bold)

    -- Whites / light grays
    white0 = "#a8a8a8", -- muted text
    white1 = "#cfcfcf", -- normal text
    white2 = "#e6e6e6", -- bright text
    white3 = "#ffffff", -- pure white (headings, current)

    -- Specials
    none = "NONE",
}

M.colors = colors

function M.setup()
    -- Reset
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
    vim.o.background = "dark"
    vim.g.colors_name = "red_black"

    local hi = function(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- ============================================================
    -- Base editor
    -- ============================================================
    hi("Normal", { fg = colors.white1, bg = colors.black0 })
    hi("NormalFloat", { fg = colors.white1, bg = colors.black2 })
    hi("NormalNC", { fg = colors.white0, bg = colors.black0 })
    hi("FloatBorder", { fg = colors.red2, bg = colors.black2 })
    hi("FloatTitle", { fg = colors.red3, bg = colors.black2, bold = true })

    hi("Cursor", { fg = colors.black0, bg = colors.red2 })
    hi("CursorLine", { bg = colors.black2 })
    hi("CursorLineNr", { fg = colors.red2, bg = colors.black2, bold = true })
    hi("LineNr", { fg = colors.black4, bg = colors.black0 })
    hi("SignColumn", { fg = colors.black4, bg = colors.black0 })
    hi("ColorColumn", { bg = colors.black2 })

    hi("Visual", { bg = colors.red0 })
    hi("VisualNOS", { bg = colors.red0 })
    hi("Search", { fg = colors.black0, bg = colors.red3, bold = true })
    hi("IncSearch", { fg = colors.black0, bg = colors.red4, bold = true })
    hi("Substitute", { fg = colors.black0, bg = colors.red3 })

    hi("StatusLine", { fg = colors.white1, bg = colors.black2 })
    hi("StatusLineNC", { fg = colors.black4, bg = colors.black1 })
    hi("WinBar", { fg = colors.white0, bg = colors.black1 })
    hi("WinBarNC", { fg = colors.black4, bg = colors.black0 })
    hi("TabLine", { fg = colors.black4, bg = colors.black1 })
    hi("TabLineFill", { bg = colors.black1 })
    hi("TabLineSel", { fg = colors.red2, bg = colors.black0, bold = true })

    hi("Pmenu", { fg = colors.white1, bg = colors.black2 })
    hi("PmenuSel", { fg = colors.white3, bg = colors.red1, bold = true })
    hi("PmenuSbar", { bg = colors.black3 })
    hi("PmenuThumb", { bg = colors.red1 })

    hi("VertSplit", { fg = colors.black3, bg = colors.black0 })
    hi("WinSeparator", { fg = colors.black3, bg = colors.black0 })

    hi("Folded", { fg = colors.black4, bg = colors.black1 })
    hi("FoldColumn", { fg = colors.black4, bg = colors.black0 })

    hi("MatchParen", { fg = colors.red4, bold = true, underline = true })

    hi("NonText", { fg = colors.black3 })
    hi("SpecialKey", { fg = colors.black4 })
    hi("Whitespace", { fg = colors.black3 })
    hi("EndOfBuffer", { fg = colors.black1 })

    hi("Directory", { fg = colors.red3 })
    hi("Title", { fg = colors.red2, bold = true })
    hi("Question", { fg = colors.red3 })
    hi("MoreMsg", { fg = colors.red2 })
    hi("ModeMsg", { fg = colors.white1, bold = true })
    hi("WarningMsg", { fg = colors.red3 })
    hi("ErrorMsg", { fg = colors.red4, bold = true })

    -- ============================================================
    -- Syntax
    -- ============================================================
    hi("Comment", { fg = colors.black4, italic = true })
    hi("Constant", { fg = colors.white2 })
    hi("String", { fg = colors.white0 })
    hi("Character", { fg = colors.white1 })
    hi("Number", { fg = colors.red2 })
    hi("Boolean", { fg = colors.red3, bold = true })
    hi("Float", { fg = colors.red2 })

    hi("Identifier", { fg = colors.white1 })
    hi("Function", { fg = colors.white3, bold = true })
    hi("Statement", { fg = colors.red2, bold = true })
    hi("Conditional", { fg = colors.red2, bold = true })
    hi("Repeat", { fg = colors.red2, bold = true })
    hi("Label", { fg = colors.red3 })
    hi("Operator", { fg = colors.white0 })
    hi("Keyword", { fg = colors.red3, bold = true })
    hi("Exception", { fg = colors.red4, bold = true })

    hi("PreProc", { fg = colors.red1 })
    hi("Include", { fg = colors.red2 })
    hi("Define", { fg = colors.red2 })
    hi("Macro", { fg = colors.red3 })
    hi("PreCondit", { fg = colors.red2 })

    hi("Type", { fg = colors.white2, bold = true })
    hi("StorageClass", { fg = colors.red2 })
    hi("Structure", { fg = colors.white2, bold = true })
    hi("Typedef", { fg = colors.white2 })

    hi("Special", { fg = colors.red3 })
    hi("SpecialChar", { fg = colors.red3 })
    hi("Tag", { fg = colors.red2 })
    hi("Delimiter", { fg = colors.white0 })
    hi("SpecialComment", { fg = colors.black5, italic = true })
    hi("Debug", { fg = colors.red4 })

    hi("Underlined", { underline = true })
    hi("Ignore", { fg = colors.black3 })
    hi("Error", { fg = colors.red4, bold = true })
    hi("Todo", { fg = colors.black0, bg = colors.red2, bold = true })

    -- ============================================================
    -- Diagnostics
    -- ============================================================
    hi("DiagnosticError", { fg = colors.red4 })
    hi("DiagnosticWarn", { fg = colors.red2 })
    hi("DiagnosticInfo", { fg = colors.white0 })
    hi("DiagnosticHint", { fg = colors.black5 })
    hi("DiagnosticUnderlineError", { sp = colors.red4, undercurl = true })
    hi("DiagnosticUnderlineWarn", { sp = colors.red2, undercurl = true })
    hi("DiagnosticUnderlineInfo", { sp = colors.white0, undercurl = true })
    hi("DiagnosticUnderlineHint", { sp = colors.black5, undercurl = true })
    hi("DiagnosticVirtualTextError", { fg = colors.red4, bg = colors.black1 })
    hi("DiagnosticVirtualTextWarn", { fg = colors.red2, bg = colors.black1 })
    hi("DiagnosticSignError", { fg = colors.red4, bg = colors.black0 })
    hi("DiagnosticSignWarn", { fg = colors.red2, bg = colors.black0 })
    hi("DiagnosticSignInfo", { fg = colors.white0, bg = colors.black0 })
    hi("DiagnosticSignHint", { fg = colors.black5, bg = colors.black0 })

    -- ============================================================
    -- LSP
    -- ============================================================
    hi("LspReferenceText", { bg = colors.black3 })
    hi("LspReferenceRead", { bg = colors.black3 })
    hi("LspReferenceWrite", { bg = colors.red0 })
    hi("LspSignatureActiveParameter", { fg = colors.red3, bold = true, underline = true })
    hi("LspInlayHint", { fg = colors.black5, bg = colors.black1 })

    -- ============================================================
    -- Treesitter
    -- ============================================================
    hi("@comment", { link = "Comment" })
    hi("@keyword", { link = "Keyword" })
    hi("@keyword.function", { fg = colors.red3, bold = true })
    hi("@keyword.return", { fg = colors.red4, bold = true })
    hi("@keyword.operator", { fg = colors.red2 })
    hi("@conditional", { link = "Conditional" })
    hi("@repeat", { link = "Repeat" })
    hi("@operator", { link = "Operator" })
    hi("@punctuation.bracket", { fg = colors.white0 })
    hi("@punctuation.delimiter", { fg = colors.white0 })

    hi("@variable", { fg = colors.white1 })
    hi("@variable.builtin", { fg = colors.red2 })
    hi("@parameter", { fg = colors.white1 })
    hi("@field", { fg = colors.white1 })
    hi("@property", { fg = colors.white1 })

    hi("@function", { fg = colors.white3, bold = true })
    hi("@function.call", { fg = colors.white2 })
    hi("@function.builtin", { fg = colors.red3, bold = true })
    hi("@function.macro", { fg = colors.red3 })
    hi("@method", { fg = colors.white2, bold = true })

    hi("@type", { fg = colors.white2, bold = true })
    hi("@type.builtin", { fg = colors.red2, bold = true })
    hi("@type.qualifier", { fg = colors.red2 })

    hi("@constant", { fg = colors.white2 })
    hi("@constant.builtin", { fg = colors.red3, bold = true })
    hi("@constant.macro", { fg = colors.red3 })

    hi("@string", { link = "String" })
    hi("@number", { link = "Number" })
    hi("@boolean", { link = "Boolean" })

    hi("@preproc", { fg = colors.red1 })
    hi("@define", { fg = colors.red2 })
    hi("@include", { fg = colors.red2 })

    hi("@label", { fg = colors.red3 })

    -- C-specific
    hi("@storageclass.lifetime", { fg = colors.red2 })

    -- ============================================================
    -- Telescope
    -- ============================================================
    hi("TelescopeNormal", { fg = colors.white1, bg = colors.black1 })
    hi("TelescopeBorder", { fg = colors.red2, bg = colors.black1 })
    hi("TelescopePromptNormal", { fg = colors.white2, bg = colors.black2 })
    hi("TelescopePromptBorder", { fg = colors.red3, bg = colors.black2 })
    hi("TelescopePromptTitle", { fg = colors.black0, bg = colors.red2, bold = true })
    hi("TelescopePreviewTitle", { fg = colors.black0, bg = colors.red1 })
    hi("TelescopeResultsTitle", { fg = colors.red2, bg = colors.black1 })
    hi("TelescopeSelection", { fg = colors.white3, bg = colors.red0, bold = true })
    hi("TelescopeMatching", { fg = colors.red3, bold = true })

    -- ============================================================
    -- nvim-tree
    -- ============================================================
    hi("NvimTreeNormal", { fg = colors.white1, bg = colors.black1 })
    hi("NvimTreeRootFolder", { fg = colors.red2, bold = true })
    hi("NvimTreeFolderName", { fg = colors.white1 })
    hi("NvimTreeOpenedFolderName", { fg = colors.white3, bold = true })
    hi("NvimTreeFolderIcon", { fg = colors.red2 })
    hi("NvimTreeFileName", { fg = colors.white0 })
    hi("NvimTreeSpecialFile", { fg = colors.red3, underline = true })
    hi("NvimTreeGitDirty", { fg = colors.red2 })
    hi("NvimTreeGitNew", { fg = colors.white0 })
    hi("NvimTreeIndentMarker", { fg = colors.black3 })

    -- ============================================================
    -- Gitsigns
    -- ============================================================
    hi("GitSignsAdd", { fg = colors.white0, bg = colors.black0 })
    hi("GitSignsChange", { fg = colors.red2, bg = colors.black0 })
    hi("GitSignsDelete", { fg = colors.red4, bg = colors.black0 })

    -- ============================================================
    -- indent-blankline
    -- ============================================================
    hi("IblIndent", { fg = colors.black3 })
    hi("IblScope", { fg = colors.red0 })

    -- ============================================================
    -- Which-key
    -- ============================================================
    hi("WhichKey", { fg = colors.red3 })
    hi("WhichKeyGroup", { fg = colors.white1, bold = true })
    hi("WhichKeyDesc", { fg = colors.white0 })
    hi("WhichKeyBorder", { fg = colors.red2 })
    hi("WhichKeyFloat", { bg = colors.black2 })

    -- ============================================================
    -- nvim-cmp
    -- ============================================================
    hi("CmpItemAbbrMatch", { fg = colors.red3, bold = true })
    hi("CmpItemAbbrMatchFuzzy", { fg = colors.red2 })
    hi("CmpItemKind", { fg = colors.white0 })
    hi("CmpItemKindFunction", { fg = colors.white3 })
    hi("CmpItemKindMethod", { fg = colors.white2 })
    hi("CmpItemKindKeyword", { fg = colors.red2 })
    hi("CmpItemKindVariable", { fg = colors.white1 })
    hi("CmpItemKindSnippet", { fg = colors.red3 })
    hi("CmpItemMenu", { fg = colors.black5, italic = true })

    -- ============================================================
    -- Assembly-specific
    -- ============================================================
    hi("asmRegister", { fg = colors.red2, bold = true })
    hi("asmDirective", { fg = colors.red1 })
    hi("asmLabel", { fg = colors.red3, bold = true })
    hi("asmOpcode", { fg = colors.white3, bold = true })
    hi("asmComment", { fg = colors.black4, italic = true })
end

M.setup()
