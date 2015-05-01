# Accepting modifications through a consensus seeking process

A "Contribution" to the Project is any work that is voluntarily submitted to
the project. These include not only source code in the form of bug fixes, code
improvements, new functions, etc, but contributions to documentation, design
etc that are intended for the overall improvement of the project.

Contributions to the Project are made on a collaborative basis. Any individual
with a GitHub account may propose a Contribution by submitting a Pull Request
(PR). Acceptance of Contributions (a.k.a. "landing a Pull Request") into the
Project follows a Consensus Seeking decision making model.

## Review process

All Pull Requests submitted by individuals who are not Collaborators must be
signed-off on by an existing Collaborator before the PR can be landed. The
sponsoring Collaborator becomes responsible for the PR. Pull Requests from an
existing Collaborator must be signed-off on by at least one other
Collaborator.

Before any Pull Request is landed, sufficient time should be given to receive
input from other Collaborators with sufficient expertise to evaluate the
changes. Specifically, at least 48 hours during the typical working week and
72 hours over weekends should be given to account for international time
differences and work schedules. Trivial Pull Requests may be landed after a
shorter delay.

If it becomes apparent that the changes proposed by a given Pull Request: (a)
have significant impact on the project as a whole; (b) are inherently
controversial; or (c) have failed to reach consensus amongst Collaborators,
the Pull Request can be elevated for review by the TSC (by attaching the `tsc-
agenda` tag to the PR). Pull Requests that have been flagged for TSC review
must not be landed until the TSC has had sufficient opportunity to review the
issue and render a decision.

## Backward incompatible changes

Pull Requests that contain backward incompatible changes must be elevated for
review by the TSC. This does not necessarily mean that the PR must be put onto
the TSC meeting agenda. If enough TSC members sign-off on the PR and there is
clear consensus among TSC members for the change, the Pull Request can be
landed. Where there is disagreement among TSC members, backward incompatible
Pull Requests should be put on the TSC meeting agenda.

Specific collaborators can be requested to review any PR by using an @-mention
either within the PR text itself or the associated comment stream.

Collaborators sign-off on a Pull Request by explicitly stating their approval
in the PR text or associated comment stream. They explicitly state their
approval by writing "LGTM" in a comment, which means "Looks Good To Me". If a
Collaborator is unsure about the modification or is not prepared to take full
responsibility for the change, they should defer to another Collaborator.

## Security issues

Exception to this process is allowed for high-priority changes that address
security vulnerabilities. A shorter review period and modified sign-off
process may be necessary depending on the nature of the change and severity of
the issue. For these changes, the project follows the process described in [the
security section](/about/security/).

## Tests

All Pull Requests that either fix bugs or introduce new functionality require
at least one test case demonstrating the defect or validating the intended
functionality. For bug fixes, the test should fail before the change, and pass
after the change. In exceptional cases, such as environments or failure modes
that are difficult to reproduce, a detailed description of how to verify the
fix may be accepted in lieu of a specific test.

## Benchmarks

Pull Requests for changes intended to improve performance require a benchmark
demonstrating the performance impact. The benchmark should demonstrate
improved performance after the change is applied.
