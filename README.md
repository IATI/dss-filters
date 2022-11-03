# Datastore Search Filter Configuration

This repo is used to generate and store the [Datastore Search](https://github.com/IATI/datastore-search) Advanced filtering configuration files. They are used by the Front End to provide all the filtering options.

## Updating Filters

Running `dispatch-CI.yaml` will:

- Update `IATI-Standard-SSOT` submodules
- Run the filter generation shell script `./genFilters.sh`
- Make a PR of any changes and add @IATI/devs as a reviewer

Next steps:

- Review/merge PR
- Test in Development environment of [Datastore Search](https://github.com/IATI/datastore-search)
- PR changes to `main`
- Merge to `main`

## Manually Updating Filter Files

Note: Only use this if `dispatch-CI.yaml` is not working.

- `git clone <url> --recurse-submodules`
    - Make sure you pull in the IATI-Standard-SSOT submodule
- `git checkout develop`
- `git pull`
- If there has been a codelist update (excluding Non-Embedded codelists, these will update without a new submodule commit), then make sure to update the submodule to point to the new commit of IATI-Standard-SSOT that contains that codelist update
    - E.g. 
```
cd IATI-Standard-SSOT
git checkout version-2.03
git pull
cd ../
git add IATI-Standard-SSOT
git commit -m "update submodule"
```
- Run the filter generation shell script `./genFilters.sh`
- Commit updates to `codelists.json` and/or `filters.json`
- Push to GitHub `git push origin develop`
- Test in Development environment
- PR to `main`
- Merge to `main`

## How are they used?

[Datastore Search](https://github.com/IATI/datastore-search) requests these files through the APIM instance. The APIM instance is configured with routes to request these directly from 

- `https://raw.githubusercontent.com/IATI/dss-filters/<branch>/codelists.json`
- `https://raw.githubusercontent.com/IATI/dss-filters/<branch>/filters.json`

This allows for the integrated caching in APIM to be utilised.
