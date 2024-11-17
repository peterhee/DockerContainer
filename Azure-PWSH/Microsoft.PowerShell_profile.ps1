function ll {
    param(
        [Parameter(Mandatory=$false, Position=1)]
        [string]$Path = $Null
    )
    if ( [string]::IsNullOrEmpty($Path) ) {
        ls -alhF
        }
    else {
        ls -alhF $Path
    }
}

function lsd {
    param(
        [Parameter(Mandatory=$false, Position=1)]
        [string]$Path = $Null
    )
    if ( [string]::IsNullOrEmpty($Path) ) {
        ls -alhF | grep ^d
    }
    else {
        ls -alhF $Path| grep ^d
    }
}
