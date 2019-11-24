# Readme

This pre-commit hook ensure you're comitting with the right identity when you have two private keys (perso and work).

You will have to set up some environment variables :

```bash
GIT_PERSO_REMOTE
GIT_PERSO_USERNAME
GIT_PERSO_EMAIL

GIT_PRO_REMOTE
GIT_PRO_USERNAME
GIT_PRO_EMAIL
```