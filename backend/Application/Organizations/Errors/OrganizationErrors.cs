using Application.Shared.Data;

namespace Application.Organizations.Errors;

public static class OrganizationErrors
{
    public static readonly Error NotFound = new(
        nameof(NotFound),
        "Организация не найдена.");
}