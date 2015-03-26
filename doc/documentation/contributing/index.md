# Contributing

Thanks for your interest in contributing to Node.js, there are multiple ways
and places you can contribute and we're here to help facilitate that.

## Understanding the workflow of contributions

The workflow currently used by all Node.js contributors is documented in [a
separate document](/documentation/workflow). In that document, you'll find
more information on how contributors determine how to maximize their impact on
the project. Please, read that document first, especially the sections about
[how to pick what to work on next](/documentation/workflow/#index_md_how_to_pick_what_to_work_on_next).

## Reporting an Issue

If you have found what you believe to be an issue with Node.js please do not
hesistate to file an issue on the GitHub project. When filing your issue please
make sure you can express the issue with a reproducible test case, and that
test case should not include any external dependencies. That is to say, the
test case can be executed without anything more than Node.js itself.

When reporting an issue we also need as much information about your environment
that you can include. We never know what information will be pertinent when
trying narrow down the issue. Please include at least the following
information:

 * Version of Node
 * Platform you're running on (OS X, SunOS, Linux, Windows)
 * Architecture you're running on (32bit or 64bit and x86 or ARM)

## Contributing a Feature or Fix

If you have identified an issue or feature that you want to supply the fix for
there are a few steps that you will need to follow. There will be a lot of
interaction with [Git](http://en.wikipedia.org/wiki/Git_%28software%29), if you
want to become more familiar with it consider reading through the freely
available [git-scm book](http://git-scm.com/book).

This also all revolves around the concept of the Pull Request on GitHub, so
read through their
[documentation](https://help.github.com/articles/using-pull-requests) if you
need further guidance.

### Prepare your Environment

You should have previously [installed and configured
Git](https://help.github.com/articles/set-up-git). It's important to note that
for your contribution to be accepted you will need to have configured the email
address and real name. You will also need to have [created an ssh
key](https://help.github.com/articles/generating-ssh-keys) and associated it
with your [GitHub
Account](https://help.github.com/articles/signing-up-for-a-new-github-account).

### Fork

[Fork](https://help.github.com/articles/fork-a-repo) the Node.js repository
which you're looking to contribute. This is the first and most fundamental step
for being able to contribute. This is your own personal copy of the project
which is ready for you to start exploring with your changes.

The following projects are managed by the Node.js team and available for you to
fork and contribute to.

 * [Node.js](https://github.com/joyent/node)
 * [Node.js Website](https://github.com/joyent/node-website)
 * [http-parser](https://github.com/joyent/http-parser)

Once you have forked the project on GitHub, then you'll need to clone and
checkout a copy from your own repository. The following examples will all
assume you're looking to contribute to the Node.js project proper.

```
$ git clone git@github.com:username/node.git
$ cd node
```

You now have a fresh checkout of the repository, next you should add the
upstream repository as a remote that you'll be able to use to refresh your
version and stay in sync while working on your changes.

```
$ git remote add upstream git://github.com/joyent/node.git
$ git fetch upstream
```

### Branch

Contributions for the project should happen on a separate branch, and you
should name the branch something easily identifiable. For instance if you're
going to be fixing issue #1234 consider naming your branch to `fix-issue-1234`.

To create your branch you need to know which branch of upstream you should be
following. For projects that include releases there will be a branch that
matches to the minor number of the release. For instance you will likely find
`v0.8` and `v0.10`, in addition to the current development branch of `master`.

If what you're contributing is a fix for a version of the project that has
already been released, then you should be tracking that branch of the upstream
repository. However if what you're contributing is a new feature you should be
tracking the `master` branch of the project.

The caveat to this is if the only way to fix a problem for an already released
project is by breaking the
[API](http://en.wikipedia.org/wiki/Application_programming_interface) or
[ABI](http://en.wikipedia.org/wiki/Application_binary_interface). If that's the
case you can only fix that on the `master` branch of the project.

If you're contributing a fix for the website though, you only need to track the
master branch.

*NOTE* If you're trying to change something found in a `deps/` directory, that
change should likely be contributed to that upstream project and not the project
you found the dependency. Several of those dependencies are often managed by the
same team and these guidelines, but some aren't (V8 or c-ares for instance).

Now to create your branch, make sure you fetch the latest changes before creating
your tracking branch.

```
$ git fetch upstream
```
Then you can create your tracking branch with your easily identifiable name.

```
$ git checkout -b fix-issue-1234 --track upstream/v0.10
```

### Commit

Make sure you have first [prepared your
environment](#preapre-your-environment), especially having set your email
address and real name. These values will be included in the commits you include
for your contribution, and they need to be set before we continue.

It's important that you include a useful message as you commit your work.
Before your pull request can be integrated all the commits included in that
logical change need to adhere to the following guidelines:

 1. The first line must be no more than 50 characters, and succinctly describe
    what has changed.
 1. The first line must be prefixed with the name of the subsystem this commit
    applies to. (for instance "net: add localAddress and localPort to Socket").
 1. The second line must be blank
 1. Subsequent lines must wrap at 72 columns.
 1. If this commit addresses a specific issue in the tracker make sure to
    [reference it appropriately](https://help.github.com/articles/closing-issues-via-commit-messages)

For instance here's a representative commit message that follows these
guidelines.

```
subsystem: explaining the commit in one line

Body of commit message is a few lines of text, explaining things
in more detail, possibly giving some background about the issue
being fixed, etc etc.

The body of the commit message can be several paragraphs, and
please do proper word-wrap and keep columns shorter than about
72 characters or so. That way `git log` will show things
nicely even when it is indented.

Fixes #1234
```

The first line being succinct and under 50 characters is important because it's
what people see when they're quickly browsing the repository to identify
important changes. You can see some examples if you use `git shortlog` or `git
log --oneline`.

These commit messages can be rewritten at any point before your change has been
integrated, but once the change has been integrated and pushed to the public
repository and branch they're permanent.

### Rebase

It's possible that while working on your changes, other changes may be
committed and pushed upstream that will influence and even potentially conflict
with your existing changes. It's often necessary to rebase your changes against
the current state of the upstream repository such that your changes can be
integrated more easily.

The way to handle this case is by using [`git
rebase`](https://help.github.com/articles/using-git-rebase) to replay your
changes against the current upstream branch.

Start by making sure you have the latest information from the upstream
repository.

```
$ git fetch upstream
```

Then you can rebase against the upstream branch that has moved ahead of where
you had previously created a tracking branch. While you can select from any
repository or branch to rebase against, you generally use the same branch you
selected when creating this branch.

```
$ git rebase upstream/v0.10
```

It's possible that this operation may result in a conflict if Git is not able
to resolve differences in a file that you have also modified. If that's the
case [read about resolving those
conflicts](https://help.github.com/articles/resolving-merge-conflicts-after-a-git-rebase).

### Test

All contributions that fix or add a feature need to be accomodated with a test
if applicable. Tests should be small, isolated, and clearly demonstrate they're
testing what the contribution is changing.

While you're working on your contribution you should be periodically checking
your changes against the results of the the test suite. Here's how you can run
the entire test suite:

```
$ make test
```

We cannot accept changes that break existing tests. So make sure before you
submit your pull request that you didn't break anything that was expected to be
working. If possible test your changes on more than the platform you're
authoring.

For Node.js the tests can be executed individually with the built version of
node with:

```
$ ./node ./test/simple/test-streams2-transform.js
```

Though sometimes it's more appropriate to run them in context of the test suite,
in that case you can use the test runner to run a single test or group with
wild cards:

```
$ python tools/test.py simple/test-stream2-transform
$ python tools/test.py simple/*net* internet
```

### Push

Now that you have your changes in your feature branch that are all related to your
logical change you should push them to your repository on GitHub

```
$ git push origin fix-issue-1234
```

You can push your code here multiple times, though if you [rebase](#rebase) or
otherwise rewrite your branch's history you may have to use a force push those
changes to rewrite the remote repositories history. Force pushing is fine for
your feature branch, but it can't happen on the public/canonical branches for
the project.

### Pull Request

Now you can visit your GitHub repository `https://github.com/username/node` and
you should see a dialog prompting you to [create a pull
request](https://help.github.com/articles/using-pull-requests).
