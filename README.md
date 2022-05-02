# Permifrost Orb for CircleCI

[![CircleCI Build Status](https://circleci.com/gh/hightouchio/permifrost-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/hightouchio/permifrost-orb) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/hightouchio/permifrost-orb)](https://circleci.com/orbs/registry/orb/hightouchio/permifrost-orb) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/hightouchio/permifrost-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

This orb provides helper functionality for managing Snowflake roles and
permissions via CircleCI and [Permifrost](https://gitlab.com/gitlab-data/permifrost).

There is currently only one command defined called apply, which accepts the
same parameters as Permifrost, the most important being `dry-run` and `spec-path`.

An executor is also provided which uses the latest permifrost container from
Gitlab.

See the [CircleCI Orb Registry Page](https://circleci.com/orbs/registry/orb/hightouchio/permifrost-orb)
for detailed documentation on the commands.

## TLDR

Here's two simple steps to getting this working with your data warehouse.
This sets up a dry-run for all commits to non-master/main branches. Once
merged into master/main, Permifrost will run against your Snowflake instance.

Assuming you already have the `roles.yaml` spec created using Permifrost:

- Create a context in CircleCI with your Snowflake Credentials. It must use
  the same environment variables that [Permifrost expects](https://gitlab.com/gitlab-data/permifrost/#connection-parameters). In this example it's called `snowflake_creds`

- Add this to your CircleCI Workflow:

```
version: 2.1
orbs:
  permifrost-orb: hightouchio/permifrost-orb@0.1.1
jobs:
  test-permissions:
    executor: permifrost-orb/default
    steps:
      - checkout
      - permifrost-orb/apply:
          dry-run: true
          spec-path: snowflake/permissions/roles.yaml
  apply-permissions:
    executor: permifrost-orb/default
    steps:
      - checkout
      - permifrost-orb/apply:
          spec-path: snowflake/permissions/roles.yaml
workflows:
  apply-permissions-workflow:
    jobs:
      - test-permissions:
          context: snowflake_creds
          filters:
            branches:
              ignore:
                - master
                - main
      - apply-permissions:
          context: snowflake_creds
          filters:
            branches:
              only:
                - master
                - main
```

## Resources

[CircleCI Orb Registry Page](https://circleci.com/orbs/registry/orb/hightouchio/permifrost-orb) - The official registry page of this orb for all versions, executors, commands, and jobs described.
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.

### How to Contribute

We welcome [issues](https://github.com/hightouchio/permifrost-orb/issues) to
and [pull requests](https://github.com/hightouchio/permifrost-orb/pulls) against
this repository!

### How to Publish

- Create and push a branch with your new features.
- When ready to publish a new production version, create a Pull Request
  from _feature branch_ to `master`.
- The title of the pull request must contain a special semver
  tag: `[semver:<segement>]` where `<segment>` is replaced by one of the following values.

| Increment | Description                       |
| --------- | --------------------------------- |
| major     | Issue a 1.0.0 incremented release |
| minor     | Issue a x.1.0 incremented release |
| patch     | Issue a x.x.1 incremented release |
| skip      | Do not issue a release            |

Example: `[semver:major]`

- Squash and merge. Ensure the semver tag is preserved and entered as a part
  of the commit message.
- On merge, after manual approval, the orb will automatically be published to
  the Orb Registry.
