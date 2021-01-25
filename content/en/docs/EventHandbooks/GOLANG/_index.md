---
title: "GOLANG"
linkTitle: "GOLANG"
weight: 40
description: >-
     Docker Workshop for Golang Developers
---




# Downlaod Golang ( latest version Golang 15.7 )

- [Windows](https://golang.org/dl/go1.15.7.windows-amd64.msi)
- [Apple Macos ](https://golang.org/dl/go1.15.7.darwin-amd64.pkg)
- [Linux](https://golang.org/dl/go1.15.7.linux-amd64.tar.gz)
- [github source](https://golang.org/dl/go1.15.7.src.tar.gz)


# Install Golang

Select the tab for your computer's operating system below, then follow its installation instructions.


{{< tabs name="Install Golang" >}}
{{% tab name="Linux" %}}
This is **some markdown.**

- 1. if you have a previous version of Go installed, be sure to [remove it]()https://golang.org/doc/manage-install before installing another.

Download the archive and extract it into `/usr/local`, creating a Go tree in `/usr/local/go`.
For example, run the following as root or through sudo:

```bash
tar -C /usr/local -xzf go1.15.7.linux-amd64.tar.gz

```
- 2. Add `/usr/local/go/bin` to the PATH environment variable.
You can do this by adding the following line to your $HOME/.profile or /etc/profile (for a system-wide installation):

```
export PATH=$PATH:/usr/local/go/bin

```
{{< note >}}
 Changes made to a profile file may not apply until the next time you log into your computer. To apply the changes immediately, just run the shell commands directly or execute them from the profile using a command such as source `$HOME/.profile`.
{{< /note >}}

- 3. Verify that you've installed Go by opening a command prompt and typing the following command:

```bash

$ go version

```
4. Confirm that the command prints the installed version of Go.



{{< tab name="Mac" >}}

1.Open the package file you downloaded and follow the prompts to install Go.

The package installs the Go distribution to /usr/local/go. The package should put the /usr/local/go/bin directory in your PATH environment variable. You may need to restart any open Terminal sessions for the change to take effect.

```bash

$ go version
```
3. Confirm that the command prints the installed version of Go.


{{< tab name="Windows" >}}

- 1. Open the MSI file you downloaded and follow the prompts to install Go.
     By default, the installer will install Go to C:\Go. You can change the location as needed. After installing, you will need to close and reopen any open command prompts so that changes to the environment made by the installer are reflected at the command prompt.
     
- 2. Verify that you've installed Go.

1.In Windows, click the Start menu. <br>
2.In the menu's search box, type cmd, then press the Enter key. <br>
3.In the Command Prompt window that appears, type the following command: <br>

```bash

$ go version

```
- 3. Confirm that the command prints the installed version of Go.
{{% /tab %}}

{{< /tab >}}
{{< /tabs >}}

