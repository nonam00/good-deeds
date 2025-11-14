using Domain.Common;

namespace Domain.Models;

public class Category : Entity<Guid>
{
    public string Title { get; private init; } = null!;

    private Category() { }

    public static Category Create(string title)
    {
        if (string.IsNullOrWhiteSpace(title))
        {
            throw new ArgumentNullException(nameof(title), "Title cannot be empty");
        }

        var category = new Category
        {
            Id = Guid.NewGuid(),
            Title = title,
        };
        
        return category;
    }
}