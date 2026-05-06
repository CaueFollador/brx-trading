fun toQueryString(params) =
    params 
    mapObject ((value, key) -> {(key): value as String})
    pluck ((value, key) -> (key as String) ++ "=" ++ value)
    joinBy "&"