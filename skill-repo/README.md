# GitHub Auto Upload Skill

一个 Claude Code skill，用于自动创建 GitHub 仓库并上传项目文件。

## 功能

- 🚀 自动初始化 Git 仓库
- 📦 自动创建 GitHub 仓库（通过 GitHub CLI）
- ⬆️ 自动上传代码到 GitHub
- 🎯 交互式配置（仓库名称、可见性、描述等）

## 前置要求

### 1. 安装 GitHub CLI

```bash
# macOS
brew install gh

# Linux (Debian/Ubuntu)
sudo apt install gh

# Linux (Fedora)
sudo dnf install gh

# Windows
winget install GitHub.cli
```

### 2. 认证 GitHub

```bash
gh auth login
```

按照提示完成 GitHub 认证。

## 安装方法

### 方法 1: 使用安装脚本（推荐）⭐

```bash
# 克隆仓库
git clone https://github.com/yangliu2060/claude-github-auto-upload-skill.git

# 运行安装脚本
cd claude-github-auto-upload-skill
./install.sh

# 重启 Claude Code
```

### 方法 2: 手动安装

```bash
# 1. 创建个人 skills 目录
mkdir -p ~/.claude/skills/github-auto-upload

# 2. 下载文件
# 下载 SKILL.md 和 install.sh 到该目录

# 3. 复制文件（如果已克隆仓库）
cp SKILL.md ~/.claude/skills/github-auto-upload/

# 4. 重启 Claude Code
```

## 使用方法

安装完成后，在 Claude Code 中使用以下任一方式调用：

### 直接调用 Skill

```
使用 GitHub Auto Upload skill
```

### 自然语言请求

Claude 会自动识别以下请求并使用此 skill：

```
帮我把这个项目上传到 GitHub
```

```
创建一个新的 GitHub 仓库并上传代码
```

## 工作流程

当你调用这个 skill 时，它会：

1. ✅ 检查当前项目的 Git 状态
2. ✅ 如果没有初始化，运行 `git init`
3. ✅ 询问仓库配置：
   - 仓库名称（默认使用当前目录名）
   - 公开/私有（默认公开）
   - 仓库描述（可选）
4. ✅ 创建 GitHub 仓库
5. ✅ 上传所有文件到 GitHub
6. ✅ 返回仓库链接

## 使用示例

```
用户: 使用 GitHub Auto Upload skill

Claude: 好的，我来帮你创建并上传到 GitHub 仓库。

当前目录: my-project

请提供以下信息：
1. 仓库名称？(默认: my-project)
2. 公开还是私有？(默认: public)
3. 仓库描述？(可选)

用户:
1. my-awesome-project
2. public
3. This is my awesome project

Claude: 开始创建和上传...
✓ Git 仓库已初始化
✓ 文件已暂存
✓ 创建初始提交
✓ GitHub 仓库已创建
✓ 代码已推送

仓库地址: https://github.com/username/my-awesome-project
```

## 适用范围

- ✅ **个人级别 Skill** - 安装后在所有项目中都可用
- ✅ **跨环境** - 在 VS Code、IDE 中都可使用
- ⚠️ **网页版** - 需要项目级别安装（将文件放在项目的 `.claude/skills/github-auto-upload/` 目录）

## 故障排除

### GitHub CLI 未安装

```
Error: gh command not found
```

**解决方案**: 按照上面的安装说明安装 GitHub CLI

### 未认证

```
Error: authentication required
```

**解决方案**: 运行 `gh auth login`

### 仓库已存在

```
Error: repository already exists
```

**解决方案**: 使用不同的仓库名称，或删除现有仓库后重试

## 自定义

你可以编辑 `~/.claude/skills/github-auto-upload/SKILL.md` 来自定义 skill 的行为：

- 修改默认的可见性（public/private）
- 添加自动创建的文件（如 LICENSE、.gitignore 模板）
- 自定义提交信息格式
- 添加自动化的 post-upload 操作

## 技术细节

这个 skill 使用 GitHub CLI (`gh`) 来与 GitHub API 交互，提供了比直接使用 git 命令更简单的仓库创建和管理方式。

## 相关资源

- [GitHub CLI 文档](https://cli.github.com/manual/)
- [Claude Code Skills 文档](https://docs.claude.com/en/docs/claude-code/skills)
- [Git 基础教程](https://git-scm.com/book/en/v2)

## 贡献

欢迎提出改进建议或报告问题！

## 许可证

MIT License
