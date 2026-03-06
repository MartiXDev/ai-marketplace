<#
.SYNOPSIS
Batch installs Copilot plugins from this marketplace.

.DESCRIPTION
Installs all plugins from marketplace metadata or only selected plugins.
Plugin names are loaded from .github\plugin\marketplace.json (preferred)
or marketplace\catalog.yaml.
Plugin source directories may be rooted under src\plugins as configured
in marketplace metadata.

.PARAMETER Plugins
One or more plugin names to install. Supports comma-separated input.
Alias: PluginList

.PARAMETER All
Installs all plugins discovered in marketplace metadata.

.PARAMETER MarketplaceName
Overrides marketplace name from metadata.

.PARAMETER DryRun
Shows what would be installed without running `copilot plugin install`.

.OUTPUTS
PSCustomObject containing selected, installed, skipped, and failed plugin names.

.NOTES
Supports -WhatIf/-Confirm via ShouldProcess for non-dry-run installs.

.EXAMPLE
.\scripts\install-plugins.ps1 -All

.EXAMPLE
.\scripts\install-plugins.ps1 -PluginList "martix-dotnet-library,martix-other-plugin"

.EXAMPLE
.\scripts\install-plugins.ps1 -Plugins martix-dotnet-library -DryRun
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [Parameter(ParameterSetName = 'ByPlugins')]
    [Alias('PluginList')]
    [string[]]$Plugins,

    [Parameter(Mandatory = $true, ParameterSetName = 'All')]
    [switch]$All,

    [Parameter()]
    [string]$MarketplaceName,

    [Parameter()]
    [switch]$DryRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-PluginMetadata {
    param(
        [Parameter(Mandatory = $true)]
        [string]$RepoRoot
    )

    $manifestPath = Join-Path -Path $RepoRoot -ChildPath ".github\plugin\marketplace.json"
    if (Test-Path -Path $manifestPath) {
        $manifest = Get-Content -Path $manifestPath -Raw | ConvertFrom-Json
        $pluginNames = @(
            $manifest.plugins |
                ForEach-Object { [string]$_.name } |
                Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
                Sort-Object -Unique
        )
        return @{
            Source = $manifestPath
            Marketplace = [string]$manifest.name
            Plugins = $pluginNames
        }
    }

    $catalogPath = Join-Path -Path $RepoRoot -ChildPath "marketplace\catalog.yaml"
    if (Test-Path -Path $catalogPath) {
        $pluginNames = @(
            Get-Content -Path $catalogPath |
                ForEach-Object {
                    if ($_ -match '^\s*-\s*name:\s*["'']?([^"''#\s]+)["'']?\s*(?:#.*)?$') {
                        $Matches[1]
                    }
                } |
                Sort-Object -Unique
        )
        return @{
            Source = $catalogPath
            Marketplace = ""
            Plugins = $pluginNames
        }
    }

    throw "No metadata source found. Expected '$manifestPath' or '$catalogPath'."
}

$repoRoot = Split-Path -Path $PSScriptRoot -Parent
$metadata = Get-PluginMetadata -RepoRoot $repoRoot

$availablePlugins = @($metadata.Plugins)
if ($availablePlugins.Count -eq 0) {
    throw "No plugin names found in metadata source '$($metadata.Source)'."
}

if ([string]::IsNullOrWhiteSpace($MarketplaceName)) {
    $MarketplaceName = [string]$metadata.Marketplace
}
if ([string]::IsNullOrWhiteSpace($MarketplaceName)) {
    throw "Marketplace name not found in metadata. Provide -MarketplaceName."
}

$requestedPlugins = @()
if ($PSBoundParameters.ContainsKey('Plugins')) {
    $requestedPlugins += @(
        $Plugins |
            ForEach-Object { $_ -split ',' }
    )
}

$requestedPlugins = @(
    $requestedPlugins |
        ForEach-Object { $_.Trim() } |
        Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
        Sort-Object -Unique
)

$targetPlugins = @()
if ($All) {
    $targetPlugins = @($availablePlugins)
}
else {
    $targetPlugins = @($requestedPlugins)
}

if (@($targetPlugins).Count -eq 0) {
    throw "No plugins selected. Use -All, -Plugins, or -PluginList."
}

$unknownPlugins = @(@($targetPlugins) | Where-Object { $_ -notin $availablePlugins })
if ($unknownPlugins.Count -gt 0) {
    $available = $availablePlugins -join ", "
    $unknown = $unknownPlugins -join ", "
    throw "Unknown plugin(s): $unknown. Available plugins: $available."
}

Write-Verbose "Metadata source: $($metadata.Source)"
Write-Verbose "Marketplace: $MarketplaceName"
Write-Verbose "Selected plugins: $($targetPlugins -join ', ')"

if (-not $DryRun -and -not (Get-Command -Name 'copilot' -ErrorAction SilentlyContinue)) {
    throw "Copilot CLI not found. Install it or run with -DryRun."
}

$failedPlugins = @()
$installedPlugins = @()
$skippedPlugins = @()

foreach ($pluginName in @($targetPlugins)) {
    $installTarget = "$pluginName@$MarketplaceName"

    if ($DryRun) {
        $skippedPlugins += $pluginName
        Write-Verbose "DRY RUN: copilot plugin install $installTarget"
        continue
    }

    if (-not $PSCmdlet.ShouldProcess($installTarget, 'Install Copilot plugin')) {
        $skippedPlugins += $pluginName
        continue
    }

    Write-Verbose "Installing '$installTarget'..."
    & copilot plugin install $installTarget

    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Install failed for '$installTarget'."
        $failedPlugins += $pluginName
        continue
    }

    $installedPlugins += $pluginName
}

if ($failedPlugins.Count -gt 0) {
    throw "Failed installs: $($failedPlugins -join ', ')."
}

$result = [PSCustomObject]@{
    MetadataSource  = $metadata.Source
    Marketplace     = $MarketplaceName
    SelectedPlugins = @($targetPlugins)
    Installed       = @($installedPlugins)
    Skipped         = @($skippedPlugins)
    Failed          = @($failedPlugins)
    DryRun          = [bool]$DryRun
}

Write-Output $result
