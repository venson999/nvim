# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

这是一个基于 lazy.nvim 的个人 Neovim 配置,采用模块化结构。配置使用 Lua 编写,遵循现代 Neovim 插件管理最佳实践。

## 架构结构

```
├── init.lua                # 入口文件,加载核心和插件配置
├── lua/
│   ├── core/              # 核心配置
│   │   ├── init.lua       # 加载 autocmd, keymaps, options
│   │   ├── autocmd.lua    # 自动命令(高亮 yank,用 q 关闭特定文件类型)
│   │   ├── keymaps.lua    # 全局键盘映射(leader 为空格)
│   │   └── options.lua    # 编辑器选项
│   ├── plugins/           # lazy.nvim 插件配置(每个插件一个文件)
│   └── lazynvim.lua       # lazy.nvim 设置和初始化
└── after/
    └── lsp/               # LSP 服务器特定配置
        ├── vtsls.lua      # TypeScript/JavaScript + Vue 支持
        └── vue_ls.lua     # Vue 语言服务器配置
```

## 核心设计原则

### 按需加载
- 大多数插件使用 `event = "LazyFile"` (自定义事件,等同于 BufReadPost/BufNewFile/BufWritePre) 或 `cmd` 触发器延迟加载
- `keys` 字段用于定义插件的键映射,同时实现懒加载
- 常用插件(如 treesitter, theme)设置 `lazy = false` 立即加载

### 模块化插件配置
- 每个插件有独立的配置文件在 `lua/plugins/`
- 插件配置返回 table,符合 lazy.nvim 规范
- 使用 `opts` 或 `config` 函数进行配置

### LSP 架构
- 使用 Mason 管理 LSP 服务器、formatters 和 linters
- 通过 `after/lsp/` 目录为特定 LSP 提供自定义配置
- vtsls 配置集成了 Vue TypeScript 插件,支持 `.vue` 文件的类型检查
- 格式化通过 conform.nvim 统一管理,配置的 formatters: stylua (lua), prettier (js/ts/vue/json), isort (python)
- Linting 通过 nvim-lint

## 关键配置细节

### Leader 键
- Leader 设置为空格键 (`vim.g.mapleader = " "`)
- neo-tree 中禁用了空格键以避免冲突

### 自动命令
- `close_with_q`: 特定文件类型(help, qf, fugitive 等)按 q 关闭
- `highlight_yank`: yank 文本时高亮显示
- neo-tree: SessionLoadPost 时自动显示文件树

### 补全系统
- 使用 blink.cmp(替代 nvim-cmp)
- 补全源: lsp, path, snippets, buffer
- 键映射预设: `enter` (Enter 接受,Tab 选择)
- 禁用预选(`preselect = false`)避免自动选择第一项

### 文件导航
- Telescope: `<leader>ff`(文件), `<leader>fb`(buffer), `<leader>fs`(grep), `<leader>fr`(最近), `<leader>fc`(光标下内容)
- Neo-tree: `<leader>ef`(文件浏览器), `<leader>eb`(buffer 浏览器), `<leader>eg`(git 状态)

### Git 集成
- Gitsigns: `<leader>h` 前缀的 git hunk 操作(stage, reset, preview, blame 等)
- Fugitive: `:Git` 命令(简写为 `:git`)

### Treesitter
- 支持语法: lua, vim, vimdoc, json, jsonc, html, css, javascript, vue
- 文本对象: `af`/`if`(函数), `ac`/`ic`(类), `as`(作用域)
- 增量选择: `v`(扩大), `<BS>`(缩小)

## 代码风格

### Lua 配置
- 缩进: 2 空格
- 行宽: 120 字符
- 自动排序 requires: 启用
- 格式化工具: stylua

### 样式指南
- 优先使用 `opts` table 而非完整的 `config` 函数
- 按键映射使用描述字段供 which-key 显示
- 自动命令使用命名 augroup (`user_<name>`)
- 禁止自动添加注释,保持代码简洁

## 常用任务

### 管理插件
```bash
# 同步/安装/更新/清理插件
:nvim

# 查看插件状态
:Lazy

# 更新所有插件
:Lazy update

# 清理未使用的插件
:Lazy clean
```

### LSP 管理
```bash
# 打开 Mason 管理界面
:Mason

# 查看 LSP 信息
:LspInfo

# 格式化当前文件
(自动保存时格式化,或手动触发)
```

### Treesitter
```bash
# 更新 parsers
:TSUpdate

# 安装特定 parser
:TSInstall <language>

# 查看 parser 状态
:TSModuleInfo
```

### 查找和导航
```bash
# 查找文件
<leader>ff

# 搜索文本
<leader>fs

# 查找 buffers
<leader>fb

# 光标下的内容
<leader>fc
```

### Git 操作
```bash
# Git 命令
:git <command>

# 下一个/上一个 hunk
]c / [c

# Stage hunk
<leader>hs

# Preview hunk
<leader>hp

# Blame line
<leader>hb
```

## 已知限制和注意事项

1. **Neo-tree 空格键冲突**: neo-tree 中空格键已禁用以避免与 leader 键冲突
2. **格式化超时**: conform.nvim 格式化超时设置为 500ms,大文件可能需要调整
3. **LSP 延迟加载**: 某些 LSP 功能可能首次打开文件时才初始化
4. **Vue TypeScript**: vtsls 配置依赖 Mason 安装的 vue-language-server
5. **Treesitter 性能**: 禁用了额外的 vim regex 高亮以提升性能

## 文件类型特定配置

### TypeScript/JavaScript
- LSP: vtsls(集成了 Vue 支持)
- 格式化: prettier
- Lint: eslint_d
- Inlay hints: 启用(函数返回类型、参数类型、属性声明类型等)

### Vue
- LSP: vue_ls(通过 vtsls 插件集成)
- 格式化: prettier
- 支持 `<script setup lang="ts">` 语法

### Lua
- LSP: lua_ls
- 格式化: stylua
- 全局变量: `vim` (通过 .luarc.json 配置)
