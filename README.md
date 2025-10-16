# addBulkContactsToDistGroup.ps1

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue?logo=powershell&logoColor=white)](https://learn.microsoft.com/en-us/powershell/)

This PowerShell script automates the process of adding multiple external mail contacts to a Microsoft Exchange or Microsoft 365 distribution group using data from an Excel file.

---

## Overview

The script reads a list of contacts from an Excel spreadsheet (`contacts.xlsx`) and adds them to a specified distribution group.  
It verifies whether each contact exists in the directory before attempting to add them, and logs warnings if contacts cannot be found.

---

## Prerequisites

Before running the script, ensure you have:

- **PowerShell 5.1+** or **PowerShell Core**  
- The **Exchange Online PowerShell module** or **on-prem Exchange Management Shell**
- The **ImportExcel** PowerShell module  
  ```powershell
  Install-Module ImportExcel
- Access permissions to modify the target distribution group

---

## Excel File Format

The Excel file (users.xlsx) should be structured with at least one column named Email:


        |A|
    |1|Email
    |2|user1@example.com
    |3|user2@example.com
    |4|user3@example.com
You can store this file anywhere, but be sure to update the file path in the script accordingly.

---

## Script Parameters

The script currently defines:
```powershell
$users = Import-Excel -Path "D:\Users\george.surridge\Downloads\contacts.xlsx"
$group = "distgroup@example.com"
```
- `$users` — The path to your Excel file containing contact email addresses.
- `$group` — The email address of the distribution group you want to add users to.

    Modify these values before running the script.

---

## Usage

Connect to Exchange Online:
```powershell
Connect-ExchangeOnline -UserPrincipalName your.admin@domain.com
```
Run the script:
```powersehll
.\addBulkUsersToDistGroup.ps1
```
The script will:
- Read each email from the Excel file
- Verify that the recipient exists
- Add the contact to the specified distribution group
- Display warnings for any users not found

---

## Example Output

```
User not found: missing.user@example.com
Successfully added: user1@example.com
Successfully added: user2@example.com
```

---