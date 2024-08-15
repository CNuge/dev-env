





# Using the custom channel - readme copy

This repository serves as a staging ground for building packages and then pushing them to `s3://package-mirror-sbi-shared`.

## Usage

#### 1.  Make an environment for building packages

    mamba create -n build_pkg conda-build conda-verify git boa
    mamba activate build_pkg

#### 2.  Clone this repository

    git clone https://github.com/SequenceBio/seqbio-pkgs.git
    cd seqbio-pkgs
    git checkout -b new_branch

#### 3.  Get the version-tagged tarball for the repo you're building into a package

Because we're using private repos, we can't provide github URLs in the `meta.yaml`.  Instead,
we can get a local copy of the tagged tarball.  You can do this programmatically from within
your cluster (or wherever else) on the command line.  For `seqbiopy`, please run the following:

    cd recipes/seqbiopy
    bash get_repo_tarball.sh

When prompted, enter your github personal access token (this will not be saved to your command history) and
the version number for the tarball.

#### 4.  Create a package recipe

If you've not written a `conda` package recipe before, that's beyond the scope of this document.
But there are lots of [tutorials](https://docs.conda.io/projects/conda-build/en/latest/concepts/recipe.html)
online, and you can also see examples from existing packages
by downloading some of the `conda-builds/linux-64/*.tar.bz2` files, extracting them, and inspecting
the files `info/meta.yaml` and `info/build.sh`.

When you've created your recipe, put it in its own directory for convenience.

#### 5.  Build the package

    cd recipes/<your_package>
    conda mambabuild --croot=../../seqbio-pkgs .

Note that you may run out of memory building on a t3.medium.  Assuming you're on a cluster, you can put the above command in a shell script and submit it to a queue with more memory.

#### 6.  Inspect build output

These things often don't work on the first try - you can look at intermediates of failed builds in `seqbio-pkgs/seqbio-pkgs/<your_package>_2837492387bunchofnumbers`.

If it built successfully, go ahead and remove those build intermediates.

#### 7.  Reindex the branch

    bash reindex_repo.sh

#### 8. Test with a local install

Before committing and pushing, please test that the package installs successfully locally by doing the following:
- Deactivate your build environment
- Create a new environment and pull in your new package, e.g.:

```
 mamba create -n <your_package>_test -c /absolute/path/to/seqbio-pkgs/seqbio-pkgs <your_package>
```

#### 9.  Add and commit your changes and write a PR to `main`

Note that merge conflict resolution is incredibly complicated with an indexed channel, so please be stringent in this repo about creating a new branch and then merging it in before creating another branch.

- add the newly indexed channel to the git commit
```
git add seqbio-pkgs/
```
- submit a PR to main, upon merger the GitHub Actions for the repository will sync the channel to the s3 `package-mirror-sbi-shared` bucket.

## Most recent software versions in seqbio-pkgs
- seqbiopy: 0.2.5

## Acknowledgments

Thanks to @lightning-auriga for the [basis](https://github.com/lightning-auriga/conda-builds) of this repository!