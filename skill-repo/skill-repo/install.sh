#!/bin/bash

# GitHub Auto Upload Skill - 安装脚本
# 此脚本将 skill 安装到个人 skills 目录，使其在所有项目中可用

echo "🚀 安装 GitHub Auto Upload Skill..."
echo ""

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 目标目录
TARGET_DIR="$HOME/.claude/skills/github-auto-upload"

# 创建目标目录
echo "📁 创建目录: $TARGET_DIR"
mkdir -p "$TARGET_DIR"

# 复制文件
echo "📄 复制 skill 文件..."
cp "$SCRIPT_DIR/SKILL.md" "$TARGET_DIR/"

# 验证安装
if [ -f "$TARGET_DIR/SKILL.md" ]; then
    echo ""
    echo "✅ 安装成功！"
    echo ""
    echo "Skill 已安装到: $TARGET_DIR"
    echo ""
    echo "📝 接下来的步骤："
    echo "1. 重启 Claude Code 使 skill 生效"
    echo "2. 确保已安装并认证 GitHub CLI (gh auth login)"
    echo "3. 在任何项目中使用: '使用 GitHub Auto Upload skill'"
    echo ""
else
    echo ""
    echo "❌ 安装失败！请检查文件是否存在。"
    exit 1
fi
