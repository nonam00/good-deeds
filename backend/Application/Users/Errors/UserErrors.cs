using Application.Shared.Data;

namespace Application.Users.Errors;

public static class UserErrors
{
    public static readonly Error NotFound = new(
        nameof(NotFound),
        "Пользователь не найден.");
    
    public static readonly Error NotFoundWithEmail = new(
        nameof(NotFoundWithEmail),
        "Пользователь с такой почтой не существует.");
    
    public static readonly Error AlreadyExist = new(
        nameof(AlreadyExist),
        "Пользователь уже существует.");

    public static readonly Error AlreadyExistButNotActive = new(
        nameof(AlreadyExistButNotActive),
        "Активируйте свой аккаунт.");

    public static readonly Error InvalidCredentials = new(
        nameof(InvalidCredentials),
        "Неверная почта или пароль.");
    
    public static readonly Error PasswordsMissMatch = new(
        nameof(PasswordsMissMatch),
        "Пароли должны совпадать."); 
    
    public static readonly Error InvalidVerificationCode = new(
        nameof(InvalidVerificationCode),
        "Неверный код подтверждения.");
}