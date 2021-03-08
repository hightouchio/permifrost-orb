# Permifrost Orb for CircleCI

[![CircleCI Build Status](https://circleci.com/gh/hightouchio/permifrost-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/hightouchio/permifrost-orb) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/hightouchio/permifrost-orb)](https://circleci.com/orbs/registry/orb/hightouchio/permifrost-orb) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/hightouchio/permifrost-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

This orb provides helper functionality for managing Snowflake roles and
permissions via CircleCI.

There is currently only one command defined called apply

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
