# Docker – Day 01 - What is CI/CD?


### ✅ Task 1: The Problem

**Think about a team of 5 developers all pushing code to the same repo manually deploying to production.**

**1. What can go wrong ?**

When 5 developers are working on the same repository and deploying manually, many problems can happen. One developer's code may conflict with another's changes, someone might deploy the wrong version, or important deployment steps could be forgotten. Bugs may reach production if testing is skipped, and if something breaks, it can be difficult to find out what changed or how to roll back. Since humans are doing everything manually, mistakes are more likely to happen.

**2. What does "it works on my machine" mean and why is it a real problem ?**

"It works on my machine" means the application runs correctly on a developer's computer but does not work on another developer's machine or in production. This usually happens because of differences in software versions, dependencies, operating systems, or environment settings. It is a real problem because code that seems fine during development can fail after deployment, causing bugs, delays, and wasted time while the team tries to identify the differences between environments.

**3. How many times a day can a team safely deploy manually ?**

A team can usually deploy manually only a few times per day before the risk of mistakes becomes too high. Every deployment requires someone to follow the correct steps, verify the changes, and ensure nothing was missed. As the number of deployments increases, human errors become more common. This is why teams use CI/CD pipelines, which automate the process and allow deployments to happen many times a day safely and consistently.

---

### ✅ Task 2: CI vs CD

**1. Continuous Integration — what happens, how often, what it catches**

Continuous Integration is the practice of frequently merging code changes into a shared (central) repository, often several times a day. Each change automatically triggers builds and tests to catch bugs, merge conflicts, and integration issues early before they reach production.

**Example**: A developer pushes code to GitHub, and GitHub Actions automatically runs unit tests and checks if the application builds successfully.

**2. Continuous Delivery — how it's different from CI, what "delivery" means**

Continuous Delivery extends CI by automatically preparing and validating code for release after it passes all tests. The application is always in a deployable state, but a human still decides when to deploy it to production.

**Example**: After tests pass, a new version of an e-commerce website is automatically deployed to a staging environment and waits for a manager's approval before going live.

**3. Continuous Deployment — how it differs from Delivery, when teams use it**

Continuous Deployment goes one step further than Continuous Delivery. Once code passes all automated tests and checks, it is automatically deployed to production without any manual approval. This is commonly used by teams with strong automated testing and monitoring.

**Example**: A company like Netflix automatically releases small code changes to production as soon as they pass all quality checks and automated tests.

---

### ✅ Task 3: Pipeline Anatomy

**1. Trigger**

A trigger is the event that starts a CI/CD pipeline. Common triggers include pushing code to a repository, creating a pull request, or scheduling a job to run at a specific time.

**2. Stage**

A stage is a logical phase in the pipeline that groups related jobs together. Common stages include Build, Test, and Deploy. Stages help organize the workflow and usually run in sequence.

**3. Job**

A job is a specific unit of work within a stage. It performs a particular task, such as running tests, building the application, or deploying code. A stage can contain one or more jobs.

**4. Step**

A step is a single command or action inside a job. Steps are executed one after another and can include actions like installing dependencies, running tests, or copying files.

**5. Runner**

A runner is the machine or environment that executes pipeline jobs. It can be a physical server, virtual machine, container, or cloud-hosted system that performs the requested tasks.

**6. Artifact**

An artifact is a file or output produced by a job that can be saved and used later in the pipeline. Examples include compiled applications, test reports, logs, or deployment packages.

---

### ✅ Task 4 : Draw a Pipeline
**Draw a CI/CD pipeline for this scenario:**

**A developer pushes code to GitHub. The app is tested, built into a Docker image, and deployed to a staging server.**

<img width="1536" height="1024" alt="ChatGPT Image Jun 16, 2026, 05_52_50 PM" src="https://github.com/user-attachments/assets/51b906e7-c58f-4061-8ea0-9482b1f76890" />

---

**NOTE :**

CI/CD is a practice, not just a tool

GitHub Actions, Jenkins, GitLab CI, CircleCI — all are tools that implement CI/CD

A pipeline failing is not a problem — it's CI/CD doing its job

