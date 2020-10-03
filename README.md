# renovate-config

## Usage

```json
{
  "extends": ["github>ahuglajbclajep/renovate-config"]
}
```

If you have enabled [branch protection](https://docs.github.com/en/free-pro-team@latest/github/administering-a-repository/enabling-required-reviews-for-pull-requests) to prevent direct `push` to the `master` branch, add the following settings and also introduce [renovate-approve bot](https://github.com/apps/renovate-approve).

```diff
{
  "extends": ["github>ahuglajbclajep/renovate-config"],
+ "packageRules": [
+   {
+     "groupName": "patches",
+     "updateTypes": ["patch"],
+     "schedule": ["before 8am on monday"]
+   }
+ ]
}
```

See also:

- <https://github.com/renovatebot/config-help/issues/748>
- <https://docs.github.com/en/free-pro-team@latest/github/administering-a-repository/enabling-branch-restrictions>

## Presets

### `github>ahuglajbclajep/renovate-config`

```json
{
  "extends": [
    "github>ahuglajbclajep/renovate-config:base",
    "github>ahuglajbclajep/renovate-config:wait",
    "github>ahuglajbclajep/renovate-config:groupMinorDependencies",
    "github>ahuglajbclajep/renovate-config:groupMinorDevDependencies",
    ":timezone(Asia/Tokyo)"
  ],
  "minor": {
    "schedule": ["before 8am on monday"]
  }
}
```

### `github>ahuglajbclajep/renovate-config:base`

```json
{
  "extends": [
    "config:base",
    ":automergePatch",
    ":automergeBranch",
    ":maintainLockFilesMonthly",
    ":label(renovate)"
  ],
  "npm": {
    "rangeStrategy": "bump"
  }
}
```

See also:

- <https://docs.renovatebot.com/presets-config/#configbase>
- <https://docs.renovatebot.com/configuration-options/#automergetype>
- <https://docs.renovatebot.com/configuration-options/#lockfilemaintenance>
- <https://docs.renovatebot.com/configuration-options/#rangestrategy>

### `github>ahuglajbclajep/renovate-config:wait`

```json
{
  "extends": [":prNotPending", ":dependencyDashboard"],
  "prNotPendingHours": 72,
  "major": {
    "stabilityDays": 4
  },
  "minor": {
    "stabilityDays": 2
  },
  "patch": {
    "stabilityDays": 2
  }
}
```

See also:

- <https://docs.renovatebot.com/configuration-options/#prcreation>
- <https://docs.renovatebot.com/configuration-options/#prnotpendinghours>
- <https://docs.renovatebot.com/configuration-options/#stabilitydays>

### `github>ahuglajbclajep/renovate-config:groupMinorDependencies`

```json
{
  "packageRules": [
    {
      "groupName": "dependencies",
      "depTypeList": ["dependencies"],
      "updateTypes": ["minor"]
    }
  ]
}
```

### `github>ahuglajbclajep/renovate-config:groupMinorDevDependencies`

```json
{
  "packageRules": [
    {
      "groupName": "dev dependencies",
      "depTypeList": ["devDependencies"],
      "updateTypes": ["minor"]
    }
  ]
}
```
