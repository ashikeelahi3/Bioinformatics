# Github Commands

## Clone a repository

```bash
git clone https://github.com/ashikeelahi3/Bioinformatics.git
```

## Creating a new branch

```bash
git branch newBranchName
```

## Switching to a branch

```bash
git switch branchName
```

## Adding code in github

```bash
git add .
git commit -m "A simple and logical message"
git push
```

If you want to push code in a new branch, then ```git push``` will give you a error. To resolve the error, you can use the following command

```bash
git push --set-upstream origin new
```
