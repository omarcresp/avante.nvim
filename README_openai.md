<div align="center">
  <img alt="avante.nvim Logo" width="120" src="https://github.com/user-attachments/assets/2e2f2a58-2b28-4d11-afd1-87b65612b2de" />
  <h1>avante.nvim</h1>
  <p>A Neovim Plugin for AI-Driven Code Assistance</p>
</div>

<div align="center">
  [![Neovim v0.10+](https://img.shields.io/static/v1?style=flat-square&label=Neovim&message=v0.10%2B&logo=neovim&labelColor=282828&logoColor=8faa80&color=414b32)](https://neovim.io/)
  [![Lua CI](https://img.shields.io/github/actions/workflow/status/yetone/avante.nvim/lua.yaml?style=flat-square&logo=lua&logoColor=c7c7c7&label=Lua+CI&labelColor=1E40AF&color=347D39&event=push)](https://github.com/yetone/avante.nvim/actions/workflows/lua.yaml)
  [![Rust CI](https://img.shields.io/github/actions/workflow/status/yetone/avante.nvim/rust.yaml?style=flat-square&logo=rust&logoColor=ffffff&label=Rust+CI&labelColor=BC826A&color=347D39&event=push)](https://github.com/yetone/avante.nvim/actions/workflows/rust.yaml)
  [![Python CI](https://img.shields.io/github/actions/workflow/status/yetone/avante.nvim/python.yaml?style=flat-square&logo=python&logoColor=ffffff&label=Python+CI&labelColor=3672A5&color=347D39&event=push)](https://github.com/yetone/avante.nvim/actions/workflows/python.yaml)
  [![Discord](https://img.shields.io/discord/1302530866362323016?style=flat-square&logo=discord&label=Discord&logoColor=ffffff&labelColor=7376CF&color=268165)](https://discord.com/invite/wUuZz7VxXD)
  [![Sponsor](https://dotfyle.com/plugins/yetone/avante.nvim/shield?style=flat-square)](https://patreon.com/yetone)
</div>

> **Note:** This project is under active development. Expect rapid iterations and exciting new features!

---

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
  - [Using lazy.nvim (Recommended)](#using-lazynvim-recommended)
  - [vim-plug](#vim-plug)
  - [Packer](#packer)
  - [Other Methods](#other-methods)
- [Configuration](#configuration)
  - [Default Setup](#default-setup)
  - [Advanced Options](#advanced-options)
- [Usage](#usage)
  - [Key Bindings](#key-bindings)
  - [Commands](#commands)
- [Advanced Topics](#advanced-topics)
  - [Custom Providers](#custom-providers)
  - [Cursor Planning Mode](#cursor-planning-mode)
  - [RAG Service](#rag-service)
  - [Web Search Engines](#web-search-engines)
  - [Custom Prompts](#custom-prompts)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Acknowledgments](#acknowledgments)
- [License](#license)
- [Star History](#star-history)

---

## Overview
**avante.nvim** brings AI-powered code assistance directly to Neovim. Inspired by [Cursor](https://www.cursor.com), it lets you query an AI about your code, preview intelligent suggestions, and apply recommended changes with a single command.
*Requires Neovim v0.10.1 or later.*

---

## Features
- **AI-Driven Assistance:** Ask questions about your code and receive intelligent suggestions.
- **One-Click Application:** Apply AI recommendations directly to your source files.
- **Interactive Chat:** Start chat sessions with AI about your project.
- **Diff & Conflict Resolution:** Seamlessly compare and merge changes.
- **Multi-Provider Support:** Works with providers like Claude, OpenAI, Azure, and more.

---

## Installation

### Using lazy.nvim (Recommended)
```lua
{
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- "*" for latest release or false for latest code
  opts = {
    provider = "openai",
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4o",
      timeout = 30000,
      temperature = 0,
      max_tokens = 4096,
    },
  },
  build = "make", -- Use "make BUILD_FROM_SOURCE=true" to build from source
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- Optional dependencies:
    "echasnovski/mini.pick",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = { use_absolute_path = true },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
  },
}
```

### vim-plug
```vim
" Dependencies
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'

" Optional dependencies
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'

" avante.nvim Plugin
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
autocmd! User avante.nvim lua << EOF
require('avante').setup()
EOF
```

### Packer
```lua
use {
  'yetone/avante.nvim',
  branch = 'main',
  run = 'make',
  config = function()
    require('avante').setup()
  end,
  requires = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'MeanderingProgrammer/render-markdown.nvim',
    -- Optional dependencies:
    'hrsh7th/nvim-cmp',
    'nvim-tree/nvim-web-devicons',
    'HakonHarnes/img-clip.nvim',
    'zbirenbaum/copilot.lua',
  },
}
```

### Other Methods
For installation via [mini.deps](https://github.com/echasnovski/mini.deps) or [Home Manager](https://github.com/nix-community/home-manager), refer to the [wiki](https://github.com/yetone/avante.nvim/wiki).

> **Tip:** To build from source, ensure `cargo` is installed. Otherwise, prebuilt binaries will be fetched using `curl` and `tar`.

---

## Configuration

### Default Setup
The full default configuration is in [config.lua#L9](./lua/avante/config.lua). Here’s an overview of key settings:
```lua
{
  provider = "claude", -- AI provider for planning
  auto_suggestions_provider = "claude",
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-5-sonnet-20241022",
    temperature = 0,
    max_tokens = 4096,
  },
  dual_boost = {
    enabled = false,
    first_provider = "openai",
    second_provider = "claude",
    prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both...",
    timeout = 60000,
  },
  behaviour = {
    auto_suggestions = false,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
    minimize_diff = true,
    enable_token_counting = true,
    enable_cursor_planning_mode = false,
  },
  mappings = { ... }, -- Key bindings configuration
  windows = { ... },  -- Window layout and style
  -- Additional options...
}
```

### Advanced Options
Customize file selectors, prompts, and external integrations (e.g. RAG service, web search engines). For full details, please visit the [wiki](https://github.com/yetone/avante.nvim/wiki).

---

## Usage

1. **Open a Code File:** Start Neovim and open your desired file.
2. **Query the AI:** Use the `:AvanteAsk` command (optionally with a question and position) to get AI suggestions.
3. **Review & Apply:** View AI recommendations in the sidebar and apply changes with a single command or key binding.

### Key Bindings
| Key Combination           | Action                                      |
|---------------------------|---------------------------------------------|
| `<Leader> a a`           | Show sidebar                                |
| `<Leader> a t`           | Toggle sidebar visibility                   |
| `<Leader> a r`           | Refresh sidebar                             |
| `<Leader> a f`           | Switch sidebar focus                        |
| `<Leader> a ?`           | Select model                                |
| `<Leader> a e`           | Edit selected blocks                        |
| `c o`                   | Choose “ours”                               |
| `c t`                   | Choose “theirs”                             |
| `c a`                   | Choose all “theirs”                         |
| `c 0`                   | Choose none                                 |
| `c b`                   | Choose both                                 |
| `c c`                   | Choose cursor                               |
| `] x`                   | Move to previous conflict                   |
| `[ x`                   | Move to next conflict                       |
| `[[`                    | Jump to previous code block                 |
| `]]`                    | Jump to next code block                     |

### Commands
| Command                        | Description                                                      |
|--------------------------------|------------------------------------------------------------------|
| `:AvanteAsk [question]`        | Ask the AI about your code (with optional parameters)            |
| `:AvanteBuild`                 | Build project dependencies                                       |
| `:AvanteChat`                  | Start an interactive chat session about your codebase            |
| `:AvanteEdit`                  | Edit selected code blocks                                        |
| `:AvanteFocus`                 | Toggle focus between the code and the sidebar                      |
| `:AvanteRefresh`               | Refresh all Avante windows                                         |
| `:AvanteSwitchProvider`        | Switch between AI providers                                        |
| `:AvanteShowRepoMap`           | Display your project’s repository structure                        |
| `:AvanteToggle`                | Toggle the Avante sidebar                                          |

---

## Advanced Topics

### Custom Providers
Extend or create your own providers to tailor AI interactions. See the [Custom Providers](https://github.com/yetone/avante.nvim/wiki/Custom-providers) guide for details.

### Cursor Planning Mode
Leverage the [Cursor Planning Mode](./cursor-planning-mode.md) for advanced code planning and applying workflows.

### RAG Service
Enable the RAG service to retrieve context for generating more accurate AI responses. *Note: Requires setting `OPENAI_API_KEY` and Docker (or an alternative like OrbStack on macOS).*

### Web Search Engines
Integrate with multiple web search engines:
- [Tavily](https://tavily.com/)
- [Serpapi](https://serpapi.com/)
- [Searchapi](https://www.searchapi.io/)
- [Google Programmable Search](https://developers.google.com/custom-search/v1/overview)
- [Kagi](https://help.kagi.com/kagi/api/search.html)

Configure via:
```lua
web_search_engine = {
  provider = "tavily", -- Options: tavily, serpapi, searchapi, google, kagi
}
```

### Custom Prompts
Customize system prompts for different modes (planning, editing, suggesting, etc.). Create `*.avanterules` files in your project root to override defaults. See the [templates](https://github.com/yetone/avante.nvim/blob/main/lua/avante/templates) for examples.

---

## Roadmap
- **Enhanced AI Interactions:** More in-depth code analysis and suggestion.
- **LSP & Tree-sitter Integration:** Tighter integration for accurate context.
- **UI/Performance Improvements:** Smoother and more responsive interactions.
- **Additional Features:** Future support for MCP and more advanced functionalities.

---

## Contributing
Contributions are welcome! Please submit pull requests or open issues on GitHub. For guidelines, visit our [wiki](https://github.com/yetone/avante.nvim/wiki).

---

## Acknowledgments
Special thanks to these projects for their inspiration and contributions:
- [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim)
- [ChatGPT.nvim](https://github.com/jackMort/ChatGPT.nvim)
- [img-clip.nvim](https://github.com/HakonHarnes/img-clip.nvim)
- [copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- [jinja.vim](https://github.com/HiPhish/jinja.vim)
- [codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim)
- [aider](https://github.com/paul-gauthier/aider)

---

## License
avante.nvim is licensed under the [Apache 2.0 License](./LICENSE).

---

## Star History
<p align="center">
  <a target="_blank" href="https://star-history.com/#yetone/avante.nvim&Date">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=yetone/avante.nvim&type=Date&theme=dark">
      <img alt="Star History" src="https://api.star-history.com/svg?repos=yetone/avante.nvim&type=Date">
    </picture>
  </a>
</p>
