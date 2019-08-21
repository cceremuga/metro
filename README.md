![matro](https://i.imgur.com/YAnb0yE.png)

Framework tools for supplementing the CI/CD pipeline of your choice on the Salesforce Lightning Platform. 

[![Build Status](https://travis-ci.org/cceremuga/Metro.svg?branch=master)](https://travis-ci.org/cceremuga/Metro)

## Features

### Command Runner

* Execute Apex code post-deploy, once, never again.
  * Or post-package-install if you're the managed package type.

## Dependencies

Get these first, you'll need them to use Metro.

* Salesforce.
* A penchant for automating everything.
* Working knowledge of DevOps type stuff.
* The following third party libraries (if you won't want to use our clones in /lib):
  * [fflib-apex-common](https://github.com/financialforcedev/fflib-apex-common)
  * [fflib-apex-mocks](https://github.com/financialforcedev/fflib-apex-mocks)

## Release Notes

* 8/21/2019
  * Basic support for executing commands and logging them to custom settings.

## TODO

* Prevent commands from running more than once.
* Support async execution via chained queuable.
* Resilient error handling.
* Support for additional phases.

## License

MIT License, see LICENSE.md for more info.