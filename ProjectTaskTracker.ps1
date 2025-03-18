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
    Write-Host "`nProject Task List:"
    if ($tasks.Count -eq 0) {
        Write-Host "No tasks available."
    } else {
        $tasks | ForEach-Object { Write-Host "- $_" }
    }
}

while ($true) {
    Write-Host "`nChoose an option:"
    Write-Host "1. Add Task"
    Write-Host "2. Show Tasks"
    Write-Host "3. Exit"
    $choice = Read-Host "Enter choice (1-3)"
    
    switch ($choice) {
        "1" {
            $taskName = Read-Host "Enter Task Name"
            Add-Task -taskName $taskName
        }
        "2" {
            Show-Tasks
        }
        "3" {
            Write-Host "Exiting script. Goodbye!"
            break
        }
        default {
            Write-Host "Invalid choice, please select 1, 2, or 3."
        }
    }
}
