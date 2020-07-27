# renovate-config

## Usage

```json
{
  "extends": ["github>ahuglajbclajep/renovate-config"]
}
```

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
  "extends": [":prNotPending"],
  "prNotPendingHours": 72,
  "dependencyDashboard": true,
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
      "groupName": "dependencies (minor)",
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
      "groupName": "devDependencies (minor)",
      "depTypeList": ["devDependencies"],
      "updateTypes": ["minor"]
    }
  ]
}
```
