using Domain.Common;
using Domain.Events;
using Domain.ValueObjects;

namespace Domain.Models;

public class User : AggregateRoot<Guid>
{
    public string Email { get; private init; } = null!;
    public string PasswordHash { get; private set; } = null!;
    public string FirstName { get; private set; } = null!;
    public string LastName { get; private set; } = null!;
    public bool IsActive { get; private set; }
    public DateTime CreatedAt { get; private init; }
    
    public Guid OrganizationId { get; private init; }
    public virtual Organization? Organization { get; private set; }
    
    
    private readonly List<RefreshToken> _refreshTokens = [];
    public IReadOnlyCollection<RefreshToken> RefreshTokens => _refreshTokens.AsReadOnly();

    private User() { }

    public static User Create(string email, string passwordHash, string firstName, string lastName)
    {
        var user = new User
        {
            Id = Guid.NewGuid(),
            Email = email,
            PasswordHash = passwordHash,
            FirstName = firstName,
            LastName = lastName,
            IsActive = false,
            CreatedAt = DateTime.UtcNow,
        };
        
        user.AddDomainEvent(new UserRegisteredEvent(user.Id, user.Email));
        return user;
    }
    
    public void ChangePassword(string newPasswordHash)
    {
        PasswordHash = newPasswordHash;
    }

    public void Activate()
    {
        IsActive = true;
    }

    public RefreshToken AddRefreshToken(string token, DateTime expires)
    {
        var refreshToken = RefreshToken.Create(Id, token, expires);
        _refreshTokens.Add(refreshToken);
        return refreshToken;
    }

    public Organization CreateOrganization(
        Guid categoryId, string title, string description,
        string phone, string address, Coordinates coordinates, string link, string logoPath)
    {
        var organization = Organization.Create(Id, categoryId, title, description, phone, address, coordinates, link, logoPath);
        Organization = organization;
        return organization;
    }
    
}