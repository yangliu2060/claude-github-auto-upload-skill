
---
name: GitHub Auto Upload
description: Automatically create a new GitHub repository and upload project files
---

# GitHub Auto Upload Skill

This skill helps you automatically create a new GitHub repository and upload your project files to it.

## What This Skill Does

When invoked, this skill will:

1. **Initialize Git Repository** (if not already initialized)
   - Run `git init` to create a local git repository
   - Create a `.gitignore` file if needed

2. **Prepare Project Files**
   - Stage all project files with `git add .`
   - Create an initial commit

3. **Create GitHub Repository**
   - Use `gh` CLI to create a new repository on GitHub
   - Set up remote origin

4. **Upload to GitHub**
   - Push the code to the main/master branch
   - Verify the upload was successful

## Prerequisites

- GitHub CLI (`gh`) must be installed and authenticated
- Run `gh auth login` if not already authenticated
- Ensure you're in the project directory you want to upload

## Usage Instructions

When you invoke this skill, I will:

1. Ask for the repository name (defaults to current directory name)
2. Ask if the repository should be public or private
3. Ask for an optional description
4. Execute all steps automatically

## Step-by-Step Process

### 1. Check Current Git Status
```bash
git status
```

### 2. Initialize Git (if needed)
```bash
git init
git add .
git commit -m "Initial commit"
```

### 3. Create GitHub Repository
```bash
# Create a public repository
gh repo create <repo-name> --public --source=. --remote=origin --push

# Or create a private repository
gh repo create <repo-name> --private --source=. --remote=origin --push
```

### 4. Verify Upload
```bash
gh repo view --web
```

## Alternative: Manual Step-by-Step

If you prefer more control, I can guide you through each step:

1. **Initialize local repository**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```

2. **Create GitHub repo without auto-push**
   ```bash
   gh repo create <repo-name> --public
   ```

3. **Add remote and push**
   ```bash
   git remote add origin https://github.com/<username>/<repo-name>.git
   git branch -M main
   git push -u origin main
   ```

## Options to Customize

- **Repository Name**: Custom name or use current directory name
- **Visibility**: Public or private
- **Description**: Optional repository description
- **License**: Add a license file (MIT, Apache, GPL, etc.)
- **README**: Create or update README.md
- **.gitignore**: Create appropriate .gitignore for the project type

## Error Handling

I will handle common errors:
- Repository already exists on GitHub
- No git installed
- No GitHub CLI installed
- Authentication issues
- Network connectivity issues

## Example Interaction

```
User: Use the GitHub Auto Upload skill
Assistant: I'll help you create and upload to a GitHub repository.

Current directory: my-awesome-project

Questions:
1. Repository name? (default: my-awesome-project)
2. Public or private? (default: public)
3. Repository description? (optional)

[After your answers, I'll execute all steps automatically]
```

## Post-Upload Actions

After successful upload, I can also:
- Set up branch protection rules
- Configure repository settings
- Create initial issues or project boards
- Set up GitHub Actions workflows
- Add collaborators

## Notes

- This skill uses GitHub CLI (`gh`) which is the recommended way to interact with GitHub
- All operations are reversible - you can delete the repository from GitHub if needed
- The skill will never overwrite existing repositories without confirmation
- Sensitive files (secrets, credentials) should be in .gitignore before upload
