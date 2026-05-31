# Generates backdated commit history for teamhub-be (Aug 1 - Oct 30, 2025, UTC).
$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")

$repoRoot = (Get-Location).Path
$markerPath = Join-Path $repoRoot ".git-history-marker"

$functionalities = @(
    "API routing and endpoint handlers",
    "user authentication and permissions",
    "finance models and transaction flow",
    "reporting serializers and filters",
    "notification delivery and read state",
    "Django admin configuration",
    "database migrations and schema updates",
    "search filters and queryset logic",
    "dashboard metrics aggregation",
    "logging and audit trail views",
    "download export utilities",
    "team manager role workflows",
    "developer finance reporting",
    "shared serializers and validation",
    "project settings and middleware"
)

$files = Get-ChildItem -Path $repoRoot -Recurse -File |
    Where-Object { $_.FullName -notmatch '\\\.git\\' -and $_.Name -ne '.git-history-marker' } |
    ForEach-Object {
        $_.FullName.Substring($repoRoot.Length).TrimStart('\').Replace('\', '/')
    }

if ($files.Count -eq 0) { throw "No files found for commit messages." }

function Get-CommitMessage([int]$index) {
    $file = $files[$index % $files.Count]
    $name = Split-Path $file -Leaf
    $func = $functionalities[$index % $functionalities.Count]
    return "feat: $name and $func"
}

function Get-MonthFirstUtc([DateTime]$day) {
    return [DateTime]::SpecifyKind(
        [DateTime]::new($day.Year, $day.Month, 1, 0, 0, 0),
        [DateTimeKind]::Utc
    )
}

function Build-Schedule {
    $rng = [System.Random]::new(20250801)
    $start = [DateTime]::new(2025, 8, 1, 0, 0, 0, [DateTimeKind]::Utc)
    $end = [DateTime]::new(2025, 10, 30, 0, 0, 0, [DateTimeKind]::Utc)
    $events = [System.Collections.Generic.List[DateTime]]::new()
    $d = $start
    $skippedStreak = 0

    while ($d -le $end) {
        $skipDay = $false
        if ($skippedStreak -lt 3 -and $rng.NextDouble() -lt 0.10) {
            $skipDay = $true
            $skippedStreak++
        }
        else {
            $burst = $skippedStreak -ge 4 -or ($rng.NextDouble() -lt 0.14 -and $d.DayOfWeek -eq 'Monday')
            $count = 2
            if ($rng.NextDouble() -lt 0.18) { $count = 3 }
            elseif ($rng.NextDouble() -lt 0.07) { $count = 1 }
            if ($burst) { $count = $rng.Next(4, 7) }

            $monthFirst = Get-MonthFirstUtc $d

            for ($i = 0; $i -lt $count; $i++) {
                $hour = 8 + $rng.Next(0, 13)
                $minute = $rng.Next(0, 60)
                $second = $rng.Next(0, 60)
                $ts = $monthFirst.AddDays($d.Day - 1).AddHours($hour).AddMinutes($minute).AddSeconds($second)
                if ($ts.Month -ne $d.Month) {
                    $ts = [DateTime]::SpecifyKind(
                        [DateTime]::new($d.Year, $d.Month, $d.Day, $hour, $minute, $second),
                        [DateTimeKind]::Utc
                    )
                }
                else {
                    $ts = [DateTime]::SpecifyKind($ts, [DateTimeKind]::Utc)
                }
                [void]$events.Add($ts)
            }

            $skippedStreak = 0
        }

        $d = $d.AddDays(1)
    }

    return $events | Sort-Object
}

$schedule = @(Build-Schedule)
Write-Host "Planned commits: $($schedule.Count)"

if (-not (Test-Path $markerPath)) {
    Set-Content -Path $markerPath -Value "# commit history marker`n" -Encoding utf8
}

$i = 0
foreach ($ts in $schedule) {
    $i++
    Add-Content -Path $markerPath -Value ("entry {0} @ {1} UTC" -f $i, $ts.ToString("yyyy-MM-dd HH:mm:ss")) -Encoding utf8

    git add .
    $msg = Get-CommitMessage $i
    $dateStr = $ts.ToString("yyyy-MM-dd HH:mm:ss") + " +0000"
    $env:GIT_AUTHOR_DATE = $dateStr
    $env:GIT_COMMITTER_DATE = $dateStr

    git commit -m $msg 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        git commit -m $msg --allow-empty 2>&1 | Out-Null
    }

    if ($i % 25 -eq 0) { Write-Host "  $i / $($schedule.Count) commits done" }
}

Remove-Item Env:GIT_AUTHOR_DATE -ErrorAction SilentlyContinue
Remove-Item Env:GIT_COMMITTER_DATE -ErrorAction SilentlyContinue

Write-Host "Finished. Total commits: $(git rev-list --count HEAD)"
