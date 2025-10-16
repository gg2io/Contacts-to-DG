$users = Import-Excel -Path "D:\Users\george.surridge\Downloads\tonecontacts.xlsx"
foreach ($user in $users) {
    # Check if the mail contact already exists
    $existing = Get-MailContact -Filter "ExternalEmailAddress -eq '$($user.Email)'" -ErrorAction SilentlyContinue

    if ($existing -eq $null) {
        New-MailContact -Name $user.Email -ExternalEmailAddress $user.Email
    }
}


$group = "distgroup@example.com"

foreach ($user in $users) {
    $contact = Get-MailContact -Filter "ExternalEmailAddress -eq '$($user.Email)'" -ErrorAction SilentlyContinue

    if ($contact -ne $null) {
        Add-DistributionGroupMember -Identity $group -Member $contact.Alias
    } else {
        Write-Warning "Mail contact not found or could not be created for: $($user.Email)"
    }
}