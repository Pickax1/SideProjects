# Project Task Tracker Script
# This script allows a user to add and list project tasks

$tasks = @()

function Add-Task {
    param (
        [string]$taskName
    )
    $global:tasks += $taskName
    Write-Host "Task '$taskName' added."
}

function Show-Tasks {
    param (
        [string]$filePath = ".\tasks.txt"
    )
    Write-Host "`nProject Task List:"
    if ($tasks.Count -eq 0) {
        Write-Host "No tasks available."
    } else {
        $tasks | ForEach-Object { Write-Host "- $_" }
        if ($filePath) {
            $tasks | Out-File -FilePath $filePath
            Write-Host "Tasks have been written to $filePath"
        }
    }
}

while ($true) {
    Write-Host "`nChoose an option:"
    Write-Host "1. Add Task"
    Write-Host "2. Show Tasks"
    Write-Host "3. Show Tasks and Save to File"
    Write-Host "4. Exit"
    $choice = Read-Host "Enter choice (1-4)"

    switch ($choice) {
        "1" {
            $taskName = Read-Host "Enter Task Name"
            Add-Task -taskName $taskName
        }
        "2" {
            Show-Tasks
        }
        "3" {
            $filePath = Read-Host "Enter file path to save tasks (default: .\tasks.txt)"
            if (-not $filePath) {
                $filePath = ".\tasks.txt"
            }
            Show-Tasks -filePath $filePath
        }
        "4" {
            Write-Host "Exiting script. Goodbye!"
            return
        }
        default {
            Write-Host "Invalid choice, please select 1, 2, 3, or 4."
        }
    }
}
