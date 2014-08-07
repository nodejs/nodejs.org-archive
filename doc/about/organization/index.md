# Organization

## Becoming a team member

[Team members](/about/organization/) are selected based on their contributions to
the GitHub project and their domain expertise for a given subsystem.

The subsystems eligible for maintainence in Node.js are the following:

 * A subsystem for every core module exported
    * Essentially every JavaScript file found in `lib/` of the repository, and
      if applicable its corresponding `src/` companion
 * The build system
 * The test harness
 * libuv
 * http-parser
 * Our interface to V8

A team member may be responsible for multiple of these subsystems, and
subsystems may be maintained by multiple team members.

Team members are added by the existing team after identifying an interested
candidate. Candidates are active members of the community, with consistent high
quality contributions. They have excellent communication skills, they are
excited to work on Node.js, and interested in the quality and future of
Node.js.

## Responsibilities

### Integrating Changes

All changes should follow the [contribution
guidelines](/documentation/contributing/) for pull requests. Simple and straight
forward bug fixes that are obvious to the subsystem maintainer or other core
team members may be committed without review.  All other changes require review
by at least one team member before being pushed to the public repository,
ideally by the subsystem maintainer.

Non-controversial changes only need one team member to review before pushing to
the public repository. Complicated changes need review by at least one of the
subsystems maintainers. Controversial changes or breaking API changes should
first be discussed with the wider team and other stake holders.

Exercise common sense when integrating changes. It's expected that integrated
changes will have broad consensus. Presuming the change was [properly
scoped](#scoping-features) it is rare that a change itself would be
controversial. Work to receive feedback from other subsystem maintainers, and
stake holders in the community before integrating your change.

### Issues

All core team members should be subscribed to the GitHub issues and actively
monitoring the discussions happening in them. We should be aiming to solve
issues and integrate as many useful pull requests as possible in as timely as a
fashion as possible.

Issues are meant to track what is still left to be done, so while there may not
be a team member currently assigned to the task, leaving it open is ok as
someone in the community may come along and decide to help us.

Discussions on issues should be civil and empathetic towards the reporter and
community participating in them. The reporter has taken the time to inform
us of what they believe to be a deficiency in Node.js and even if we may not
always agree, we should still treat each other with respect.

### Participation

The team collaborates in IRC, members should be hanging out and answering
questions from other team members where possible. There are also scheduled
calls where the team collaborates with each other to discuss more complex
issues as well as making sure no one is blocked on anyone else. These calls are
mostly helpful to discuss architecture and the roadmap.

## Releases

The roadmap is scoped by the core team, as informed by you, our users. Releases
happen as often as is necessary and practical, but never before work is
complete. The team has a strong desire to release high quality code for every
release. We know that bugs are unavoidable, but the pressure to release a new
version is always outweighed by releasing software that is as correct as we can
make it. That commitment to quality software is one of our core tenets of the
project.

### Patches

Patch releases are defined as bug, performance, and security fixes. They do not
change or add any public interfaces. They do not change the expected behavior
of a given interface. They are meant to correct behavior when it doesn't match
the documentation, without also introducing a change that makes seamless
upgrades impossible.

### Minors

Minors are the addition and refinements of APIs or subsystems. They do not
generally change APIs or introduce backwards compatible breaking changes,
except where unavoidable. These are mostly completely additive releases.

### Majors

Majors are where we can introduce breaking changes. They are also where we
identify what the API is we will be supporting for the foreseeable future.
Making a move to a new major is a difficult conversation, and requires care
and appropriate scoping.

### Scoping Features

Features and APIs can be added into Node.js when their need is clear, there are
clean, useful, agreeable APIs, and there are known consumers. For instance, it
may be the case that when implementing core functionality for Node.js another
lower level API may be identified that could have utility beyond Node.js
itself. When those APIs are identified, we can chose to expose them.

Take for instance the `EventEmitter`, the need to have an event subscription
model for core modules to consume was clear, and that abstraction clearly had
utility beyond core itself. Not that this interface couldn't be implemented as
external to Node.js, it's just that Node needed the abstraction for itself and
in turn exposed it for others.

Alternatively it may be that many people in the community are all adopting a
pattern to handle common needs that are not currently satisfied by Node, or
they are implementing a feature that should clearly be delivered by default for
all Node.js consumers. It's also possible that many in the community are
adopting a change that requires a compiled asset that can be difficult to
deliver in all environments. At that point, Node.js may decide to incorporate
those changes directly.

Adopting a new API however, is not taken lightly. Node.js has a strong
commitment to backwards compatibility. As such it is necessary to have lots of
input and conversation around the addition of a new API before it's added into
Node. Even when we've identified a suitable API it's also important to have
clearly identified the consumers of the API.

### Deprecation

It may be that we need to deprecate a feature or API of Node. Doing so takes a
lot of time and consideration before marking something as deprecated. We need
to make sure we understand to the best of our ability who is using an API, and
how that API is being used. In the case where an API is overwhelmingly in use
by the community, what is the need for marking the API deprecated? Do we have a
replacement API, is there a transitionary path that we can socialize? How many
iterations of versions do there need to before the API can be completely
removed? Is there a polyfill module that can be consumed from the community in
order to avoid as much pain as possible?

In short its not impossible for APIs to be deprecated, but just like the adding
of APIs, deprecating of an API is not something to be taken lightly.

