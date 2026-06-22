# Docker – Day 04 - Runners: GitHub-Hosted & Self-Hosted

Every job needs a machine to run on. Today I will understand runners — GitHub's hosted ones and how to set up your own self-hosted runner on a real server.


### ✅ Task 1: GitHub-Hosted Runners

**1. Create a workflow with 3 jobs, each on a different OS:**
* ubuntu-latest
* windows-latest
* macos-latest

**2. In each job, print:**
* The OS name
* The runner's hostname
* The current user running the job

```yml
name: GitHub Runners

on:
    workflow_dispatch:

jobs:
    ubuntu:
        runs-on: ubuntu-latest
        steps:
            - name: Print OS Name
              run: echo "OS name is ${{runner.os}}"  
            
            - name: The runner's hostname
              run: echo "Runner name is ${{runner.name}}"

            - name: The current user running the job
              run: echo "Current User is ${{github.actor}}"

    windows:
        runs-on: windows-latest
        steps:
            - name: Print OS Name
              run: echo "OS name is ${{runner.os}}"
            
            - name: The runner's hostname
              run: echo "Runner name is ${{runner.name}}"

            - name: The current user running the job
              run:  echo "Current User is ${{github.actor}}"

    macos:
        runs-on: macos-latest
        steps:
            - name: Print OS Name
              run: echo "OS name is ${{runner.os}}"
            
            - name: The runner's hostname
              run: echo "Runner name is ${{runner.name}}"

            - name: The current user running the job
              run: echo "Current User is ${{github.actor}}"
```




**3. What is a GitHub-hosted runner? Who manages it ?**

A GitHub-hosted runner is a virtual machine provided by GitHub that automatically executes your GitHub Actions workflow jobs. It comes preconfigured with various operating systems (Ubuntu, Windows, macOS) and developer tools, eliminating the need to set up or maintain your own server infrastructure.

GitHub completely manages the underlying infrastructure. 


---

### ✅ Task 2 : Explore What's Pre-installed

**1. On the `ubuntu-latest` runner, run a step that prints:**

* Docker version
* Python version
* Node version
* Git version

```yml
name: GitHub Runners

on:
    workflow_dispatch:

jobs:
    ubuntu:
        runs-on: ubuntu-latest
        steps:
            - name: Print OS Name
              run: echo "OS name is ${{runner.os}}"  
            
            - name: The runner's hostname
              run: echo "Runner name is ${{runner.name}}"

            - name: The current user running the job
              run: echo "Current User is ${{github.actor}}"
            
            - name: Print Version
              run: |
                docker --version
                python --version
                node --version
                git --version
```

**Look up the GitHub docs for the full list of pre-installed software on `ubuntu-latest`**

**Why does it matter that runners come with tools pre-installed ?**

Pre-installed tools matter because they eliminate tedious setup steps, save hours of configuration, and drastically accelerate the software delivery pipeline.

---

### ✅ Task 3 : Set Up a Self-Hosted Runner

**1. Go to your GitHub repo → Settings → Actions → Runners → New self-hosted runner**

**2. Choose Linux as the OS**

**3. Follow the instructions to download and configure the runner on:**
* Your local machine, OR
* A cloud VM (EC2, Utho, or any VPS)

**4. Start the runner — verify it shows as Idle in GitHub**

**Verify: Your runner appears in the Runners list with a green dot.**

---

### ✅ Task 4 : Use Your Self-Hosted Runner

**1. Create `.github/workflows/self-hosted.yml`**

**2. Set runs-on: self-hosted**

**3. Add steps that:**

* Print the hostname of the machine (it should be YOUR machine/VM)
* Print the working directory
* Create a file and verify it exists on your machine after the run

```yml
name: Self Hosted Runner

on:
    workflow_dispatch:

jobs:
    Tasks:
        runs-on: self-hosted
        steps:
            - name: Print the hostname of the machine 
              run: |
                echo "Machine Hostname is:"
                hostname


            - name: Print the working directory
              run:  echo "Working Directory is ${{github.workspace}}"

            - name: Create File
              run: echo "Hello from GitHub Actions" > test-file.txt
```

**4. Trigger it and watch it run on your own hardware**

**Verify: Check your machine — is the file there ?**

Yes!

---

### ✅ Task 5 : Labels

**1. Add a label to your self-hosted runner (e.g., my-linux-runner)**

**2. Update your workflow to use runs-on: [self-hosted, my-linux-runner]**

```yml
name: Self Hosted Runner

on:
    workflow_dispatch:

jobs:
    Tasks:
        runs-on: [self-hosted, my-linux-runner]
        steps:
            - name: Print the hostname of the machine 
              run: |
                echo "Machine Hostname is:"
                hostname


            - name: Print the working directory
              run:  echo "Working Directory is ${{github.workspace}}"

            - name: Create File
              run: echo "Hello from GitHub Actions" > test-file.txt
```

**3. Trigger it — does it still pick up the job ?**

Yes!

**Why are labels useful when you have multiple self-hosted runners ?**

Labels allow you to route workflow jobs to specific self-hosted runners based on hardware, operating systems, or installed software. They ensure heavy builds only run on powerful machines and prevent jobs from executing on incompatible environments

### ✅ Task 6 : GitHub-Hosted vs Self-Hosted

| Category | GitHub-Hosted | Self-Hosted |
|-----------|--------------|-------------|
| Who manages it? | GitHub | You / Your Organization |
| Cost | Free minutes (public repos) and billed minutes for private repos beyond limits | You pay for the machine, VM, cloud instance, electricity, etc. |
| Pre-installed tools | Many tools pre-installed (Git, Docker, Python, Node.js, Java, etc.) | Only the tools you install |
| Good for | Quick setup, CI/CD learning, small-to-medium projects, standard workloads | Custom environments, private networks, special hardware, long-running jobs |
| Security concern | Code runs on GitHub-managed infrastructure | You are responsible for securing and maintaining the runner |

---
