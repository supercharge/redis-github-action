<div align="center">
  <a href="https://superchargejs.com">
    <img width="471" style="max-width:100%;" src="https://superchargejs.com/images/supercharge-text.svg" />
  </a>
  <br/>
  <br/>
  <p>
    <h3>Redis in GitHub Actions</h3>
  </p>
  <p>
    Start a Redis server in your GitHub Actions.
  </p>
  <br/>
  <p>
    <a href="#usage"><strong>Usage</strong></a>
  </p>
  <br/>
  <br/>
  <p>
    <em>Follow <a href="http://twitter.com/marcuspoehls">@marcuspoehls</a> and <a href="http://twitter.com/superchargejs">@superchargejs</a> for updates!</em>
  </p>
</div>

---


## Introduction
This GitHub Action starts a Redis server on the default port `6379`.

This is useful when running tests against a Redis database.


## Usage
A code example says more than 1,000 words. Here’s an exemplary GitHub Action using a Redis server in versions 4 and 5 to test a Node.js app:

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [18.x, 20.x]
        redis-version: [6, 7]

    steps:
    - name: Git checkout
      uses: actions/checkout@v3

    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v3
      with:
        node-version: ${{ matrix.node-version }}

    - name: Start Redis
      uses: supercharge/redis-github-action@2.0.0
      with:
        redis-version: ${{ matrix.redis-version }}

    - run: npm install

    - run: npm test
      env:
        CI: true
```


### Using a Custom Redis Image
You can utilize an alternative Redis image using the `redis-image` input:

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        redis-version: [6.2.4-v4, 6.2.6-v3]

    steps:
    - name: Start Redis
      uses: supercharge/redis-github-action@2.0.0
      with:
        redis-image: redis/redis-stack-server
        redis-version: ${{ matrix.redis-version }}

    - name: …
```


### Using Redis on a Custom Port
You can start the Redis instance on a custom port using the `redis-port` input:

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        redis-version: [6, 7]

    steps:
    - name: Start Redis
      uses: supercharge/redis-github-action@2.0.0
      with:
        redis-version: ${{ matrix.redis-version }}
        redis-port: 12345

    - name: …
```


### Using a Custom Container Name
This GitHub Action provides a Redis Docker container. The default container name is `redis`. It can be helpful to customize the container name. For example, when running multiple Redis instances in parallel. You can customize the container name using the `redis-container-name` input:

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        redis-version: [6, 7]

    steps:
    - name: Start Redis
      uses: supercharge/redis-github-action@2.0.0
      with:
        redis-version: ${{ matrix.redis-version }}
        redis-container-name: redis-auth-token-cache

    - name: …
```


### Using Authentication
Starting in v1.7.0, You can start the Redis with Authentication using the `redis-password` input:

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        redis-version: [6, 7]

    steps:
    - name: Start Redis
      uses: supercharge/redis-github-action@2.0.0
      with:
        redis-version: ${{ matrix.redis-version }}
        redis-password: 'password'

    - name: …
```


### Remove Docker Container on Exit
Starting in v1.9.0, when running this action on a self-hosted runner, it’s helpful to remove the container so its name won’t conflict:

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        redis-version: [6, 7]

    steps:
    - name: Start Redis
      uses: supercharge/redis-github-action@2.0.0
      with:
        redis-version: ${{ matrix.redis-version }}
        redis-remove-container-on-exit: true # false by default

    - name: …
```


## License
MIT © [Supercharge](https://superchargejs.com)

---

> [superchargejs.com](https://superchargejs.com) &nbsp;&middot;&nbsp;
> GitHub [@supercharge](https://github.com/supercharge) &nbsp;&middot;&nbsp;
> Twitter [@superchargejs](https://twitter.com/superchargejs)
