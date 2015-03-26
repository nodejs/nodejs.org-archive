# Workflow guidelines

## Introduction

This document describes the workflow used by Node.js contributors to
contribute to the project as efficiently as possible. It starts by describing
the most common workflow for issues and pull-requests. Then, it describes the
most common use cases for contributors: how to find the next issue to work on
that will maximize their impact on the project. Finally, it describes in
greater details the set of tools and concepts that were mentioned in the first
two sections.

In this document, the term "contributor" represents anybody who spends some
time to improve the Node.js project. It isn't limited to core team members.
When a distinction needs to be made, more specific terms such as "core team
member" or "collaborator" are used.

## Flexible workflow, only two strict rules

We understand that work within an open source project with a large number of
contributors needs to remain flexible. For this reason, most of the items
described in this document are optional. There are only two hard, mandatory
rules:

1. __Using milestones__. Before merging changes in the repository, they _need_ to
be associated to a pull-request that has been _added_ to a specific milestone.
For more details about adding issues/pull requests to a milestone, see [the
corresponding
section](#index_md_adding_issues_and_pull_requests_to_a_milestone).

2. __Testing changes__. Changes are merged from pull requests' branches into
Node.js' code repository _only_ by [the node-accept-pull-request Jenkins
job](#index_md_using_jenkins_to_build_test_and_merge_every_pr). This ensures
that __all tests pass for every pull requests before being merged__. This
makes identifiying the root cause of tests failures easier since, at any given
time, all tests pass on all branches.

The rest of the guidelines are optional. Following these optional recommended
guidelines will help all contributors to work more efficiently. However, not
following them will not prevent valuable contributions from being acknowledged
and integrated.

## Ideal life cycle of issues and pull-requests

This section presents what we consider to be the ideal workflow for issues and
pull-requests. These guidelines are not hard, strict rules that need to be
followed exactly as they are outlined.

### Ideal life cycle of a GitHub issue

1. A new issue is filed against the joyent/node issues tracker.

2. This issue is picked up by a contributor. She assigns the issue to herself if
she's a collaborator, or leaves it unassigned.

3. When a full assessment is done, a comment is added to the issue that describes
its impact on the project. The `S-confirmed-bug` label is added to the issue
if it describes an actual  bug.

4. The issue can be added [in a milestone](#index_md_adding_issues_and_pull_requests_to_a_milestone),
left without a milestone or closed.

5. If the issue was added to a milestone, at some point in time, a contributor
starts implementing the code that fixes the issue. Any contributor is strongly
encouraged to pick issues  that belong to a given milestone. See [how to pick
an issue to fix](#index_md_picking_issues_to_fix) for more details on how to pick
an issue that has the greater impact on the project now.  A collaborator
assigns the issue to herself if she's fixing the issue or to coordinate the
work done by an external contributor to fix it.

6. When the pull-request that fixes the issue has landed in the repository, the
issue is closed.

### Ideal life cycle of a GitHub pull-request

There are two types of pull-requests:
* Pull-requests that fix a specific issue, or a specific set of issues.
* Spontaneous pull-requests that are not linked to any issue.

The workflows for these two types of pull-requests are slightly different.
Even if they have a lot of similarities, they are described separately for the
sake of clarity.

#### Pull-requests that fix (an) exiting issue(s)

1. A contributor can pick any issue to work on based on these [guidelines](#index_md_how_
to_pick_an_issue_to_fix), or can create a new one that describes the problem
that this pull request fixes, or the functionality that it implements.

2. When the fix for the corresponding issue(s) is ready, she submits a pull-
request. The issue number must be mentioned in the commit message.

3. A core team member performs a thorough code review.

4. If the code review does not pass, the author needs to make changes according
to the code review. When changes are made, we're back to step 3.

6. If the code review passes, the pull-request is added to the same milestone as
the issue it fixes.

7. The changes are merged into the repository by [using the appropriate Jenkins
job that runs all tests](#index_md_using_jenkins_to_build_test_and_merge_every_pr).

8. If some tests fail, we're back to step 3.

#### Spontaneous pull-requests not tied to any issue

1. A contributor decides to make a spontaneous code contribution that is not tied
to any issue and submits a pull-request.

2. At some point, a collaborator [adds the pull-request to a given milestone
](#index_md_adding_issues_and_pull_requests_to_a_milestone).

3. A core team member performs a thorough code review.

4. If the code review does not pass, the author needs to make changes according
to the code review. When changes are made, we're back to step 3.

5. If the code review passes and if the pull-request is [added in a milestone
](#index_md_adding_issues_and_pull_requests_to_a_milestone), the changes can be merged
into the repository by [using the appropriate Jenkins job that runs all tests
](#index_md_using_jenkins_to_build_test_and_merge_every_pr).

6. If some tests fail, someone needs to fix them and, when it's done, we're back
to step 3.

## How to pick what to work on next?

### Picking issues to triage

When looking for issues to triage, one should look first for _unassigned_
issues that do not belong to a milestone.

If someone is assigned to this issue but hasn't updated it in a while, please
mention the assignee and @joyent/node-coreteam and ask an update on the
investigation process.

### Picking issues to fix

When looking for issues to fix, one should look first for _unassigned_ issues
that belong to the [next stable or development milestone](#index_md_systematic_usage_
of_milestones) and that have the `S-confirmed-bug` label set. [Higher
priority](#index_md_priority) issues should be fixed first.

If someone is assigned to this issue but hasn't updated it in a while, please
mention the assignee and @joyent/node-coreteam and ask an update on the fixing
process.

### Picking pull-requests to review

When looking for pull-requests to review, one should primarily look for pull-
requests within [the next milestones](#index_md_systematic_usage_of_milestones).
[Higher priority](#index_md_priority) pull-requests should be reviewed first.

## Workflow tools

### Systematic usage of milestones

The goal of using milestones is to make sure that the team is focused on what
matters for the project today. It is the cornerstone of this workflow, and the
only tool that must absolutely be used by every contributor.

Combined with the [priority label](#index_md_priority) and the [assignee property
](#index_md_assigning_issues), anyone can determine the most important issue to work on
today by showing issues that match the following criteria:

* They belong to the next stable or development milestone.
* They have the the highest priority level within this milestone.
* They are not assigned.

Also, when choosing their next issue to fix, contributors should only pick
issues that belong to a milestone. However, anyone is encouraged to _assess_,
or triage (reproduce, evaluate priority) any issue, not only those that belong
to a milestone. See the guidelines on [how to pick what to work on next](#index_md_how_
to_pick_what_to_work_on_next) for more information.

For instance, when the team is focused on fixing bugs that are found in the
v0.12.0 release. These bug fixes will be shipped in the v0.12.1 release. For
this reason, most contributors should spend most of their time going through
issues that belong to [the 0.12.1
milestone](https://github.com/joyent/node/milestones/0.12.1) and that match
the criterias mentioned above.

### Available milestones

At any given point in time, there are at least three milestones available:
* The current stable version milestone.
* The current maintenance version milestone.
* The current development version milestone.

At the time of writing, these corresponds respectively to the milestones
0.12.1, 0.10.37 and 0.13.1.

__No pull-request can be merged into the repository without being added in the
corresponding milestone first__

#### Adding issues and pull-requests to a milestone

After an issue has been assessed properly, if it doesn't belong to a milestone
but should, it is added to that milestone by a collaborator before any work is
done to fix it.

##### Non core team members

Non core members can nominate an issue or a pull request for a milestone if
they want. To nominate an issue, add a comment of the following form:
```
@joyent/node-coreteam nominate:milestone-name
```
where `milestone-name` is a name of a milestone that can be found in [the list
of milestones](https://github.com/joyent/node/milestones).

For instance, `nominate:0.12.1` would nominate an issue or pull-request for
the 0.12.1 milestone. The associated changes would eventually be available in
node.js' v0.12.1 release if the nomination is accepted by the core team.

After the `@joyent/node-coreteam nominate:` line, please provide a clear and
concise explanation for why this issue/pull-request should be accepted in that
milestone. This will be used by the core team when deciding whether or not to
add this issue into the target milestone.

##### Core team members

For a core team member to add an issue/pull-request to a milestone, simply add
it to the desired milestone. Add a comment that provides a clear and concise
explanation for why this issue/pull request should be accepted in that
milestone and __mention @joyent/node-coreteam__. That allows anyone from the
core team who disagrees with adding this issue/pull request into that
milestone to express their opinion and suggest another option.

#### Moving issues/pull requests when a milestone is closed

Sometime, milestones will be closed with some less priority issues/pull
requests still open. These issues/pull requests will be moved to the next
corresponding maintenance/stable/development milestone.

For instance, an open issue that belongs to the 0.12.1 milestone when this
milestone is closed will be automatically added to the 0.12.2 milestone.

## Assigning issues

On GitHub, issues can only be assigned to collaborators. Only a minority of
users and contributors have the collaborator status in the GitHub project.
Currently, collaborators are [the members of the core
team](https://nodejs.org/about/core-team/).

Issues and pull requests should be assigned to collaborators in charge of
moving them forward. If an issue or a pull request has been created by an
external contributor, it should be assigned to a collaborator who will
coordinate the work that needs to be done to eventually close it.

Issues should be assigned to collaborators as soon as they start working (or
coordinating work) on it, and should be unassigned as soon as they stop
working (or coordinating work) on it. The goal is to make it easier for core
team members to pickup new issues to work on or coordinate.

One issue can be assigned to one or more collaborators throughout its
lifetime.

One collaborator can be assigned more than one issue. Issues should be spread
evenly accross collaborators as much as possible.

## Usage of labels

### Priority

The priority label is used to make sure that the team and all contributors are
focused on what is important for the project today. In addition to a more
systematic usage of milestones, this should make it much easier for anyone to
identify what is the most priority issue to work on next.

#### Values

`P-0`, `P-1`, `P-2`, and `P-3`, all exclusives. For a given
[milestone](#index_md_systematic_usage_of_milestones), all P-0, P-1 and P-2 issues should
be fixed before closing it and releasing a new version of Node.js.

`P-0` is used to label an issue that breaks node on at least one supported
platform for a majority of users. It needs to be taken care of as soon as
possible. An example of such an issue if for instance
https://github.com/joyent/node/issues/8897. Basically, core team members need
to make sure that at least one person is focused on any `P-0` issue at any
given time.

`P-1` is a an issue that represents a significant regression but that doesn't
break a majority of users on any supported platform. Anything that could block
other contributors should also be labeled `P-1`, as it needs to be done as
soon as possible to allow them to resume their normal workflow. V8 or libuv
upgrades are good examples of such issues.

`P-2` is an issue that represents a minor regression or a significant regression
that impacts only a small minority of users.

`P-3` is a nice to have.

### Status

The status label is used to identify in which step of the workflow an issue or
pull-request is. Some status apply only to issues, some apply only to pull-
requests and finally some apply to both.

#### Issues status

* `S-confirmed-bug`.
* `S-need-more-info`.
* `S-maybe-close`.

#### Pull-requests status

* `S-maybe-close`.

### Using Jenkins to build, test and merge every PR

A significant amount of time is spent by core team members testing and
troubleshooting tests failing on platforms that are less popular among
contributors, such as Windows and SmartOS.

Thus, before being landed, changes need to be tested on all supported
platforms by using [the node-accept-pull-request Jenkins
job](http://jenkins.nodejs.org/job/node-accept-pull-request/).

Starting [the node-accept-pull-request Jenkins
job](http://jenkins.nodejs.org/job/node-accept-pull-request/) currently
requires to have an account on [the Node.js' Jenkins
platform](http://jenkins.nodejs.org). This is currently restricted to Node.js'
core team members. The process is also manual, but the team is working on
automating as much of this process as possible.

The reponsibility of triggering the tests and potentially merging changes is
on the core team member who determines that a pull request is ready to be
merged. A pull request is ready to be merged when [it has been added into the
current maintenance/development/stable milestone](#index_md_systematic_usage_of_
milestones) and at least one core team member approved the changes during a
code review.

To start testing any pull-request, simply follow the following step:

1. Point your browser to [the node-accept-pull-request Jenkins
job](http://jenkins.nodejs.org/job/node-accept-pull-request/).

2. On the left hand side, you should see "Build with parameters". If not, it
probably means that you're not logged in. You need to be logged in to start
this job.

3. Click on "Build with parameters" and enter the pull-request number in the
`PR_ID` text field. In the `TARGET_BRANCH` text field, enter the name of the
branch into which the changes in the pull-request would eventually be merged.
For instance, enter `v0.12` for a PR that targets the v0.12 branch. In the
`REVIEWED_BY` field, enter the name and email address of the reviewer like
following: `Full Name <email address>`.

4. Click on the "Build" button.

A new job number with a progress bar running should appear in the bottom left
of the page, in the "build history" section. A colored ball appears on the
left of the new job with the following possible colors:

* Blue for all tests passing.
* Yellow for all tests passing but flaky tests failing.
* Red for at least one non-flaky test failing.

If the color is blue or yellow, the changes will be merged in the branch
`TARGET_BRANCH`.

If a pull-request fails to pass all tests on all platforms, its associated
changes cannot be merged into the repository. Always make sure to notify the
author of the pull-request of tests results, and if they failed, always
provide links to the results of the Jenkins job that illustrate the failures.
