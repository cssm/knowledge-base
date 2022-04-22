# git flow

![](git%20flow/feature.png)

Two main branches **master** and **develop**

**feature, release, hotfix** - after merge they can be deleted

![](git%20flow/Develop.png)

**feature** branches creates from **develop** and merged to **develop**

You can delete **feature** after merge into **develop**

![](git%20flow/Develop%201.png)

**release** branches create from **develop** and merged to **develop** and **master**

Only from **release** branch should be merges to **master**.

**release** can contains only bug fixes, documentation improvements and other release oriented features

After **release** finished all changes should be merged to **develop** back

It’s important to merge back into **develop** because critical updates may have been added to the **release** branch and they need to be accessible to new features. If your organization stresses code review, this would be an ideal place for a pull request.

**release** branches should be marked with version i.e **release-0.1.0**

![](git%20flow/Release.png)

If there are issue in the **master** than **hotfix** is created based on **master** and merged to **master** and **develop** (when a **release** branch currently exists, the **hotfix** changes need to be merged into that **release** branch, instead of **develop**)

(If work in **develop** immediately requires this bugfix and cannot wait for the **release** branch to be finished, you may safely merge the bugfix into **develop** now already as well.)

**hotfix** is used to fix critical bugs in **master**

![](git%20flow/Release%201.png)