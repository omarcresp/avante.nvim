<div align="center">
  <img alt="logo" width="120" src="https://github.com/user-attachments/assets/2e2f2a58-2b28-4d11-afd1-87b65612b2de" />
  <h1>avante.nvim</h1>
  <p><em>AI-Powered Code Evolution for Neovim</em></p>

  <div align="center">
    <a href="https://neovim.io/" target="_blank">
      <img src="https://img.shields.io/static/v1?style=flat-square&label=Neovim&message=v0.10%2b&logo=neovim&labelColor=282828&logoColor=8faa80&color=414b32" alt="Neovim: v0.10+" />
    </a>
    <a href="https://github.com/yetone/avante.nvim/actions/workflows/lua.yaml" target="_blank">
      <img src="https://img.shields.io/github/actions/workflow/status/yetone/avante.nvim/lua.yaml?style=flat-square&logo=lua&logoColor=c7c7c7&label=Lua+CI&labelColor=1E40AF&color=347D39&event=push" alt="Lua CI status" />
    </a>
    <a href="https://github.com/yetone/avante.nvim/actions/workflows/rust.yaml" target="_blank">
      <img src="https://img.shields.io/github/actions/workflow/status/yetone/avante.nvim/rust.yaml?style=flat-square&logo=rust&logoColor=ffffff&label=Rust+CI&labelColor=BC826A&color=347D39&event=push" alt="Rust CI status" />
    </a>
    <a href="https://discord.com/invite/wUuZz7VxXD" target="_blank">
      <img src="https://img.shields.io/discord/1302530866362323016?style=flat-square&logo=discord&label=Discord&logoColor=ffffff&labelColor=7376CF&color=268165" alt="Discord" />
    </a>
    <a href="https://dotfyle.com/plugins/yetone/avante.nvim">
      <img src="https://dotfyle.com/plugins/yetone/avante.nvim/shield" />
    </a>
  </div>
</div>

![Demo](https://github.com/user-attachments/assets/510e6270-b6cf-459d-9a2f-15b397d1fe53)

## 🚀 Features

- **AI-Powered Code Evolution**
  - Context-aware code suggestions
  - Multi-model support (Claude 3.5 Sonnet, GPT-4o, Copilot, and more)
  - Project-wide understanding with RAG integration

- **Intelligent Workflows**
  - Cursor-style planning mode
  - Dual-model consensus system
  - Real-time codebase analysis

- **Seamless Integration**
  - Native Neovim UI components
  - Smart diff management
  - Cross-file context awareness

- **Advanced Tooling**
  - Web search integration (Tavily, SerpAPI, Google)
  - Custom prompt engineering
  - Token-aware operations

## 📦 Installation

### Requirements
- Neovim 0.10.1+
- `curl`/`tar` or `cargo` for binary management

```lua
-- Using lazy.nvim
{
  "yetone/avante.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    -- Optional dependencies
    "hrsh7th/nvim-cmp",
    "HakonHarnes/img-clip.nvim",
    "zbirenbaum/copilot.lua"
  },
  build = "make",
  opts = {
    provider = "claude",  -- Default AI provider
    claude = {
      model = "claude-3-5-sonnet-20241022",
      max_tokens = 4096
    },
    behaviour = {
      enable_cursor_planning_mode = true
    }
  }
}
```

## ⚙️ Configuration

```lua
require('avante').setup({
  -- Core Configuration
  provider = "claude",
  auto_suggestions_provider = "claude",

  -- AI Providers
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-5-sonnet-20241022",
    temperature = 0,
    max_tokens = 4096
  },

  -- Advanced Features
  dual_boost = {
    enabled = true,
    first_provider = "openai",
    second_provider = "claude"
  },

  -- UI Settings
  windows = {
    position = "right",
    width = 40,
    wrap = true
  },

  -- Tool Integration
  web_search_engine = {
    provider = "tavily",
    api_key = os.getenv("TAVILY_API_KEY")
  }
})
```

**Environment Variables:**
```bash
# Required for chosen provider
export ANTHROPIC_API_KEY="your_key"      # Claude
export OPENAI_API_KEY="your_key"         # OpenAI
export TAVILY_API_KEY="your_key"         # Web Search
```

## 🎮 Usage

### Basic Workflow
1. **Code Analysis**: `:AvanteAsk "Improve this function"`
2. **Review Suggestions**: Navigate through AI-generated diffs
3. **Apply Changes**: Use `co` (choose ours) or `ca` (choose all theirs)

### Key Bindings
| Command               | Description                          | Mode       |
|-----------------------|--------------------------------------|------------|
| `<leader>aa`          | Toggle AI sidebar                   | Normal     |
| `<leader>ae`          | Edit selected code block            | Visual     |
| `]]` / `[[`           | Navigate code suggestions           | Normal     |
| `<M-l>`               | Accept current suggestion           | Insert     |

### Advanced Features
- **Cursor Planning Mode**: Multi-stage code refinement
- **Dual-Model Consensus**: Combine outputs from different AI providers
- **Project Context Analysis**: Use `@codebase` in chat prompts

## 🛠️ Customization

### Custom Prompts
Create `.avanterules` files in your project root:
```jinja
{# planning.avanterules #}
{% extends "base.avanterules" %}

{% block system_prompt %}
You are senior architect specializing in Rust optimizations.
Focus on memory safety and performance improvements.
{% endblock %}
```

### Model Switching
```vim
:AvanteSwitchProvider claude  # Switch to Claude
:AvanteSwitchProvider openai  # Switch to GPT-4
```

## 🤝 Contributing

We welcome contributions! Please see our [contribution guidelines](CONTRIBUTING.md) and:
- Use descriptive commit messages
- Include tests for new features
- Update documentation accordingly

## 📜 Acknowledgments

Special thanks to these amazing projects that inspired avante.nvim:

| Project | License | Contribution |
|---------|---------|--------------|
| [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim) | MIT | Diff visualization |
| [aider](https://github.com/paul-gauthier/aider) | Apache 2.0 | Planning mode concept |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) | MIT | Native integration patterns |

## 📄 License

Apache 2.0 © [Yetone](https://github.com/yetone)

[![Star History](https://api.star-history.com/svg?repos=yetone/avante.nvim&type=Date)](https://star-history.com/#yetone/avante.nvim)
