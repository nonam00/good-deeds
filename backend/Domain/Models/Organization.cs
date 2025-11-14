using Domain.Common;
using Domain.ValueObjects;

namespace Domain.Models;

public class Organization : AggregateRoot<Guid>
{
    public string Title { get; private init; } = null!;
    public string Description { get; private init; } = null!;
    public string Phone { get; private init; } = null!;
    public string Address { get; private init; } = null!;
    public Coordinates Coordinates { get; private init; } = null!;
    public string Link { get; private init; } = null!;
    public string LogoPath { get; private init; } = null!;
    public DateTime CreatedAt { get; private init; }

    public Guid CategoryId { get; private init; }
    public virtual Category Category { get; private init; } = null!;
    
    // Nullable user for tests
    public Guid? UserId { get; private init; }
    public virtual User? User { get; private init; }

    private Organization() { }

    public static Organization Create(Guid userId, Guid categoryId,
        string title, string description,
        string phone, string address, Coordinates coordinates, string link, string logoPath)
    {
        var organization = new Organization
        {
            Id = Guid.NewGuid(),
            Title = title,
            Description = description,
            Address = address,
            Coordinates = coordinates,
            Phone = phone,
            Link = link,
            LogoPath = logoPath,
            UserId = userId,
            CategoryId = categoryId,
            CreatedAt = DateTime.UtcNow,
        };
        
        return organization;
    }
}