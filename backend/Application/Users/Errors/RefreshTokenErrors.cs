using Application.Shared.Data;

namespace Application.Users.Errors;

public static class RefreshTokenErrors
{
    public static readonly Error NotFound = new(
        nameof(NotFound),
        "Refresh токен не существует");
    
    public static readonly Error RelevantNotFound = new(
        nameof(RelevantNotFound),
        "Refresh токен не существует или истёк срок его действия");
}