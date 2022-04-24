- [conventional-changelog/commitlint: 📓 Lint commit messages](https://github.com/conventional-changelog/commitlint)
- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification)
- [Commitlint/Commitizen Online - lint commit messages online](https://commitlint.io)

Tell your users that you use the Conventional Commits specification

```markdown
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)
```

- **Commits**
    - Short summary of changes (less then 50 chars)
    - Than body that answers on two main question
        - What was the motivation for this change?
        - How does it differ from the previous implementation?
    - Use present tense for commits (i.e. use “change” instead of “changed” or “changes”)
    - Use this naming convention **“TAG: message”**
        - `init:`
            - Initial commit for project
        - `feat:`
            - Some new feature implemented
        - `fix:`
            - Fixed some previous issue
        - `refactor:`
            - Changes that doesn’t affect functionality
        - `docs:`
            - When working with documentation e.g. README
        - `chore:`
			- dependencies update or other maintainence stuff