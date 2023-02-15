---
marp: false
---

# **Marp**

## New project

```
> Flutter create toonflix
> Cd toonflix
> Code .
```

---

## Settings

- Vs code: install Dart, Flutter extension
- editor setting (Ctl + Shift + P)
  - open user settings (settings.json)

```
    "editor.codeActionsOnSave" : {
        "source.fixAll" : truepush -
    },
    "dart.previewFlutterUiGuides": true,
```

**setState() call the build method agai with new data**

### D2 language for diagram

[git bash in VSCode](https://www.geeksforgeeks.org/how-to-integrate-git-bash-with-visual-studio-code/)

```
  "terminal.integrated.profiles.windows": {
    "Git_Bash": {
      "path": "C:\\dev\\Git\\bin\\bash.exe",
      "icon": "terminal-bash"
    }
  }
  ```

[D2 language](https://d2lang.com/tour/install)<br>
[D2 Playground](https://play.d2lang.com/)

---
**20230209**

### Stateful widget

~~Widget lifecycle~~

### Pomodoro

- [x] User interface [sample site](https://www.behance.net/gallery/98918603/POMO-UIKIT?tracking_source=search_projects%7Cpomo+uikit)
- [X] timer
- [X] Pause play
- [ ] Date Format
- [ ] Code challenge

[Dart cheetsheet](https://koenig-media.raywenderlich.com/uploads/2019/08/dart_cheatsheet-1.0.3.pdf)

ozdamby@msn.com
<https://github.com/702ne/dirst>

```
Young@Young-Acer MINGW64 /c/dev/study/dirst
$ git config --global user.name "Young P"

Young@Young-Acer MINGW64 /c/dev/study/dirst
$ git config --global user.email "ozdamby@msn.com"
```

Git setup

```Young@Young-Acer MINGW64 /c/dev/study/dirst
$ git config --global user.name "Young P"

Young@Young-Acer MINGW64 /c/dev/study/dirst
$ git config --global user.email "ozdamby@msn.com"
```

Project Init

```
git init
git add .
git commit -m "nomadcoders : first commit"
git status
git branch -M main
git remote add origin git@github.com:702ne/dirst.git
git push -u origin main
```

Error

```
$ ssh-keygen -t ed25519 -C "ozdamby@msn.com"
**C:\Users\Young\.ssh**
https://github.com/settings/keys

$ git push -f main
$ git remote -v
$ git fetch origin main:tmp
$ git rebase tmp
$ git push
$ git push --set-upstream origin main
$ git push origin main
```

Update

```
```

new project from github

```
git clone git@github.com:702ne/dirst.git newwork
WORKING
git add .
git commit -m "new works"
git checkout -b woring
git push origin working

```

*send pull request*

- merge pull request

- Conflict

- git add .
- git commit -m 'second'
- git pull origin main
- git push origin master
